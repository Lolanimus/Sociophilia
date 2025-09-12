import React from 'react';

import { ContactsProvider } from '@/contexts/ContactsContext';
import { useColorScheme } from '@/hooks/useColorScheme';
import { Stack } from 'expo-router';

export default function ContactsLayout() {
  const colorScheme = useColorScheme();

  return (
    <ContactsProvider>
      <Stack>
        <Stack.Screen name="add" options={{ title: "Add a new Contact" }}/>
        <Stack.Screen name="list" options={{ title: "Contacts List" }}/>
      </Stack>
    </ContactsProvider>
  );
}

