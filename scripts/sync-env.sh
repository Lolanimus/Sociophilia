#!/usr/bin/env bash

# Usage: ./sync-env.sh [local|production]

# Get the project root directory (parent of scripts/)
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

if [ -z "$1" ]; then
  echo "Usage: ./sync-env.sh [local|production]"
  exit 1
fi

TARGET=".env.local"
if [ "$1" = "local" ]; then
  ENV="development"
elif [ "$1" = "production" ]; then
  ENV="production"
else
  echo "Invalid argument. Use 'local' or 'production'"
  exit 1
fi

echo "Pulling environment variables from EAS ($ENV)..."
eas env:pull $ENV --path .env.eas

if [ $? -eq 0 ]; then
  echo "Merging with $TARGET..."

  # Create temporary file for merged vars
  TEMP_FILE=$(mktemp)

  # Copy EAS vars first
  grep -v '^#' .env.eas | grep -v '^$' > "$TEMP_FILE"

  # Add existing local vars that aren't in EAS
  if [ -f "$TARGET" ]; then
    while IFS='=' read -r key value; do
      # Skip comments and empty lines
      if echo "$key" | grep -qE '^#|^$'; then
        continue
      fi
      # Only add if not already in EAS vars
      if ! grep -q "^${key}=" "$TEMP_FILE"; then
        echo "${key}=${value}" >> "$TEMP_FILE"
      fi
    done < "$TARGET"
  fi

  # Write to target file with header
  echo "# Environment: $ENV" > "$TARGET"
  echo "" >> "$TARGET"
  cat "$TEMP_FILE" >> "$TARGET"

  rm "$TEMP_FILE"
  rm .env.eas

  # Add IP address for local environment after merge
  if [ "$1" = "local" ]; then
    bash ./scripts/set_ip_addr_env_var.sh
  fi

  # Copy the environment-specific file to .env for Expo to use
  cp "$TARGET" .env
  echo "✅ Successfully synced to $TARGET and copied to .env"
else
  echo "❌ Failed to pull from EAS"
  exit 1
fi
