import { queries } from "@/frontend/queries/queries";
import {
  RealtimeEvents,
  useBroadcastSubscription,
} from "./useRealtimeSubscription";

export const useBroadcastContactsSubscription = () => {
  return useBroadcastSubscription(
    "contacts",
    { ...queries.contacts.list },
    RealtimeEvents.contacts_update
  );
};

export const useBroadcastChatsSubscription = () => {
  return useBroadcastSubscription(
    "chats",
    { queryKey: queries.chats._def },
    RealtimeEvents.chats_update
  );
};
