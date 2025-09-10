import { DarkTheme, DefaultTheme, ThemeProvider } from '@react-navigation/native';
import React, { use } from 'react';

import { AuthContext, AuthProvider } from '@/contexts/AuthContext';
import { useColorScheme } from '@/hooks/useColorScheme';
import { Stack } from 'expo-router';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function RootLayout() {
  const colorScheme = useColorScheme();
  const { isLoggedIn } = use(AuthContext);

  console.log(isLoggedIn);

  return (
    <AuthProvider>
      <ThemeProvider value={colorScheme === 'dark' ? DarkTheme : DefaultTheme}>
        <SafeAreaView style={{ flex: 1 }}>
          { !isLoggedIn ? 
            <Stack>
              <Stack.Screen name="(authentication)" />
            </Stack>
            :
            <Stack>
              <Stack.Screen name="(protected)" />
            </Stack>
          }
        </SafeAreaView>
      </ThemeProvider>
    </AuthProvider>
  );
}
