import { Enums } from "./database.types";

// user_contact return types

interface ContactsMeta {
  total_contacts: number;
  page_limit: number;
  page_offset: number;
}

interface ContactsData {
  username: string;
  status: Enums<'user_friend_status'>;
  requester_pos?: Exclude<Enums<'user_friend_status'>, 'APPROVED'>;
  email?: string;
  phone_number?: string;
}

interface ContactsResponse {
  meta: ContactsMeta;
  data: ContactsData[];
}

interface Chat{
  id: string,
  createdAt: Date;
}

interface ChatParticipant{
  chatId: string;
  participantId: string;
}
export { Chat, ChatParticipant, ContactsData, ContactsMeta, ContactsResponse };

