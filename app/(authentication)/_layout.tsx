import React from 'react';

import { useColorScheme } from '@/hooks/useColorScheme';
import { Tabs } from 'expo-router';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function AuthenticationLayout() {
  const colorScheme = useColorScheme();

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <Tabs>
        <Tabs.Screen name="login" options={{ headerShown: false }} />
        <Tabs.Screen name="signup" options={{ headerShown: false }} />
      </Tabs>
    </SafeAreaView>
  );
}