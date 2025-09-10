import { DarkTheme, DefaultTheme, ThemeProvider } from '@react-navigation/native';
import React, { use } from 'react';

import { AuthContext, AuthProvider } from '@/contexts/AuthContext';
import { useColorScheme } from '@/hooks/useColorScheme';
import { Stack } from 'expo-router';

export default function RootLayout() {
  const colorScheme = useColorScheme();
  const { isLoggedIn } = use(AuthContext);

  console.log(isLoggedIn);

  return (
    <AuthProvider>
      <ThemeProvider value={colorScheme === 'dark' ? DarkTheme : DefaultTheme}>
          { !isLoggedIn ? 
            <Stack screenOptions={{
              headerShown: false
            }}>
              <Stack.Screen name="(authentication)" />
            </Stack>
            :
            <Stack screenOptions={{
              headerShown: false,
            }}>
              <Stack.Screen name="(protected)" />
            </Stack>
          }
      </ThemeProvider>
    </AuthProvider>
  );
}
