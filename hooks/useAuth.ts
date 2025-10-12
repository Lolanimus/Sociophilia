import { useEffect } from "react";
import supabase from "@/utils/supabase";
import { userStore } from "@/states_store/userState";
import { queryClient } from "@/queries/queries";
import log from "@/utils/logger";
import { loadingStore } from "@/states_store/loadingState";

export const useAuth = () => {
  useEffect(() => {
    // Get initial session
    const getSession = async () => {
      try {
        const {
          data: { session },
        } = await supabase.auth.getSession();
        userStore.getState().actions.setUser(session?.user ?? null);
        loadingStore.getState().actions.setLoading(false);
      } catch (err) {
        log.error(err);
      }
    };

    getSession();

    // Listen for auth state changes
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((event, session) => {
      const newUser = session?.user ?? null;
      const currentUser = userStore.getState().user;

      // If user changed, clear all queries
      if (currentUser?.id !== newUser?.id) {
        queryClient.clear();
      }

      userStore.getState().actions.setUser(newUser);
    });

    return () => {
      subscription?.unsubscribe();
      userStore.getState().actions.setUser(null);
    };
  }, []);
};

// export const useSignOut = () => {
//   const queryClient = useQueryClient();

//   return useMutation({
//     onMutate: () => signout(),
//     onSuccess: () => {
//       queryClient.clear();
//     },
//   });
// };

// export const useLogin = () => {
//   const queryClient = useQueryClient();

//   return useMutation({
//     onMutate: (creds: z.infer<typeof UserLoginCreds>) => login(creds),
//     onSuccess: () => {
//       log.info(userStore.getState().user);
//       queryClient.invalidateQueries();
//     },
//   });
// };

// export const useSignup = () => {
//   const queryClient = useQueryClient();

//   return useMutation({
//     onMutate: (creds: z.infer<typeof UserSignUpCreds>) => signup(creds),
//     onSuccess: () => {
//       queryClient.invalidateQueries();
//     },
//   });
// };
