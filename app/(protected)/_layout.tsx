import React from 'react';

import { useColorScheme } from '@/hooks/useColorScheme';
import { Tabs } from 'expo-router';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function ProtectedLayout() {
  const colorScheme = useColorScheme();

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <Tabs>
        <Tabs.Screen name="contacts" options={{ headerShown: false }} />
      </Tabs>
    </SafeAreaView>
  );
}