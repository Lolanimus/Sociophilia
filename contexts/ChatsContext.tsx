import { Chat, ChatParticipant } from '@/types/api.types';
import log from '@/utils/logger';
import supabase from '@/utils/supabase';
import { createContext, PropsWithChildren, useState } from 'react';

type ChatContextValue = {
  chats: Chat[];
  participant: ChatParticipant[];
  error: string | null;
  createChat: (participantIds: string[]) => Promise<string | null>;
}
const chatContext = createContext<ChatContextValue>({
  chats: [],
  participant: [],
  error: null,
  createChat: async () => null,
});

export function ChatProvider({children} : PropsWithChildren){
  const [chats, setChats] = useState<Chat[]>([]);
  const [participant, setParticipant] = useState <ChatParticipant[]>([]);
  const [error, setError] = useState<string | null>(null);

  const createChat = async (participantsId: string [])=> {
    const {data: chat, error} = await supabase
    .from("chat")
    .insert({})
    .select()
    .single();

    if (error) {
      log.error('Error creating chat:', error);
      setError(error.message);
      return -1;
    }

    const participants = participantsId.map(pid => ({
      chatId: chat.id,
      participantId: pid,
    }));
      const { error: partError } = await supabase
      .from("chat_participant")
      .insert(participants);
      
     if (partError) {
      log.error("Error adding participants:", partError);
      setError(partError.message);
      return null;
    }
    return chat.id;
  }
   return (
      <chatContext.Provider value={{
       chats,
       participant,
       error,
       createChat,
      }}>
        {children}
      </chatContext.Provider>
    );
}