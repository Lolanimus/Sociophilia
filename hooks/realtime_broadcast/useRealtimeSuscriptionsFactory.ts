import { queries } from "@/queries/queries";
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
    { ...queries.chats.list },
    RealtimeEvents.chats_update
  );
};
