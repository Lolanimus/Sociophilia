import { createQueryKeys } from "@lukemorales/query-key-factory";
import * as contactEvents from "../dp_rpc/contact_rpc";

export const contacts = createQueryKeys("contacts", {
  list: {
    queryKey: null,
    queryFn: () => contactEvents.getContacts(),
  },
  detail: (userId: string) => ({
    queryKey: [userId],
    queryFn: () => contactEvents.getContact(userId),
  }),
});
