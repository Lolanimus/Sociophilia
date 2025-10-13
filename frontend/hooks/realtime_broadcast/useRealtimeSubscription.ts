import { queries, queryClient } from "@/frontend/queries/queries";
import { userStore } from "@/frontend/states_store/userState";
import log from "@/utils/logger";
import supabase from "@/utils/supabase";
import { InvalidateQueryFilters } from "@tanstack/react-query";
import { useEffect } from "react";

export enum RealtimeEvents {
  contacts_update = "contacts_update",
  chats_update = "chats_update",
}

export const useBroadcastSubscription = (
  filter: string,
  queryKey: InvalidateQueryFilters,
  event_name: RealtimeEvents,
  userId: string = userStore.getState().user!.id
) => {
  useEffect(() => {
    supabase!.auth.getSession().then((resp) => {
      supabase!.realtime.setAuth(resp?.data?.session?.access_token || null);

      const channel = supabase!.channel(`${filter}:${userId}`, {
        config: { private: true },
      });

      if (userId) {
        channel
          .on("broadcast", { event: event_name }, () => {
            queryClient.invalidateQueries(queryKey);
            log.info(
              `${userStore.getState().user?.user_metadata.username} has received a message on ${channel.topic}`
            );
          })
          .subscribe((status) => {
            log.info(
              `topic ${channel.topic} for event ${event_name} is ${status} by ${userStore.getState().user?.user_metadata.username}`
            );
          });
      }

      return () => {
        log.info("Cleaning up contact broadcast subsrciption");
        supabase!.removeChannel(channel);
      };
    });
  }, [queryClient, supabase, userId, queryKey, event_name, filter]);
};
