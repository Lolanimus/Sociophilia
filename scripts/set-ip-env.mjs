#!/usr/bin/env node

import fs from 'fs';
import { internalIpV4 } from 'internal-ip';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

async function setIpAddress() {
  try {
    // Get the local IP address
    const ip = await internalIpV4();
    
    if (!ip) {
      console.error('Error: Could not determine IP address');
      process.exit(1);
    }

    console.log(`Found IP address: ${ip}`);

    const projectRoot = path.resolve(__dirname, '..');
    const envFiles = ['.env.local', '.env'];

    for (const envFile of envFiles) {
      const envPath = path.join(projectRoot, envFile);
      
      if (fs.existsSync(envPath)) {
        let content = fs.readFileSync(envPath, 'utf8');
        
        // Update or add EXPO_PUBLIC_SUPABASE_URL
        const urlPattern = /^EXPO_PUBLIC_SUPABASE_URL=.*$/m;
        const newUrl = `EXPO_PUBLIC_SUPABASE_URL=http://${ip}:54321`;
        
        if (urlPattern.test(content)) {
          content = content.replace(urlPattern, newUrl);
          console.log(`Updated ${envFile} with IP address: ${ip}`);
        } else {
          content += `\n${newUrl}\n`;
          console.log(`Added EXPO_PUBLIC_SUPABASE_URL to ${envFile}`);
        }
        
        fs.writeFileSync(envPath, content);
      } else {
        console.log(`Warning: ${envFile} not found, skipping...`);
      }
    }
  } catch (error) {
    console.error('Error setting IP address:', error);
    process.exit(1);
  }
}

setIpAddress();