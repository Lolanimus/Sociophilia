import React from "react";
import { Stack } from "expo-router";

export default function ContactsLayout() {
  return (
    <Stack>
      <Stack.Screen name="list" options={{ title: "Contacts List" }} />
      <Stack.Screen name="add" options={{ title: "Add a new Contact" }} />
    </Stack>
  );
}
