import { useError, useErrorActions } from "@/states_store/errorStore";
import log from "@/utils/logger";
import supabase from "@/utils/supabase";
import { AuthError, User } from "@supabase/supabase-js";
import * as z from "zod";
import { processAuthRequest } from "./helpers";

const UserLoginCreds = z.object({
  email: z.string(),
  password: z.string(),
});

const UserSignUpCreds = z.object({
  ...UserLoginCreds.shape,
  username: z.string(),
});

const login = async (creds: z.infer<typeof UserLoginCreds>): Promise<void> => {
  processAuthRequest(async () => {
    const { data, error } = await supabase.auth.signInWithPassword(creds);

    if (error) throw error;

    log.info("Successfully logged in!");

    return data.user;
  });
};

const logout = async (): Promise<void> => {
  processAuthRequest(async () => {
    const { error } = await supabase.auth.signOut();

    if (error) throw error;

    log.info("Successfully logged out");
  });
};

const signup = async (
  creds: z.infer<typeof UserSignUpCreds>
): Promise<void> => {
  processAuthRequest(async () => {
    const { data, error } = await supabase.auth.signUp({
      email: creds.email,
      password: creds.password,
      options: {
        data: {
          username: creds.username,
        },
      },
    });

    if (error) throw error;

    log.info("Successfully signed up");

    return data.user!;
  });
};

export { login, logout, signup };
