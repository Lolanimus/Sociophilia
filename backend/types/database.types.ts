import {
  Chat,
  ContactsData,
  ContactsResponse,
  Message,
  Messages,
} from "./api.types";
import { Database as DatabaseGenerated } from "./database-generated.types";
import { MergeDeep } from "type-fest";

export type Database = MergeDeep<
  DatabaseGenerated,
  {
    public: {
      Functions: {
        add_contact: {
          Returns: ContactsData;
        };
        approve_contact: {
          Returns: boolean;
        };
        create_direct_chat: {
          Returns: Chat;
        };
        create_message: {
          Returns: Message;
        };
        delete_contact: {
          Returns: boolean;
        };
        delete_messages: {
          Returns: boolean;
        };
        get_client_chats: {
          Returns: Chat[];
        };
        get_contacts: {
          Returns: ContactsResponse;
        };
        get_direct_chat: {
          Returns: Chat;
        };
        get_direct_chat_by_user_id: {
          Returns: Chat;
        };
        get_messages: {
          Returns: Messages;
        };
        get_user_id_by_username: {
          Returns: string;
        };
      };
    };
  }
>;

export type Functions = Database["public"]["Functions"];
export type Function<T extends keyof Functions> = Functions[T];
