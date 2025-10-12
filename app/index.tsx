import { Redirect } from "expo-router";
import { useUser } from "@/states_store/userState";
import { useLoading } from "@/states_store/loadingState";
import { View, ActivityIndicator } from "react-native";

export default function Index() {
  const user = useUser();
  const isLoading = useLoading();

  if (isLoading) {
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <ActivityIndicator size="large" />
      </View>
    );
  }

  if (user) {
    return <Redirect href="/(protected)/(contacts)/list" />;
  }

  return <Redirect href="/(authentication)/login" />;
}
