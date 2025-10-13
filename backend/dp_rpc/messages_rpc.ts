import { processRpcRequest } from "@/backend/api/helpers";
import log from "@/utils/logger";

// 1. GET
// =======
// 1.2. Get Messages in the Chat(infinite query);
//      rpc("get_messages", { cursor: 20 });
// 1.1. Get Initial Messages on Startup(i.e. most 20 recent messages from the most 5 recent chats)
//      rpc("get_startup_data")

// 2. POST (Create)
// =======
// 2.1. Post 1 Message in the Chat
//      rpc("send_message", { chat_id, contents })

// 3. DELETE
// =======
// 3.1 Delete a message from the chat
//     rpc("delete_message", { message_id })
// 3.2 Delete messages from the chat
//     rpc("delete_messages", { message_id[] })

const getMessages = async (
  chat_id?: string,
  cursor: number = 0,
  limit: number = 20
) => {
  if (!chat_id) return null;
  const result = await processRpcRequest("get_messages", {
    p_chat_id: chat_id,
    p_cursor: cursor,
    p_limit: limit,
  });
  return result;
};

const createMessage = async (chat_id: string, contents: string) => {
  return await processRpcRequest("create_message", {
    p_chat_id: chat_id,
    p_contents: contents,
  });
};

const deleteMessages = async (msg_ids: string[]) => {
  return await processRpcRequest("delete_messages", {
    msg_ids: msg_ids,
  });
};

export { getMessages, createMessage, deleteMessages };
