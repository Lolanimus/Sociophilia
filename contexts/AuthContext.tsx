import log from '@/utils/logger';
import { supabase } from '@/utils/supabase';
import { AuthResponse, User } from '@supabase/supabase-js';
import { useRouter } from 'expo-router';
import { createContext, PropsWithChildren, useState } from 'react';

type AuthContextValue = {
  isLoggedIn: boolean,
  processing: boolean,
  login: (email: string, password: string) => Promise<number>,
  signup: (email: string, username: string, password: string) => Promise<number>,
  logout: () => Promise<number>,
  scopes: string[],
  setScopes: (scopes: string[]) => void,
  error: string | null,
  setError: React.Dispatch<React.SetStateAction<string | null>>
}

export const AuthContext = createContext<AuthContextValue>({
  isLoggedIn: false,
  processing: false,
  login: async () => { return 0; },
  signup: async () => { return 0; },
  logout: async () => { return 0; },
  scopes: [],
  setScopes: () => {},
  error: null,
  setError: () => {}
})

export function AuthProvider({children}: PropsWithChildren) {
  const [processing, setProcessing] = useState(false);
  const [scopes, setScopes] = useState<string[]>([]);
  const [user, setUser] = useState<User | null>(null);
  const [error, setError] = useState<string | null>(null);
  const router = useRouter();

  const login = async (email: string, password: string) => {
    setProcessing(true);
      const { data, error } = await supabase.auth.signInWithPassword({
          email: email as string,
          password: password,
      });
    setProcessing(false);

    if (error) {
        log.error("Login Error: ", error);
        setError(error.message);
        return -1;
    }

    setUser(data.user);

    log.info("Successfully logged in!");

    router.replace("/(protected)/(contacts)/list");
    return 1;
  }

  const logout = async () => {
    const { error } = await supabase.auth.signOut();

    if (error) {
      log.error("Logout Error", error);
      setError(error.message);
      return -1;
    }

    log.info("Successfully logged out");
    router.replace("/(authentication)/login");
    return 1;
  }

  const signup = async (email: string, username: string, password: string) => {
    setProcessing(true);
      const { data, error } = await supabase.auth.signUp({
        email: email,
        password: password,
        options: {
          data: {
            username: username
          }
        }
      }) as AuthResponse;
    setProcessing(false);

    if (error) {
      log.error("Signup Error", error);
      setError(error.message);
      return -1;
    }

    setUser(data.user);

    log.info("Successfully signed up");

    return 1;
  }

  return (
    <AuthContext value={{
        isLoggedIn: !!user,
        processing,
        login,
        signup,
        logout,
        scopes,
        setScopes,
        error,
        setError
    }}>
        {children}
    </AuthContext>
  )
}

