import React from 'react';

import { useColorScheme } from '@/hooks/useColorScheme';
import { Tabs } from 'expo-router';

export default function ProtectedLayout() {
  const colorScheme = useColorScheme();

  return (
      <Tabs>
        <Tabs.Screen name="contacts"/>
      </Tabs>
  );
}