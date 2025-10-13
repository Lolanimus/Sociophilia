import {
  DarkTheme,
  DefaultTheme,
  ThemeProvider,
} from "@react-navigation/native";
import { DevToolsBubble } from "react-native-react-query-devtools";
import { useColorScheme } from "@/frontend/hooks/useColorScheme";
import { Stack, Tabs } from "expo-router";
import { QueryClientProvider } from "@tanstack/react-query";
import { useUser } from "@/frontend/states_store/userState";
import { queryClient } from "@/frontend/queries/queries";
import { useLoading } from "@/frontend/states_store/loadingState";
import { useAuth } from "@/frontend/hooks/useAuth";

export default function Main() {
  useAuth();
  const colorScheme = useColorScheme();
  const user = useUser();
  const isLoading = useLoading();

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
          <Stack.Protected guard={!!user}>
            <Stack.Screen
              name="(protected)"
              options={{
                headerShown: false,
              }}
            />
          </Stack.Protected>
          <Stack.Screen
            name="(authentication)"
            options={{
              headerShown: false,
            }}
          />
        </Stack>
      </ThemeProvider>
      <DevToolsBubble onCopy={onCopy} queryClient={queryClient} />
    </QueryClientProvider>
  );
}
