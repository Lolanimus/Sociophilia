

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pg_net" WITH SCHEMA "extensions";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgtap" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE TYPE "public"."chat_type" AS ENUM (
    'DIRECT',
    'GROUP',
    'SELF'
);


ALTER TYPE "public"."chat_type" OWNER TO "postgres";


CREATE TYPE "public"."realtime_events" AS ENUM (
    'contacts_update',
    'chats_update'
);


ALTER TYPE "public"."realtime_events" OWNER TO "postgres";


CREATE TYPE "public"."user_friend_status" AS ENUM (
    'REQ_UID1',
    'REQ_UID2',
    'APPROVED'
);


ALTER TYPE "public"."user_friend_status" OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."add_contact"("target_username" "text") RETURNS "jsonb"
    LANGUAGE "plpgsql"
    SET "search_path" TO ''
    AS $$DECLARE
      target_user_id UUID := public.get_user_id_by_username(target_username);
      client_user_id UUID := auth.uid();
      uid1_val UUID;
      uid2_val UUID;
      status_val public.user_friend_status;
    BEGIN
      -- Check if user is authenticated
      IF client_user_id IS NULL THEN
        RAISE EXCEPTION 'Not authenticated';
      END IF;

      -- Check if user exists
      IF target_user_id IS NULL THEN
        RAISE EXCEPTION 'User not found';
      END IF;

      -- Check if trying to add yourself
      IF target_user_id = client_user_id THEN
        RAISE EXCEPTION 'Cannot add yourself as contact';
      END IF;

      -- Check if contact already exists
      IF EXISTS (SELECT 1 FROM public.user_contacts WHERE uid1 = LEAST(client_user_id, target_user_id) AND uid2 =
    GREATEST(client_user_id, target_user_id)) THEN
        RAISE EXCEPTION 'Contact already exists';
      END IF;

      -- Determine values based on constraint uid1 < uid2
      IF client_user_id < target_user_id THEN
        uid1_val := client_user_id;
        uid2_val := target_user_id;
        status_val := 'REQ_UID1'::public.user_friend_status;
      ELSE
        uid1_val := target_user_id;
        uid2_val := client_user_id;
        status_val := 'REQ_UID2'::public.user_friend_status;
      END IF;

      -- Insert new contact relationship
      INSERT INTO public.user_contacts (uid1, uid2, status)
      VALUES (uid1_val, uid2_val, status_val);
      -- Return JSON object
      RETURN jsonb_build_object(
        'user_id', id,
        'username', username,
        'status', status_val,
        'requester_pos', CASE
          WHEN uid1_val = client_user_id THEN 'REQ_UID1'
          WHEN uid2_val = client_user_id THEN 'REQ_UID2'
          ELSE NULL
        END
      ) FROM public."user" where id = target_user_id;
  END;$$;


