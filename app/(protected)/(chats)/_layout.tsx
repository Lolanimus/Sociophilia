import { ChatProvider } from '@/contexts/ChatsContext';
import { useColorScheme } from "@/hooks/useColorScheme";
import { Stack } from 'expo-router';
import React from "react";
export default function ContactsLayout() {
    const colorScheme = useColorScheme();

  return (
    <ChatProvider>
       <Stack>
        <Stack.Screen name="[id]" options={{ title: "Chat" }} />
      </Stack>
    </ChatProvider>
  );
}
