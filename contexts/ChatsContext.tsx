import { Chat, ChatParticipant } from "@/types/api.types";
import log from "@/utils/logger";
import supabase from "@/utils/supabase";
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
      const { data: currentUserData } = await supabase.auth.getUser();
      const currentUserId = currentUserData?.user?.id;
      const { data: otherUser } = await supabase
        .from("user")
        .select("id")
        .eq("username", otherUsername)
        .single();

      const otherUserId = otherUser?.id;

      const { data: chat, error } = await supabase
        .from("chats")
        .insert({ metadata: {} })
        .select()
        .single();

      if (error) {
        log.error("Error creating chat:", error);
        setError(error.message);
        return -1;
      }
      const newParticipants = [
        { chat_id: chat.id, participant_id: currentUserId, metadata: {} },
        { chat_id: chat.id, participant_id: otherUserId, metadata: {} },
      ];
      const { error: partError } = await supabase
        .from("chat_participants")
        .insert(newParticipants);

      if (partError) {
        log.error("Error adding participants:", partError);
        setError(partError.message);
        return null;
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
