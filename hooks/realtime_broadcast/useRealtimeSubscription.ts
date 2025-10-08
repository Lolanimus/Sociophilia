import { queryClient } from "@/queries/queries";
import { userStore } from "@/states_store/userState";
import log from "@/utils/logger";
import supabase from "@/utils/supabase";
import { InvalidateQueryFilters, useQueryClient } from "@tanstack/react-query";
import { useEffect } from "react";

export enum RealtimeEvents {
  contacts_update = "contacts_update",
  chats_update = "chats_update",
}

export const useBroadcastSubscription = (
  filter: string,
  queryKey: InvalidateQueryFilters,
  event_name: RealtimeEvents,
  user_id: string = userStore.getState().user!.id
) => {
  useEffect(() => {
    supabase.auth.getSession().then((resp) => {
      supabase.realtime.setAuth(resp?.data?.session?.access_token || null);

      const channel = supabase.channel(`${user_id}:${filter}`, {
        config: { private: true },
      });

      if (user_id) {
        channel
          .on("broadcast", { event: RealtimeEvents.contacts_update }, () => {
            queryClient.invalidateQueries(queryKey);
            log.info(
              `${userStore.getState().user?.user_metadata.username} has received a message on ${channel.topic}`
            );
          })
          .subscribe((status) => {
            log.info(
              `${channel.topic} is ${status} by ${userStore.getState().user?.user_metadata.username}`
            );
          });
      }

      return () => {
        log.info("Cleaning up contact broadcast subsrciption");
        supabase.removeChannel(channel);
      };
    });
  }, [queryClient, supabase, user_id, queryKey, event_name, filter]);
};

export const useBroadcastChatSubscription = () => {};
