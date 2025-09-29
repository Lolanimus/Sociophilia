import {
  DarkTheme,
  DefaultTheme,
  ThemeProvider,
} from "@react-navigation/native";
import React, { use, useEffect } from "react";

import { useColorScheme } from "@/hooks/useColorScheme";
import { Stack } from "expo-router";
import { useAuth } from "@/hooks/useAuth";
import log from "@/utils/logger";

export default function RootLayout() {
  const colorScheme = useColorScheme();
  const isAuthenticated = !!useAuth().isAuthenticated;

  return (
    <ThemeProvider value={colorScheme === "dark" ? DarkTheme : DefaultTheme}>
      <Stack screenOptions={{ headerShown: false }}>
        <Stack.Protected guard={!isAuthenticated}>
          <Stack.Screen name="(authentication)" />
        </Stack.Protected>
        <Stack.Protected guard={isAuthenticated}>
          <Stack.Screen name="(protected)" />
        </Stack.Protected>
      </Stack>
    </ThemeProvider>
  );
}
