import React from "react";
import { Stack } from "expo-router";
import { queries } from "@/queries/queries";
import { useQueryClient } from "@tanstack/react-query";

export default function ProtectedLayout() {
  const queryClient = useQueryClient();
  queryClient.prefetchQuery({ ...queries.contacts.list });
  queryClient.prefetchQuery({ ...queries.chats.list });

  return (
    <Stack
      screenOptions={{
        headerShown: false,
      }}
    >
      <Stack.Screen name="(contacts)" />
      <Stack.Screen name="(chats)" />
    </Stack>
  );
}
