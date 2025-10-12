#!/bin/bash

# Drop the realtime schema and recreate it so that the realtime container
# is forced to reinitialize everything in the schema.
psql "postgresql://supabase_admin:postgres@localhost:54322/postgres" <<EOF
  DROP SCHEMA IF EXISTS realtime CASCADE;
  CREATE SCHEMA realtime;
EOF

if [ $? -ne 0 ]; then
  echo "Error: Failed to fix local realtime schema."
  exit 1
fi

# Find container ID with name containing "realtime"
container_id=$(docker ps --filter "name=realtime*" --format "{{.ID}}")

# Check if a container was found
if [ -z "$container_id" ]; then
  echo "No Docker container with name containing 'realtime' found."
  exit 1
fi

docker restart "$container_id"