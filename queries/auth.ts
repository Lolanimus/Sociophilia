import {
  createQueryKeys,
  mergeQueryKeys,
} from "@lukemorales/query-key-factory";

export const auth = createQueryKeys("auth", {
  user,
});
