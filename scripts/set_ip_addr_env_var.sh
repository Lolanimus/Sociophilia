#!/bin/bash

# Get the IP address of the wlp0s20f3 interface
IP_ADDRESS=$(ip -4 addr show wlp0s20f3 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Check if IP address was found
if [ -z "$IP_ADDRESS" ]; then
    echo "Error: Could not determine IP address for wlp0s20f3 interface"
    exit 1
fi

# Path to the .env.local file
ENV_FILE=".env.local"

# Update the EXPO_PUBLIC_SUPABASE_URL in .env.local with the current IP
if [ -f "$ENV_FILE" ]; then
    # Use sed to replace the IP address in the EXPO_PUBLIC_SUPABASE_URL line
    sed -i "s|EXPO_PUBLIC_SUPABASE_URL=\"http://[^:]*:54321\"|EXPO_PUBLIC_SUPABASE_URL=\"http://${IP_ADDRESS}:54321\"|" "$ENV_FILE"
    echo "Updated .env.local with IP address: $IP_ADDRESS"
else
    echo "Error: .env.local file not found"
    exit 1
fi