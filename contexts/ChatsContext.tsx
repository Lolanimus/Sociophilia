import { Chat, ChatParticipant } from "@/types/api.types";
import log from "@/utils/logger";
import { supabase } from "@/utils/supabase";
import { createContext, PropsWithChildren, useState } from "react";

type ChatContextValue = {
  chats: Chat[];
  participants: ChatParticipant[];
  error: string | null;
  createChat: (otherUsername: string) => Promise<string | null>;
};
export const chatContext = createContext<ChatContextValue>({
  chats: [],
  participants: [],
  error: null,
  createChat: async () => null,
});

export function ChatProvider({ children }: PropsWithChildren) {
  const [chats, setChats] = useState<Chat[]>([]);
  const [participants, setParticipant] = useState<ChatParticipant[]>([]);
  const [error, setError] = useState<string | null>(null);

  const createChat = async (otherUsername: string) => {
    try {
      const { data: chat, error } = await supabase.rpc("create_direct_chat", {
        target_username: otherUsername,
      });

      if (error) {
        log.error("Error creating chat:", error);
        setError(error.message);
        return -1;
      }

      return chat.id;
    } catch (err: any) {
      setError(err.message);
      log.error(err.message);
      return null;
    }
  };
  return (
    <chatContext.Provider
      value={{
        chats,
        participants,
        error,
        createChat,
      }}
    >
      {children}
    </chatContext.Provider>
  );
}
