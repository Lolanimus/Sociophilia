import { supabase } from '@/utils/supabase';
import { User } from '@supabase/supabase-js';
import { useRouter } from 'expo-router';
import { createContext, PropsWithChildren, useState } from 'react';

type AuthContextValue = {
  isLoggedIn: boolean,
  processing: boolean,
  login: (email: string, password: string) => Promise<number>,
  signup: (email: string, username: string, password: string) => Promise<number>,
  logout: () => Promise<number>,
  scopes: string[],
  setScopes: (scopes: string[]) => void
}

export const AuthContext = createContext<AuthContextValue>({
  isLoggedIn: false,
  processing: false,
  login: async () => { return 0; },
  signup: async () => { return 0; },
  logout: async () => { return 0; },
  scopes: [],
  setScopes: () => {}
})

export function AuthProvider({children}: PropsWithChildren) {
  const [processing, setProcessing] = useState(false);
  const [scopes, setScopes] = useState<string[]>([]);
  const [user, setUser] = useState<User | null>(null);
  const router = useRouter();

  const login = async (email: string, password: string) => {
    setProcessing(true);
      const { data, error } = await supabase.auth.signInWithPassword({
          email: email as string,
          password: password,
      });
    setProcessing(false);

    if (error) {
        console.log("error");
        console.log(error);
        return -1;
    }

    setUser(data.user);

    console.log("Successfully logged in!");

    router.replace("/(protected)/(contacts)/list");
    return 1;
  }

  const logout = async () => {
    const { error } = await supabase.auth.signOut();

    if (error) {
      console.log("error");
      console.log(error);
      return -1;
    }

    console.log("Successfully logged out");
    router.replace("/(authentication)/login");
    return 1;
  }

  const signup = async (email: string, username: string, password: string) => {
    setProcessing(true);
      const { data, error: auth_error } = await supabase.auth.signUp({
        email: email,
        password: password,
        options: {
          data: {
            username: username
          }
        }
      });

      const { error: user_error } = await supabase
        .from('user')
        .insert([{
          id: data.user?.id,
          email: data.user?.email,
          username: data.user?.user_metadata.username,
        }]);
    setProcessing(false);

    if (user_error) {
      console.log("user error");
      console.log(user_error);
      return -1;
    }

    if (auth_error) {
      console.log("auth error");
      console.log(auth_error);
      return -1;
    }

    setUser(data.user);

    console.log("Successfully signed up");
    console.log("user:");
    console.log(user);
    router.replace("/(protected)/(contacts)/list");
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
        setScopes
    }}>
        {children}
    </AuthContext>
  )
}

