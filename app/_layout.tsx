import {
  DarkTheme,
  DefaultTheme,
  ThemeProvider,
} from "@react-navigation/native";
import { DevToolsBubble } from "react-native-react-query-devtools";
import { useColorScheme } from "@/hooks/useColorScheme";
import { Stack } from "expo-router";
import { QueryClientProvider } from "@tanstack/react-query";
import { useUser } from "@/states_store/userState";
import { useAuth } from "@/hooks/useAuth";
import { queryClient } from "@/queries/queries";

export default function RootLayout() {
  useAuth();
  const colorScheme = useColorScheme();
  const isAuth = !!useUser();
  // Define your copy function based on your platform
  const onCopy = async (text: string) => {
    try {
      await new Clipboard().writeText(text);
      return true;
    } catch {
      return false;
    }
  };

  return (
    <QueryClientProvider client={queryClient}>
      <ThemeProvider value={colorScheme === "dark" ? DarkTheme : DefaultTheme}>
        <Stack screenOptions={{ headerShown: false }}>
          <Stack.Protected guard={!isAuth}>
            <Stack.Screen name="(authentication)" />
          </Stack.Protected>
          <Stack.Protected guard={isAuth}>
            <Stack.Screen name="(protected)" />
          </Stack.Protected>
        </Stack>
      </ThemeProvider>
      <DevToolsBubble onCopy={onCopy} queryClient={queryClient} />
    </QueryClientProvider>
  );
}
