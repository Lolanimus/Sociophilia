import { Stack } from "expo-router";
import React from "react";
export default function ContactsLayout() {
  return (
    <Stack>
      <Stack.Screen name="[id]" options={{ title: "Chat" }} />
    </Stack>
  );
}
