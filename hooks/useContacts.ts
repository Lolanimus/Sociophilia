import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { queries } from "../queries/queries";
import {
  addContact,
  approveContact,
  deleteContact,
} from "@/dp_rpc/contact_rpc";

export const useContacts = () => {
  const query = useQuery({
    ...queries.contacts.list,
  });

  return query;
};

export const useAddContact = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (username: string) => await addContact(username),
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queries.contacts._def,
      });
    },
  });
};

export const useDeleteContact = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (userId: string) => await deleteContact(userId),
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queries.contacts._def,
      });
    },
  });
};

export const useApproveContact = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (userId: string) => await approveContact(userId),
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queries.contacts._def,
      });
    },
  });
};
