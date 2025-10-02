import { create } from "zustand";
import { User as SupabaseUser } from "@supabase/supabase-js";

interface User {
  user: SupabaseUser | null;
  actions: {
    setUser: (user: SupabaseUser | null) => void;
  };
}

const useUserStore = create<User>((set) => ({
  user: null,
  actions: {
    setUser: (user: SupabaseUser | null) => set(() => ({ user: user })),
  },
}));

// Export store instance for direct access in non-React contexts
export const userStore = useUserStore;

export const useUser = () => useUserStore((state) => state.user);
export const useUserActions = () => useUserStore((state) => state.actions);
