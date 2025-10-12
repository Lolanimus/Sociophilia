#!/bin/bash

# Start mitmproxy for intercepting Supabase traffic
# Usage: ./scripts/start_mitmproxy.sh

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the computer's IP address
HOST_IP=$(ip addr show | grep -E 'inet.*scope global' | grep -v '172\.' | awk '{print $2}' | cut -d/ -f1 | head -n1)

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}Starting mitmproxy for Supabase traffic interception${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${YELLOW}Configuration:${NC}"
echo -e "  Host IP:        ${GREEN}${HOST_IP}${NC}"
echo -e "  Proxy Port:     ${GREEN}8080${NC}"
echo -e "  Web Interface:  ${GREEN}http://127.0.0.1:8081${NC}"
echo -e "  Target:         ${GREEN}http://10.52.172.37:54321${NC}"
echo ""
echo -e "${YELLOW}Device Configuration:${NC}"
echo -e "  1. Go to your device's Wi-Fi settings"
echo -e "  2. Configure HTTP Proxy → Manual"
echo -e "  3. Server: ${GREEN}${HOST_IP}${NC}"
echo -e "  4. Port:   ${GREEN}8080${NC}"
echo ""
echo -e "${YELLOW}Filter for Supabase traffic:${NC}"
echo -e "  In mitmweb interface, use filter: ${GREEN}~d 10.52.172.37${NC}"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${GREEN}Starting mitmweb...${NC}"
echo ""

# Start mitmweb with configuration
mitmweb --listen-host 0.0.0.0 --listen-port 8080 --web-host 127.0.0.1 --web-port 8081 --set flow_detail=3 --showhost
