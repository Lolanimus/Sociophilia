import { createQueryKeys } from "@lukemorales/query-key-factory";
import * as chatEvents from "../dp_rpc/chat_rpc";

export const chats = createQueryKeys("chats", {
  list: {
    queryKey: null,
    queryFn: () => chatEvents.getClientChats(),
  },
  detailByUserId: (userId: string) => ({
    queryKey: ["user", userId],
    queryFn: () => chatEvents.getDirectChatByUserId(userId),
  }),
});
