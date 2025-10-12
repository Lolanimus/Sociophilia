import { Enums } from "./database-generated.types";

// user_contact return types

interface ContactsMeta {
  total_contacts: number;
  page_limit: number;
  page_offset: number;
}

interface ContactsData {
  user_id: string;
  username: string;
  status: Enums<"user_friend_status">;
  requester_pos?: Exclude<Enums<"user_friend_status">, "APPROVED">;
  email?: string;
  phone_number?: string;
}

interface ContactsResponse {
  meta: ContactsMeta;
  data: ContactsData[];
}

interface Chat {
  id: string;
  chat_type: Enums<"chat_type">;
  metadata: JSON;
}

interface ChatParticipant {
  chatId: string;
  participantId: string;
}

interface Message {
  id: string;
  sender_id: string;
  chat_id: string;
  contents: string;
  created_at: Date;
  metadata: JSON;
}

interface Messages {
  messages: Message[];
  nextCursor: number | null;
}

export {
  Message,
  Messages,
  Chat,
  ChatParticipant,
  ContactsData,
  ContactsMeta,
  ContactsResponse,
};
