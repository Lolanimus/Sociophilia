import { create } from "zustand";

interface Error {
  error: string | null;
  actions: {
    setError: (error: string | null) => void;
  };
}

const useErrorStore = create<Error>((set) => ({
  error: null,
  actions: {
    setError: (error: string | null) => set(() => ({ error: error })),
  },
}));

// Export store instance for direct access in non-React contexts
export const errorStore = useErrorStore;

export const useError = () => useErrorStore((state) => state.error);
export const useErrorActions = () => useErrorStore((state) => state.actions);
