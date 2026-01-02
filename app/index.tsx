import { Colors } from "@/constants/Colors";
import { useLoading } from "@/states_store/loadingState";
import { useUser } from "@/states_store/userState";
import { Redirect } from "expo-router";
import { ActivityIndicator, useColorScheme, View } from "react-native";

export default function Index() {
  const user = useUser();
  const isLoading = useLoading();
  const colorScheme = useColorScheme();
  const backgroundColor = Colors[colorScheme ?? 'light'].background;

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
