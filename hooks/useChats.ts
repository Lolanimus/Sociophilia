import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { queries } from "../queries/queries";
import { createDirectChat } from "@/dp_rpc/chat_rpc";

export const useChats = () => {
  return useQuery({
    ...queries.chats.list,
  });
};

export const useChatByUserId = (userId: string) => {
  return useQuery({
    ...queries.chats.detailByUserId(userId),
  });
};

export const useAddChat = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (userId: string) => await createDirectChat(userId),
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queries.chats._def,
      });
    },
  });
};
