import { processRpcRequest } from "@/api/helpers";

const createDirectChat = async (target_user_id: string) => {
  return await processRpcRequest("create_direct_chat", {
    target_user_id: target_user_id,
  });
};

const getClientChats = async () => {
  return await processRpcRequest("get_client_chats");
};

const getClientChat = async (chat_id: string) => {
  return await processRpcRequest("get_client_chat", {
    chat_id: chat_id,
  });
};

const getClientChatByUserId = async (target_user_id: string) => {
  return await processRpcRequest("get_client_chat_by_user_id", {
    target_user_id: target_user_id,
  });
};

export {
  createDirectChat,
  getClientChat,
  getClientChats,
  getClientChatByUserId,
};