ALTER FUNCTION "public"."add_contact"("target_username" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."approve_contact"("target_user_id" "uuid") RETURNS boolean
    LANGUAGE "plpgsql"
    SET "search_path" TO ''
    AS $$
  DECLARE
      client_user_id UUID;
      current_status public.user_friend_status;
      requester_position TEXT;
      is_less BOOLEAN;
      result_row RECORD;
  BEGIN
      -- Get authenticated user ID
      client_user_id := auth.uid();
      IF client_user_id IS NULL THEN
          RAISE EXCEPTION 'Not authenticated';
      END IF;

      IF target_user_id IS NULL THEN
          RAISE EXCEPTION 'User with id % not found', target_user_id;
      END IF;

      -- Get current friendship status and determine requester position
      SELECT
          uc.status,
          CASE
              WHEN uc.uid1 = client_user_id THEN 'UID1'
              WHEN uc.uid2 = client_user_id THEN 'UID2'
              ELSE NULL
          END
      INTO current_status, requester_position
      FROM public.user_contacts uc
      WHERE (uc.uid1 = client_user_id AND uc.uid2 = target_user_id)
         OR (uc.uid1 = target_user_id AND uc.uid2 = client_user_id);

      -- Check if friendship exists
      IF current_status IS NULL THEN
          RAISE EXCEPTION 'No friendship request found';
      END IF;

      -- Check if already approved
      IF current_status = 'APPROVED' THEN
          RAISE EXCEPTION 'Friendship already approved';
      END IF;

      -- Determine if user_id < target_id
      is_less := client_user_id < target_user_id;

      -- Apply approval logic
      IF (current_status = 'REQ_UID1' AND is_less) OR (current_status = 'REQ_UID2' AND NOT is_less) THEN
          RAISE EXCEPTION 'Cannot approve friendship without the target user''s permission';
      ELSIF (current_status = 'REQ_UID2' AND is_less) OR (current_status = 'REQ_UID1' AND NOT is_less) THEN
          -- Update status to APPROVED and return the updated row
          UPDATE public.user_contacts
          SET status = 'APPROVED'
          WHERE (uid1 = client_user_id AND uid2 = target_user_id)
             OR (uid1 = target_user_id AND uid2 = client_user_id);
      
	  RETURN TRUE;
      ELSE
          RAISE EXCEPTION 'Invalid friendship state';
      END IF;
  END;
  $$;


ALTER FUNCTION "public"."approve_contact"("target_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."check_chat_participant_limit"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$BEGIN
    IF (SELECT COUNT(*) FROM public.chat_participants WHERE chat_id = NEW.chat_id) > 100 THEN
      RAISE EXCEPTION 'Chat cannot have more than 100 participants';
    END IF;
    RETURN NEW;
  END;$$;


ALTER FUNCTION "public"."check_chat_participant_limit"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."create_direct_chat"("target_user_id" "uuid") RETURNS "jsonb"
    LANGUAGE "plpgsql"
    SET "search_path" TO ''
    AS $$DECLARE
    chat_row public.chats%ROWTYPE;
    client_user_id UUID := auth.uid()::uuid;
BEGIN
    IF target_user_id IS NULL THEN
        RAISE EXCEPTION 'User with id % does not exist', target_user_id;
    END IF;

    RAISE LOG 'client_user_id: %, target_user_id: %', client_user_id, target_user_id;

    -- Try to find existing direct chat
    SELECT c.*
    INTO chat_row
    FROM public.chats c
    JOIN public.chat_participants cp1
        ON cp1.chat_id = c.id AND cp1.participant_id = client_user_id
    JOIN public.chat_participants cp2
        ON cp2.chat_id = c.id AND cp2.participant_id = target_user_id
    WHERE c.chat_type = 'DIRECT'::public.chat_type;
    
    IF FOUND THEN
        RETURN jsonb_build_object(
            'id', chat_row.id,
            'chat_type', chat_row.chat_type,
            'metadata', chat_row.metadata
        );
    END IF;

    -- Create new chat
    INSERT INTO public.chats (chat_type, metadata)
    VALUES ('DIRECT'::public.chat_type, '{}'::json)
    RETURNING * INTO chat_row;

    INSERT INTO public.chat_participants (chat_id, participant_id, metadata)
    VALUES
        (chat_row.id, client_user_id, '{}'::json),
        (chat_row.id, target_user_id, '{}'::json);

    RETURN jsonb_build_object(
        'id', chat_row.id,
        'chat_type', chat_row.chat_type,
        'metadata', chat_row.metadata
    );
END;$$;


ALTER FUNCTION "public"."create_direct_chat"("target_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."delete_contact"("target_user_id" "uuid") RETURNS boolean
    LANGUAGE "plpgsql"
    SET "search_path" TO ''
    AS $$
  BEGIN
      -- If user not found, return false
      IF target_user_id IS NULL THEN
          RETURN FALSE;
      END IF;

      -- Delete the contact (RLS will ensure user can only delete their own contacts)
      DELETE FROM public.user_contacts WHERE uid1 = target_user_id OR uid2 = target_user_id;

      -- Return true if contact was deleted, false if not found or not allowed
      RETURN FOUND;
  END;
  
  $$;


ALTER FUNCTION "public"."delete_contact"("target_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_client_chats"() RETURNS "jsonb"
    LANGUAGE "plpgsql"
    SET "search_path" TO ''
    AS $$
BEGIN
  RETURN (
      SELECT jsonb_agg(
          jsonb_build_object(
              'id', c.id,
              'metadata', c.metadata
          )
      )
      FROM public.chats c
      JOIN public.chat_participants cp ON c.id = cp.chat_id
      WHERE cp.participant_id = auth.uid()
  );
END;
$$;


ALTER FUNCTION "public"."get_client_chats"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_contacts"("detail_level" "text" DEFAULT 'list'::"text", "page_limit" integer DEFAULT 20, "page_offset" integer DEFAULT 0) RETURNS "jsonb"
    LANGUAGE "plpgsql"
    SET "search_path" TO ''
    AS $$DECLARE
    user_id UUID;
    total_contacts BIGINT;
    requester_position text;
BEGIN
    -- Get current authenticated user ID
    user_id := auth.uid();

    -- Check if user is authenticated
    IF user_id IS NULL THEN
      RAISE EXCEPTION 'Not authenticated';
    END IF;

    -- Get total count for pagination info
    SELECT COUNT(*) INTO total_contacts
    FROM public.user_contacts uc
    WHERE uc.uid1 = user_id OR uc.uid2 = user_id;

     RETURN jsonb_build_object(
      'meta', jsonb_build_object(
        'total_contacts', total_contacts,
        'page_limit', page_limit,
        'page_offset', page_offset
      ),
      'data', COALESCE(
        (SELECT json_agg(contact_row)
        FROM (
          SELECT jsonb_strip_nulls(
            jsonb_build_object(
              'user_id', u.id,
              'username', u.username,
              'status', uc.status,
                'requester_pos', CASE
                    WHEN uc.status != 'APPROVED' THEN
                        CASE
                        WHEN uc.uid1 = user_id THEN 'REQ_UID1'
                        WHEN uc.uid2 = user_id THEN 'REQ_UID2'
                        ELSE NULL
                        END
                    END,
                'email', CASE WHEN detail_level = 'full' THEN u.email END,
              'phone_number', CASE WHEN detail_level = 'full' THEN u.phone_number END
            )
          ) AS contact_row
          FROM public.user_contacts uc
          JOIN public."user" u ON (
            CASE
              WHEN uc.uid1 = user_id THEN u.id = uc.uid2
              ELSE u.id = uc.uid1
            END
          )
          WHERE uc.uid1 = user_id OR uc.uid2 = user_id
          ORDER BY u.username ASC
          LIMIT page_limit
          OFFSET page_offset
        ) contacts
        ),
        '[]'::json
      )
    );
  END;$$;


ALTER FUNCTION "public"."get_contacts"("detail_level" "text", "page_limit" integer, "page_offset" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_direct_chat_by_user_id"("target_user_id" "uuid") RETURNS "jsonb"
    LANGUAGE "plpgsql"
    SET "search_path" TO ''
    AS $$DECLARE
    client_user_id UUID := auth.uid()::uuid;
BEGIN
    IF target_user_id IS NULL THEN
        RAISE EXCEPTION 'User with id % does not exist', target_user_id;
    END IF;

    RAISE LOG 'client_user_id: %, target_user_id: %', client_user_id, target_user_id;

    -- Try to find existing direct chat
    RETURN  (
      SELECT jsonb_build_object(
        'id', c.id,
        'chat_type', c.chat_type,
        'metadata', c.metadata
      )
      FROM public.chats c
      JOIN public.chat_participants cp1
        ON cp1.chat_id = c.id AND cp1.participant_id = client_user_id
      JOIN public.chat_participants cp2
        ON cp2.chat_id = c.id AND cp2.participant_id = target_user_id
      WHERE c.chat_type = 'DIRECT'::public.chat_type
    );
END;$$;


ALTER FUNCTION "public"."get_direct_chat_by_user_id"("target_user_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_user_id_by_username"("target_username" "text") RETURNS "uuid"
    LANGUAGE "plpgsql"
    SET "search_path" TO ''
    AS $$

   DECLARE
      target_user_id UUID;
    BEGIN
      -- Find target user by username (qualify with table alias)
      SELECT u.id INTO target_user_id
      FROM public.user u
      WHERE u.username = target_username;

      -- Return JSON object
      RETURN target_user_id;
  END;
$$;


ALTER FUNCTION "public"."get_user_id_by_username"("target_username" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."signup_user"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
  BEGIN
    INSERT INTO public.user (id, email, username)
    VALUES (
      NEW.id,
      NEW.email,
      NEW.raw_user_meta_data->>'username'
    );

    RETURN NEW;
  EXCEPTION
    WHEN OTHERS THEN
      -- Fail the entire auth signup if profile creation fails
      RAISE EXCEPTION 'Profile creation failed: %', SQLERRM;
  END;
  $$;


ALTER FUNCTION "public"."signup_user"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."user_contacts_changes"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    SET "search_path" TO ''
    AS $$BEGIN
  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN                   
    PERFORM realtime.send(	   
      '{}'::jsonb,
      ('contacts_update'::public.realtime_events)::TEXT,
      CASE WHEN NEW.uid1 = auth.uid() THEN NEW.uid2 ELSE NEW.uid1 END || ':contacts',
      TRUE
    );    
  ELSIF TG_OP = 'DELETE' THEN
    PERFORM realtime.send(	   
      '{}'::jsonb,
      ('contacts_update'::public.realtime_events)::TEXT,
      CASE WHEN OLD.uid1 = auth.uid() THEN OLD.uid2 ELSE OLD.uid1 END || ':contacts',
      TRUE
    );  
  END IF;
  RETURN NULL;
END;$$;


ALTER FUNCTION "public"."user_contacts_changes"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."chat_participants" (
    "chat_id" "uuid" NOT NULL,
    "participant_id" "uuid" NOT NULL,
    "metadata" "jsonb" NOT NULL
);


ALTER TABLE "public"."chat_participants" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."chats" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "chat_type" "public"."chat_type" NOT NULL,
    "metadata" "jsonb"
);


ALTER TABLE "public"."chats" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user" (
    "id" "uuid" NOT NULL,
    "username" character varying(30) NOT NULL,
    "email" character varying(254),
    "phone_number" character varying(20),
    "inserted_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    CONSTRAINT "email_or_phone_required" CHECK (((("email" IS NOT NULL) AND (("email")::"text" <> ''::"text")) OR (("phone_number" IS NOT NULL) AND (("phone_number")::"text" <> ''::"text"))))
);


ALTER TABLE "public"."user" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."user_contacts" (
    "uid1" "uuid" NOT NULL,
    "uid2" "uuid" NOT NULL,
    "status" "public"."user_friend_status" NOT NULL,
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    CONSTRAINT "check_friend" CHECK (("uid1" < "uid2"))
);


ALTER TABLE "public"."user_contacts" OWNER TO "postgres";


ALTER TABLE ONLY "public"."chat_participants"
    ADD CONSTRAINT "chat_participants_pkey" PRIMARY KEY ("chat_id", "participant_id");



ALTER TABLE ONLY "public"."chats"
    ADD CONSTRAINT "chats_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."user_contacts"
    ADD CONSTRAINT "user_contacts_id_key" UNIQUE ("id");



ALTER TABLE ONLY "public"."user_contacts"
    ADD CONSTRAINT "user_contacts_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "user_email_key" UNIQUE ("email");



ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "user_phone_number_key" UNIQUE ("phone_number");



ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "user_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "user_username_key" UNIQUE ("username");



CREATE INDEX "idx_chat_participants_chat_count" ON "public"."chat_participants" USING "btree" ("chat_id", "participant_id");



CREATE INDEX "idx_chat_participants_metadata" ON "public"."chat_participants" USING "btree" ("metadata");



CREATE INDEX "idx_chat_participants_participant_chat" ON "public"."chat_participants" USING "btree" ("participant_id", "chat_id");



CREATE INDEX "idx_chat_participants_participant_id" ON "public"."chat_participants" USING "btree" ("participant_id");



CREATE OR REPLACE TRIGGER "broadcast_changes_for_user_contacts_trigger" AFTER INSERT OR DELETE OR UPDATE ON "public"."user_contacts" FOR EACH ROW EXECUTE FUNCTION "public"."user_contacts_changes"();



CREATE OR REPLACE TRIGGER "trigger_participant_limit" BEFORE INSERT ON "public"."chat_participants" FOR EACH ROW EXECUTE FUNCTION "public"."check_chat_participant_limit"();



ALTER TABLE ONLY "public"."chat_participants"
    ADD CONSTRAINT "chat_participants_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "public"."chats"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chat_participants"
    ADD CONSTRAINT "chat_participants_participant_id_fkey" FOREIGN KEY ("participant_id") REFERENCES "public"."user"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user_contacts"
    ADD CONSTRAINT "user_contacts_uid1_fkey" FOREIGN KEY ("uid1") REFERENCES "public"."user"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user_contacts"
    ADD CONSTRAINT "user_contacts_uid2_fkey" FOREIGN KEY ("uid2") REFERENCES "public"."user"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "user_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



CREATE POLICY "Enable delete for users based on user_id" ON "public"."user_contacts" FOR DELETE TO "authenticated" USING (((( SELECT "auth"."uid"() AS "uid") = "uid1") OR (( SELECT "auth"."uid"() AS "uid") = "uid2")));



CREATE POLICY "Enable insert for users based on user_id" ON "public"."user_contacts" FOR INSERT TO "authenticated" WITH CHECK ((((( SELECT "auth"."uid"() AS "uid") = "uid1") AND ("status" = 'REQ_UID1'::"public"."user_friend_status")) OR ((( SELECT "auth"."uid"() AS "uid") = "uid2") AND ("status" = 'REQ_UID2'::"public"."user_friend_status"))));



CREATE POLICY "Enable users to view their own data only" ON "public"."user_contacts" FOR SELECT TO "authenticated" USING (((( SELECT "auth"."uid"() AS "uid") = "uid1") OR (( SELECT "auth"."uid"() AS "uid") = "uid2")));



CREATE POLICY "Update Policy" ON "public"."user_contacts" FOR UPDATE TO "authenticated" USING (((( SELECT "auth"."uid"() AS "uid") = "uid1") OR (( SELECT "auth"."uid"() AS "uid") = "uid2")));



CREATE POLICY "Users can manage own profile" ON "public"."user" TO "authenticated" USING (("auth"."uid"() = "id"));



CREATE POLICY "Users can view profiles" ON "public"."user" FOR SELECT USING (true);



CREATE POLICY "chat_insert" ON "public"."chats" TO "authenticated" USING (true);



ALTER TABLE "public"."chat_participants" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "chat_participants_insert" ON "public"."chat_participants" TO "authenticated" USING (true);



CREATE POLICY "chat_participants_select" ON "public"."chat_participants" TO "authenticated" USING (("participant_id" = "auth"."uid"()));



CREATE POLICY "chat_select" ON "public"."chats" TO "authenticated" USING (("id" IN ( SELECT "cp"."chat_id"
   FROM "public"."chat_participants" "cp"
  WHERE ("cp"."participant_id" = "auth"."uid"()))));



ALTER TABLE "public"."chats" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "insert_new_user" ON "public"."user" FOR INSERT WITH CHECK (true);



ALTER TABLE "public"."user" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user_contacts" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";






ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."user_contacts";






GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































GRANT ALL ON FUNCTION "public"."add_contact"("target_username" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."add_contact"("target_username" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."add_contact"("target_username" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."approve_contact"("target_user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."approve_contact"("target_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."approve_contact"("target_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."check_chat_participant_limit"() TO "anon";
GRANT ALL ON FUNCTION "public"."check_chat_participant_limit"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."check_chat_participant_limit"() TO "service_role";



GRANT ALL ON FUNCTION "public"."create_direct_chat"("target_user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."create_direct_chat"("target_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."create_direct_chat"("target_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."delete_contact"("target_user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."delete_contact"("target_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."delete_contact"("target_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_client_chats"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_client_chats"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_client_chats"() TO "service_role";



GRANT ALL ON FUNCTION "public"."get_contacts"("detail_level" "text", "page_limit" integer, "page_offset" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."get_contacts"("detail_level" "text", "page_limit" integer, "page_offset" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_contacts"("detail_level" "text", "page_limit" integer, "page_offset" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."get_direct_chat_by_user_id"("target_user_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."get_direct_chat_by_user_id"("target_user_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_direct_chat_by_user_id"("target_user_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_user_id_by_username"("target_username" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."get_user_id_by_username"("target_username" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_user_id_by_username"("target_username" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."signup_user"() TO "anon";
GRANT ALL ON FUNCTION "public"."signup_user"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."signup_user"() TO "service_role";



GRANT ALL ON FUNCTION "public"."user_contacts_changes"() TO "anon";
GRANT ALL ON FUNCTION "public"."user_contacts_changes"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."user_contacts_changes"() TO "service_role";


















GRANT ALL ON TABLE "public"."chat_participants" TO "anon";
GRANT ALL ON TABLE "public"."chat_participants" TO "authenticated";
GRANT ALL ON TABLE "public"."chat_participants" TO "service_role";



GRANT ALL ON TABLE "public"."chats" TO "anon";
GRANT ALL ON TABLE "public"."chats" TO "authenticated";
GRANT ALL ON TABLE "public"."chats" TO "service_role";



GRANT ALL ON TABLE "public"."user" TO "anon";
GRANT ALL ON TABLE "public"."user" TO "authenticated";
GRANT ALL ON TABLE "public"."user" TO "service_role";



GRANT ALL ON TABLE "public"."user_contacts" TO "anon";
GRANT ALL ON TABLE "public"."user_contacts" TO "authenticated";
GRANT ALL ON TABLE "public"."user_contacts" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";






























RESET ALL;
CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION signup_user();


  create policy "authenticated_users_can_receive"
  on "realtime"."messages"
  as permissive
  for select
  to authenticated
using (true);



  create policy "authenticated_users_can_send"
  on "realtime"."messages"
  as permissive
  for insert
  to authenticated
with check (true);



