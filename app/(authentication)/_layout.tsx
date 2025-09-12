import React from 'react';

import { useColorScheme } from '@/hooks/useColorScheme';
import { Tabs } from 'expo-router';

export default function AuthenticationLayout() {
  const colorScheme = useColorScheme();

  return (
      <Tabs>
        <Tabs.Screen name="login" options={{ title: "Login" }}/>
        <Tabs.Screen name="signup" options={{ title: "Sign Up" }}/>
      </Tabs>
  );
}