import log from "@/utils/logger";
import supabase from "@/utils/supabase";
import * as z from "zod";
import { processAuthRequest } from "./helpers";
import { User } from "@supabase/supabase-js";
import { userStore } from "@/states_store/userState";

export const UserLoginCreds = z.object({
  email: z.string(),
  password: z.string(),
});

export const UserSignUpCreds = z.object({
  ...UserLoginCreds.shape,
  username: z.string(),
});

const login = async (
  creds: z.infer<typeof UserLoginCreds>
): Promise<User | null> => {
  const user = await processAuthRequest(async () => {
    const { data, error } = await supabase!.auth.signInWithPassword(creds);

    if (error) throw error;

    log.info("Successfully logged in!");

    return data.user;
  });

  userStore.getState().actions.setUser(user);

  return user;
};

const signout = async (): Promise<void> => {
  processAuthRequest(async () => {
    const { error } = await supabase!.auth.signOut();

    if (error) throw error;

    log.info("Successfully logged out");
  });

  userStore.getState().actions.setUser(null);
};

const supabaseUrl = process.env.EXPO_PUBLIC_SUPABASE_URL!;

const signup = async (
  creds: z.infer<typeof UserSignUpCreds>
): Promise<User | null> => {
  const user = await processAuthRequest(async () => {
    // Prefer redirecting back to the current app origin on web
    const emailRedirectTo =
      typeof window !== "undefined"
        ? window.location.origin
        : process.env.EXPO_PUBLIC_SITE_URL || supabaseUrl;

    const { data, error } = await supabase!.auth.signUp({
      email: creds.email,
      password: creds.password,
      options: {
        data: {
          username: creds.username,
        },
        emailRedirectTo,
      },
    });

    if (error) throw error;

    log.info("Successfully signed up");

    return data.user!;
  });

  userStore.getState().actions.setUser(user);

  return user;
};

export { login, signout, signup };
