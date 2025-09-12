import React from 'react';

import { useColorScheme } from '@/hooks/useColorScheme';
import { Stack } from 'expo-router';

export default function ProtectedLayout() {
  const colorScheme = useColorScheme();

  return (
      <Stack screenOptions={{
        headerShown: false
      }}>
        <Stack.Screen name="(contacts)"/>
      </Stack>
  );
}