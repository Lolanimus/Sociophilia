export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  graphql_public: {
    Tables: {
      [_ in never]: never
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      graphql: {
        Args: {
          extensions?: Json
          operationName?: string
          query?: string
          variables?: Json
        }
        Returns: Json
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  public: {
    Tables: {
      chat_messages: {
        Row: {
          chat_id: string
          contents: string
          created_at: string
          id: string
          metadata: Json | null
          sender_id: string
        }
        Insert: {
          chat_id: string
          contents: string
          created_at?: string
          id?: string
          metadata?: Json | null
          sender_id: string
        }
        Update: {
          chat_id?: string
          contents?: string
          created_at?: string
          id?: string
          metadata?: Json | null
          sender_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "chat_messages_chat_id_fkey"
            columns: ["chat_id"]
            isOneToOne: false
            referencedRelation: "chats"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "chat_messages_sender_id_fkey"
            columns: ["sender_id"]
            isOneToOne: false
            referencedRelation: "user"
            referencedColumns: ["id"]
          },
        ]
      }
      chat_participants: {
        Row: {
          chat_id: string
          metadata: Json
          participant_id: string
        }
        Insert: {
          chat_id: string
          metadata: Json
          participant_id: string
        }
        Update: {
          chat_id?: string
          metadata?: Json
          participant_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "chat_participants_chat_id_fkey"
            columns: ["chat_id"]
            isOneToOne: false
            referencedRelation: "chats"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "chat_participants_participant_id_fkey"
            columns: ["participant_id"]
            isOneToOne: false
            referencedRelation: "user"
            referencedColumns: ["id"]
          },
        ]
      }
      chats: {
        Row: {
          chat_type: Database["public"]["Enums"]["chat_type"]
          id: string
          metadata: Json | null
        }
        Insert: {
          chat_type: Database["public"]["Enums"]["chat_type"]
          id?: string
          metadata?: Json | null
        }
        Update: {
          chat_type?: Database["public"]["Enums"]["chat_type"]
          id?: string
          metadata?: Json | null
        }
        Relationships: []
      }
      user: {
        Row: {
          email: string | null
          id: string
          inserted_at: string
          phone_number: string | null
          updated_at: string
          username: string
        }
        Insert: {
          email?: string | null
          id: string
          inserted_at?: string
          phone_number?: string | null
          updated_at?: string
          username: string
        }
        Update: {
          email?: string | null
          id?: string
          inserted_at?: string
          phone_number?: string | null
          updated_at?: string
          username?: string
        }
        Relationships: []
      }
      user_contacts: {
        Row: {
          id: string
          status: Database["public"]["Enums"]["user_friend_status"]
          uid1: string
          uid2: string
        }
        Insert: {
          id?: string
          status: Database["public"]["Enums"]["user_friend_status"]
          uid1: string
          uid2: string
        }
        Update: {
          id?: string
          status?: Database["public"]["Enums"]["user_friend_status"]
          uid1?: string
          uid2?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_contacts_uid1_fkey"
            columns: ["uid1"]
            isOneToOne: false
            referencedRelation: "user"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_contacts_uid2_fkey"
            columns: ["uid2"]
            isOneToOne: false
            referencedRelation: "user"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      add_contact: {
        Args: { target_username: string }
        Returns: Json
      }
      approve_contact: {
        Args: { target_user_id: string }
        Returns: boolean
      }
      create_direct_chat: {
        Args: { target_user_id: string }
        Returns: Json
      }
      create_message: {
        Args: { p_chat_id: string; p_contents: string }
        Returns: Json
      }
      delete_contact: {
        Args: { target_user_id: string }
        Returns: boolean
      }
      delete_messages: {
        Args: { msg_ids: string[] }
        Returns: boolean
      }
      get_client_chats: {
        Args: Record<PropertyKey, never>
        Returns: Json
      }
      get_contacts: {
        Args: {
          detail_level?: string
          page_limit?: number
          page_offset?: number
        }
        Returns: Json
      }
      get_direct_chat_by_user_id: {
        Args: { target_user_id: string }
        Returns: Json
      }
      get_messages: {
        Args: { p_chat_id: string; p_cursor?: number; p_limit?: number }
        Returns: Json
      }
      get_user_id_by_username: {
        Args: { target_username: string }
        Returns: string
      }
    }
    Enums: {
      chat_type: "DIRECT" | "GROUP" | "SELF"
      realtime_events: "contacts_update" | "chats_update"
      user_friend_status: "REQ_UID1" | "REQ_UID2" | "APPROVED"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  graphql_public: {
    Enums: {},
  },
  public: {
    Enums: {
      chat_type: ["DIRECT", "GROUP", "SELF"],
      realtime_events: ["contacts_update", "chats_update"],
      user_friend_status: ["REQ_UID1", "REQ_UID2", "APPROVED"],
    },
  },
} as const

