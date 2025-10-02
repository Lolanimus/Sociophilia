import { createQueryKeys } from "@lukemorales/query-key-factory";
import * as chatEvents from "../dp_rpc/chat_rpc";

export const chats = createQueryKeys("chats", {
  list: {
    queryKey: null,
    queryFn: () => chatEvents.getClientChats(),
  },
  detailByChatId: (chatId: string) => ({
    queryKey: ["chat", chatId],
    queryFn: () => chatEvents.getClientChat(chatId),
  }),
  detailByUserId: (userId: string) => ({
    queryKey: ["user", userId],
    queryFn: () => chatEvents.createDirectChat(userId),
  }),
});
