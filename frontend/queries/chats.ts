import { createQueryKeys } from "@lukemorales/query-key-factory";
import * as messageEvents from "../../backend/dp_rpc/messages_rpc";
import * as chatEvents from "../../backend/dp_rpc/chat_rpc";

export const chats = createQueryKeys("chats", {
  list: {
    queryKey: null,
    queryFn: () => chatEvents.getClientChats(),
  },
  detailByUserId: (userId: string) => ({
    queryKey: ["user", userId],
    queryFn: () => chatEvents.getDirectChatByUserId(userId),
  }),

  // Messages
  messages: (chatId?: string) => ({
    queryKey: [chatId],
    queryFn: () => messageEvents.getMessages(chatId),
  }),
  infiniteMessages: (chatId?: string, limit?: number) => ({
    queryKey: [chatId, "infinite"],
    queryFn: ({ pageParam }: { pageParam: number }) =>
      messageEvents.getMessages(chatId, pageParam, limit),
  }),
});
