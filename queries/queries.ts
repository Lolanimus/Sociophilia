import { mergeQueryKeys } from "@lukemorales/query-key-factory";
import { contacts } from "./contacts";
import { QueryClient } from "@tanstack/react-query";
import { chats } from "./chats";

export const queries = mergeQueryKeys(contacts, chats);
export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: Infinity,
    },
  },
});
