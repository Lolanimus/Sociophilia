import React from "react";
import { Tabs } from "expo-router";

export default function AuthenticationLayout() {
  return (
    <Tabs>
      <Tabs.Screen name="login" options={{ title: "Login" }} />
      <Tabs.Screen name="signup" options={{ title: "Sign Up" }} />
    </Tabs>
  );
}
