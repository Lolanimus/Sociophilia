import AsyncStorage from "@react-native-async-storage/async-storage";
import { createClient, processLock } from "@supabase/supabase-js";
import * as aesjs from "aes-js";
import Constants from "expo-constants";
import * as SecureStore from "expo-secure-store";
import { Platform } from "react-native";
import "react-native-get-random-values";
import "react-native-url-polyfill/auto";
import log from "./logger";

// Get session namespace from URL parameter (for iframe-based split view on web)
const getSessionNamespace = (): string => {
  if (typeof window === "undefined" || Platform.OS !== "web") {
    return "default";
  }
  const urlParams = new URLSearchParams(window.location.search);
  return urlParams.get("session") || "default";
};

// Platform-aware storage adapter: AsyncStorage for web, SecureStore for mobile
class PlatformSecureStore {
  private largeSecureStore: LargeSecureStore;
  private namespace: string;

  constructor() {
    this.largeSecureStore = new LargeSecureStore();
    // On web, use namespace from URL for split view support
    this.namespace = Platform.OS === "web" ? getSessionNamespace() : "default";
  }

  private getKey(key: string): string {
    // Only namespace on web for split view
    if (Platform.OS === "web" && this.namespace !== "default") {
      return `${this.namespace}:${key}`;
    }
    return key;
  }

  async getItem(key: string): Promise<string | null> {
    if (Platform.OS === 'web') {
      return await AsyncStorage.getItem(this.getKey(key));
    } else {
      return await this.largeSecureStore.getItem(key);
    }
  }

  async setItem(key: string, value: string): Promise<void> {
    if (Platform.OS === 'web') {
      await AsyncStorage.setItem(this.getKey(key), value);
    } else {
      await this.largeSecureStore.setItem(key, value);
    }
  }

  async removeItem(key: string): Promise<void> {
    if (Platform.OS === 'web') {
      await AsyncStorage.removeItem(this.getKey(key));
    } else {
      await this.largeSecureStore.removeItem(key);
    }
  }
}

// As Expo's SecureStore does not support values larger than 2048
// bytes, an AES-256 key is generated and stored in SecureStore, while
// it is used to encrypt/decrypt values stored in AsyncStorage.
class LargeSecureStore {
  private async _encrypt(key: string, value: string) {
    const encryptionKey = crypto.getRandomValues(new Uint8Array(256 / 8));

    const cipher = new aesjs.ModeOfOperation.ctr(
      encryptionKey,
      new aesjs.Counter(1)
    );
    const encryptedBytes = cipher.encrypt(aesjs.utils.utf8.toBytes(value));

    await SecureStore.setItemAsync(
      key,
      aesjs.utils.hex.fromBytes(encryptionKey)
    );

    return aesjs.utils.hex.fromBytes(encryptedBytes);
  }

  private async _decrypt(key: string, value: string) {
    const encryptionKeyHex = await SecureStore.getItemAsync(key);
    if (!encryptionKeyHex) {
      return encryptionKeyHex;
    }

    const cipher = new aesjs.ModeOfOperation.ctr(
      aesjs.utils.hex.toBytes(encryptionKeyHex),
      new aesjs.Counter(1)
    );
    const decryptedBytes = cipher.decrypt(aesjs.utils.hex.toBytes(value));

    return aesjs.utils.utf8.fromBytes(decryptedBytes);
  }

  async getItem(key: string) {
    const encrypted = await AsyncStorage.getItem(key);
    if (!encrypted) {
      return encrypted;
    }

    return await this._decrypt(key, encrypted);
  }

  async removeItem(key: string) {
    await AsyncStorage.removeItem(key);
    await SecureStore.deleteItemAsync(key);
  }

  async setItem(key: string, value: string) {
    const encrypted = await this._encrypt(key, value);

    await AsyncStorage.setItem(key, encrypted);
  }
}

// Get environment variables from expo-constants for runtime access in development builds
const supabaseUrl = process.env.EXPO_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.EXPO_PUBLIC_SUPABASE_KEY!;

// Only initialize Supabase client on the client side (not during SSR)
const createSupabaseClient = () => {
  // Check if we're in a React Native environment (not Node.js SSR)
  if (typeof window === 'undefined') {
    return null;
  }

  return createClient(supabaseUrl, supabaseAnonKey, {
    auth: {
      storage: new PlatformSecureStore(),
      autoRefreshToken: true,
      persistSession: true,
      detectSessionInUrl: false,
      lock: processLock,
    },
  });
};

export const supabase = createSupabaseClient();

export default supabase;
