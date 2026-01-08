import { Colors } from "@/constants/Colors";
import { useLoading } from "@/states_store/loadingState";
import { useUser } from "@/states_store/userState";
import supabase from "@/utils/supabase";
import { Redirect } from "expo-router";
import { useEffect } from "react";
import { ActivityIndicator, useColorScheme, View } from "react-native";

export default function Index() {
  const user = useUser();
  const isLoading = useLoading();
  const colorScheme = useColorScheme();
  const backgroundColor = Colors[colorScheme ?? 'light'].background;

  useEffect(() => {
    // Check for session in URL (works as backup if detectSessionInUrl has issues)
    const checkSessionFromUrl = async () => {
      if (typeof window !== 'undefined') {
        const { data } = await supabase!.auth.getSession();
        if (data.session) {
          // Session will be set via onAuthStateChange in useAuth
        }
      }
    };
    checkSessionFromUrl();
  }, []);
  
  if (isLoading) {
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center", backgroundColor }}>
        <ActivityIndicator size="large" />
      </View>
    );
  }

  if (user) {
    return <Redirect href="/(protected)/(contacts)/list" />;
  }

  return <Redirect href="/(authentication)/login" />;
}
