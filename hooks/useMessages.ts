import { createDirectChat } from "@/dp_rpc/chat_rpc";
import { createMessage, deleteMessages } from "@/dp_rpc/messages_rpc";
import { queries } from "@/queries/queries";
import { Message, Messages } from "@/types/api.types";
import log from "@/utils/logger";
import {
  useInfiniteQuery,
  useMutation,
  useQuery,
  useQueryClient,
} from "@tanstack/react-query";

export const useMessages = (chatId?: string) => {
  const query = useQuery({
    ...queries.chats.messages(chatId),
    enabled: !!chatId,
  });

  return query;
};

export const useInfiniteMessages = (chatId?: string, limit?: number) => {
  const query = useInfiniteQuery({
    ...queries.chats.infiniteMessages(chatId, limit),
    initialPageParam: 0,
    getNextPageParam: (lastPage: Messages) => lastPage?.nextCursor,
    enabled: !!chatId,
  });

  return query;
};

export const useSendMessage = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async ({
      contents,
      opts,
    }: {
      contents: string;
      opts: {
        chatId?: string;
        targetId?: string;
      };
    }) => {
      let chatId = opts.chatId;

      // If no chatId, create the direct chat first
      if (!chatId && opts.targetId) {
        const newChat = await createDirectChat(opts.targetId);
        chatId = newChat?.id;
      }

      // If still no chatId, throw error
      if (!chatId) {
        throw new Error("Cannot send message: no chat ID available");
      }

      // Send the message
      return await createMessage(chatId, contents);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queries.chats._def,
      });
    },
  });
};

export const useDeleteMessages = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (msgIds: string[]) => await deleteMessages(msgIds),
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queries.chats._def,
      });
    },
  });
};

export const useDeleteMessage = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (msgId: string) => await deleteMessages([msgId]),
    onSuccess: () => {
      log.info("Deletion of a message returned success");
      queryClient.invalidateQueries({
        queryKey: queries.chats._def,
      });
    },
  });
};
