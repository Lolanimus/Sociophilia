#!/bin/sh

# Usage: ./sync-env.sh [local|production]

# Get the project root directory (parent of scripts/)
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

if [ -z "$1" ]; then
  echo "Usage: ./sync-env.sh [local|production]"
  exit 1
fi

TARGET_ENV_FILE=".env"
if [ "$1" = "local" ]; then
  ENV="development"
elif [ "$1" = "production" ]; then
  ENV="production"
else
  echo "Invalid argument. Use 'local' or 'production'"
  exit 1
fi

# If .env exists, delete it
if [ -f "$TARGET_ENV_FILE" ]; then
  rm "$TARGET_ENV_FILE"
fi

if [ "$1" = "production" ]; then
  # Create or overwrite .env file
  cat > "$TARGET_ENV_FILE" << EOF
  EXPO_PUBLIC_SUPABASE_URL=$EXPO_PUBLIC_SUPABASE_URL
  EXPO_PUBLIC_SUPABASE_KEY=$EXPO_PUBLIC_SUPABASE_KEY
EOF

  echo "✅ Successfully synced to $TARGET_ENV_FILE"
  echo "EXPO_PUBLIC_SUPABASE_URL=$EXPO_PUBLIC_SUPABASE_URL"
  echo "EXPO_PUBLIC_SUPABASE_KEY=$EXPO_PUBLIC_SUPABASE_KEY"
  
  exit 0
fi

echo "Pulling environment variables from EAS ($ENV)..."
eas env:pull $ENV --path .env.eas

if [ $? -eq 0 ]; then
  echo "Merging with $TARGET_ENV_FILE..."

  # Create temporary file for merged vars
  TEMP_FILE=$(mktemp)

  # Copy EAS vars first
  grep -v '^#' .env.eas | grep -v '^$' > "$TEMP_FILE"

  # Add existing local vars that aren't in EAS
  if [ -f "$TARGET_ENV_FILE" ]; then
    while IFS='=' read -r key value; do
      # Skip comments and empty lines
      if echo "$key" | grep -qE '^#|^$'; then
        continue
      fi
      # Only add if not already in EAS vars
      if ! grep -q "^${key}=" "$TEMP_FILE"; then
        echo "${key}=${value}" >> "$TEMP_FILE"
      fi
    done < "$TARGET_ENV_FILE"
  fi

  # Write to TARGET_ENV_FILE file with header
  echo "# Environment: $ENV" > "$TARGET_ENV_FILE"
  echo "" >> "$TARGET_ENV_FILE"
  cat "$TEMP_FILE" >> "$TARGET_ENV_FILE"

  rm "$TEMP_FILE"
  rm .env.eas

  # Add IP address for local environment after merge
  if [ "$1" = "local" ]; then
    node ./scripts/set-ip-env.mjs
  fi

  # Copy the environment-specific file to .env for Expo to use
  echo "✅ Successfully synced to $TARGET_ENV_FILE"
else
  echo "❌ Failed to pull from EAS"
  exit 1
fi
