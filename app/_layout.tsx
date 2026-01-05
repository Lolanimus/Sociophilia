import { useAuth } from "@/hooks/useAuth";
import { useColorScheme } from "@/hooks/useColorScheme";
import { queryClient } from "@/queries/queries";
import { useLoading } from "@/states_store/loadingState";
import { useUser } from "@/states_store/userState";
import * as Clipboard from 'expo-clipboard';
import {
  DarkTheme,
  DefaultTheme,
  ThemeProvider,
} from "@react-navigation/native";
import { QueryClientProvider } from "@tanstack/react-query";
import { Stack } from "expo-router";
import { StatusBar } from "expo-status-bar";
import { DevToolsBubble } from "react-native-react-query-devtools";

export default function Main() {
  useAuth();
  const colorScheme = useColorScheme();
  const user = useUser();
  const isLoading = useLoading();

  // Define your copy function based on your platform
  const onCopy = async (text: string) => {
    try {
      await Clipboard.setString(text);
      return true;
    } catch {
      return false;
    }
  };

  const theme = colorScheme === "dark" ? DarkTheme : DefaultTheme;

  return (
    <QueryClientProvider client={queryClient}>
      <StatusBar style={colorScheme === "dark" ? "light" : "dark"} />
      <ThemeProvider value={theme}>
        <Stack 
          screenOptions={{ 
            headerShown: false,
            contentStyle: { backgroundColor: theme.colors.background }
          }}
        >
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
