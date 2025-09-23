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
export const ChatContext = createContext<ChatContextValue>({
  chats: [],
  participants: [],
  error: null,
  createChat: async () => null,
});

export function ChatProvider({ children }: PropsWithChildren) {
  const [chats, setChats] = useState<Chat[]>([]);
  const [participants, setParticipant] = useState<ChatParticipant[]>([]);
  const [error, setError] = useState<string | null>(null);

  const createChat = async (otherUsername: string): Promise<string | null> => {
    try {
      log.info("otherUsername", otherUsername);

      const { data, error } = await supabase.rpc("create_direct_chat", {
        target_username: otherUsername,
      })
      .single()
      .overrideTypes<Chat>();

      if (error) {
        log.error("Error creating chat:", error);
        setError(error.message);
        return null;
      }

      log.info("Chat created successfully:", data);
      return data!.id;
    } catch (err: any) {
      setError(err.message);
      log.error("Error on create_direct_chat call", err.message);
      return null;
    }
  };
  return (
    <ChatContext
      value={{
        chats,
        participants,
        error,
        createChat,
      }}
    >
      {children}
    </ChatContext>
  );
}
