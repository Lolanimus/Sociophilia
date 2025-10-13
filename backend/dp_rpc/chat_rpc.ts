import { processRpcRequest } from "@/backend/api/helpers";

const getClientChats = async () => {
  return await processRpcRequest("get_client_chats");
};

const getDirectChatByUserId = async (target_user_id: string) => {
  return await processRpcRequest("get_direct_chat_by_user_id", {
    target_user_id: target_user_id,
  });
};

const createDirectChat = async (target_user_id: string) => {
  return await processRpcRequest("create_direct_chat", {
    target_user_id: target_user_id,
  });
};

export { getClientChats, getDirectChatByUserId, createDirectChat };
