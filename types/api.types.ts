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

export { Chat, ChatParticipant, ContactsData, ContactsMeta, ContactsResponse };
