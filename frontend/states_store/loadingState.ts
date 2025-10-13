import { create } from "zustand";

interface Loading {
  loading: boolean;
  actions: {
    setLoading: (loading: boolean) => void;
  };
}

const useLoadingStore = create<Loading>((set) => ({
  loading: true,
  actions: {
    setLoading: (loading: boolean) => set(() => ({ loading: loading })),
  },
}));

// Export store instance for direct access in non-React contexts
export const loadingStore = useLoadingStore;

export const useLoading = () => useLoadingStore((state) => state.loading);
export const useLoadingActions = () =>
  useLoadingStore((state) => state.actions);
