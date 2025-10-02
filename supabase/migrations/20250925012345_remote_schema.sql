create extension if not exists "pgtap" with schema "extensions";


create type "public"."chat_type" as enum ('DIRECT', 'GROUP', 'SELF');

create type "public"."user_friend_status" as enum ('REQ_UID1', 'REQ_UID2', 'APPROVED');

create table "public"."chat_participants" (
    "chat_id" uuid not null,
    "participant_id" uuid not null,
    "metadata" jsonb not null
);


alter table "public"."chat_participants" enable row level security;

create table "public"."chats" (
    "id" uuid not null default gen_random_uuid(),
    "chat_type" chat_type not null,
    "metadata" jsonb
);


alter table "public"."chats" enable row level security;

create table "public"."user" (
    "id" uuid not null,
    "username" character varying(30) not null,
    "email" character varying(254),
    "phone_number" character varying(20),
    "inserted_at" timestamp with time zone not null default timezone('utc'::text, now()),
    "updated_at" timestamp with time zone not null default timezone('utc'::text, now())
);


alter table "public"."user" enable row level security;

create table "public"."user_contacts" (
    "uid1" uuid not null,
    "uid2" uuid not null,
    "status" user_friend_status not null,
    "id" uuid not null default gen_random_uuid()
);


alter table "public"."user_contacts" enable row level security;

CREATE UNIQUE INDEX chat_participants_pkey ON public.chat_participants USING btree (chat_id, participant_id);

CREATE UNIQUE INDEX chats_pkey ON public.chats USING btree (id);

CREATE INDEX idx_chat_participants_chat_count ON public.chat_participants USING btree (chat_id, participant_id);

CREATE INDEX idx_chat_participants_metadata ON public.chat_participants USING btree (metadata);

CREATE INDEX idx_chat_participants_participant_chat ON public.chat_participants USING btree (participant_id, chat_id);

CREATE INDEX idx_chat_participants_participant_id ON public.chat_participants USING btree (participant_id);

CREATE UNIQUE INDEX user_contacts_id_key ON public.user_contacts USING btree (id);

CREATE UNIQUE INDEX user_contacts_pkey ON public.user_contacts USING btree (id);

CREATE UNIQUE INDEX user_email_key ON public."user" USING btree (email);

CREATE UNIQUE INDEX user_phone_number_key ON public."user" USING btree (phone_number);

CREATE UNIQUE INDEX user_pkey ON public."user" USING btree (id);

CREATE UNIQUE INDEX user_username_key ON public."user" USING btree (username);

alter table "public"."chat_participants" add constraint "chat_participants_pkey" PRIMARY KEY using index "chat_participants_pkey";

alter table "public"."chats" add constraint "chats_pkey" PRIMARY KEY using index "chats_pkey";

alter table "public"."user" add constraint "user_pkey" PRIMARY KEY using index "user_pkey";

alter table "public"."user_contacts" add constraint "user_contacts_pkey" PRIMARY KEY using index "user_contacts_pkey";

alter table "public"."chat_participants" add constraint "chat_participants_chat_id_fkey" FOREIGN KEY (chat_id) REFERENCES chats(id) ON DELETE CASCADE not valid;

alter table "public"."chat_participants" validate constraint "chat_participants_chat_id_fkey";

alter table "public"."chat_participants" add constraint "chat_participants_participant_id_fkey" FOREIGN KEY (participant_id) REFERENCES "user"(id) ON DELETE CASCADE not valid;

alter table "public"."chat_participants" validate constraint "chat_participants_participant_id_fkey";

alter table "public"."user" add constraint "email_or_phone_required" CHECK ((((email IS NOT NULL) AND ((email)::text <> ''::text)) OR ((phone_number IS NOT NULL) AND ((phone_number)::text <> ''::text)))) not valid;

alter table "public"."user" validate constraint "email_or_phone_required";

alter table "public"."user" add constraint "user_email_key" UNIQUE using index "user_email_key";

alter table "public"."user" add constraint "user_id_fkey" FOREIGN KEY (id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."user" validate constraint "user_id_fkey";

alter table "public"."user" add constraint "user_phone_number_key" UNIQUE using index "user_phone_number_key";

alter table "public"."user" add constraint "user_username_key" UNIQUE using index "user_username_key";

alter table "public"."user_contacts" add constraint "check_friend" CHECK ((uid1 < uid2)) not valid;

alter table "public"."user_contacts" validate constraint "check_friend";

alter table "public"."user_contacts" add constraint "user_contacts_id_key" UNIQUE using index "user_contacts_id_key";

alter table "public"."user_contacts" add constraint "user_contacts_uid1_fkey" FOREIGN KEY (uid1) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."user_contacts" validate constraint "user_contacts_uid1_fkey";

alter table "public"."user_contacts" add constraint "user_contacts_uid2_fkey" FOREIGN KEY (uid2) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."user_contacts" validate constraint "user_contacts_uid2_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.add_user_contact(target_username text)
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$

   DECLARE
      requester_id UUID;
      target_user_id UUID;
      uid1_val UUID;
      uid2_val UUID;
      status_val public.user_friend_status;
    BEGIN
      -- Get current authenticated user ID
      requester_id := auth.uid();

      -- Check if user is authenticated
      IF requester_id IS NULL THEN
        RAISE EXCEPTION 'Not authenticated';
      END IF;

      -- Find target user by username (qualify with table alias)
      SELECT u.id INTO target_user_id
      FROM public."user" u
      WHERE u.username = target_username;

      -- Check if user exists
      IF target_user_id IS NULL THEN
        RAISE EXCEPTION 'User not found';
      END IF;

      -- Check if trying to add yourself
      IF target_user_id = requester_id THEN
        RAISE EXCEPTION 'Cannot add yourself as contact';
      END IF;

      -- Check if contact already exists
      IF EXISTS (SELECT 1 FROM public.user_contacts WHERE uid1 = LEAST(requester_id, target_user_id) AND uid2 =
    GREATEST(requester_id, target_user_id)) THEN
        RAISE EXCEPTION 'Contact already exists';
      END IF;

      -- Determine values based on constraint uid1 < uid2
      IF requester_id < target_user_id THEN
        uid1_val := requester_id;
        uid2_val := target_user_id;
        status_val := 'REQ_UID1'::public.user_friend_status;
      ELSE
        uid1_val := target_user_id;
        uid2_val := requester_id;
        status_val := 'REQ_UID2'::public.user_friend_status;
      END IF;

      -- Insert new contact relationship
      INSERT INTO public.user_contacts (uid1, uid2, status)
      VALUES (uid1_val, uid2_val, status_val);

      -- Return JSON object
      RETURN jsonb_build_object(
        'username', target_username,
        'status', status_val,
        'requester_pos', CASE
          WHEN uid1_val = requester_id THEN 'REQ_UID1'
          WHEN uid2_val = requester_id THEN 'REQ_UID2'
          ELSE NULL
        END
      );
  END;
$function$
;

CREATE OR REPLACE FUNCTION public.approve_friendship(target_username text)
 RETURNS void
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
  DECLARE
      user_id UUID;
      target_id UUID;
      current_status public.user_friend_status;
      requester_position TEXT;
      is_less BOOLEAN;
      result_row RECORD;
  BEGIN
      -- Get authenticated user ID
      user_id := auth.uid();
      IF user_id IS NULL THEN
          RAISE EXCEPTION 'Not authenticated';
      END IF;

      -- Find target user ID by username
      SELECT id INTO target_id
      FROM public.user
      WHERE username = target_username;

      IF target_id IS NULL THEN
          RAISE EXCEPTION 'User not found';
      END IF;

      -- Get current friendship status and determine requester position
      SELECT
          uc.status,
          CASE
              WHEN uc.uid1 = user_id THEN 'UID1'
              WHEN uc.uid2 = user_id THEN 'UID2'
              ELSE NULL
          END
      INTO current_status, requester_position
      FROM public.user_contacts uc
      WHERE (uc.uid1 = user_id AND uc.uid2 = target_id)
         OR (uc.uid1 = target_id AND uc.uid2 = user_id);

      -- Check if friendship exists
      IF current_status IS NULL THEN
          RAISE EXCEPTION 'No friendship request found';
      END IF;

      -- Check if already approved
      IF current_status = 'APPROVED' THEN
          RAISE EXCEPTION 'Friendship already approved';
      END IF;

      -- Determine if user_id < target_id
      is_less := user_id < target_id;

      -- Apply approval logic
      IF (current_status = 'REQ_UID1' AND is_less) OR (current_status = 'REQ_UID2' AND NOT is_less) THEN
          RAISE EXCEPTION 'Cannot approve friendship without the target user''s permission';
      ELSIF (current_status = 'REQ_UID2' AND is_less) OR (current_status = 'REQ_UID1' AND NOT is_less) THEN
          -- Update status to APPROVED and return the updated row
          UPDATE public.user_contacts
          SET status = 'APPROVED'
          WHERE (uid1 = user_id AND uid2 = target_id)
             OR (uid1 = target_id AND uid2 = user_id);
      ELSE
          RAISE EXCEPTION 'Invalid friendship state';
      END IF;
  END;
  $function$
;

CREATE OR REPLACE FUNCTION public.check_chat_participant_limit()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$BEGIN
    IF (SELECT COUNT(*) FROM public.chat_participants WHERE chat_id = NEW.chat_id) > 100 THEN
      RAISE EXCEPTION 'Chat cannot have more than 100 participants';
    END IF;
    RETURN NEW;
  END;$function$
;

CREATE OR REPLACE FUNCTION public.create_direct_chat(target_username text)
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$DECLARE
    chat_row public.chats%ROWTYPE;
    client_user_id UUID := auth.uid()::uuid;
    target_user_id UUID := public.get_user_id_by_username(target_username)::uuid;
BEGIN
    IF target_user_id IS NULL THEN
        RAISE EXCEPTION 'User % does not exist', target_username;
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
END;$function$
;

CREATE OR REPLACE FUNCTION public.delete_contact(target_username text)
 RETURNS boolean
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
DECLARE
      contact_user_id UUID;
  BEGIN
      -- Get the user ID from the username
      SELECT id INTO contact_user_id
      FROM public.user
      WHERE username = target_username;

      -- If user not found, return false
      IF contact_user_id IS NULL THEN
          RETURN FALSE;
      END IF;

      -- Delete the contact (RLS will ensure user can only delete their own contacts)
      DELETE FROM public.user_contacts WHERE uid1 = contact_user_id OR uid2 = contact_user_id;

      -- Return true if contact was deleted, false if not found or not allowed
      RETURN FOUND;
  END;
  
  $function$
;

CREATE OR REPLACE FUNCTION public.get_client_chats()
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
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
$function$
;

CREATE OR REPLACE FUNCTION public.get_user_contacts(detail_level text DEFAULT 'list'::text, page_limit integer DEFAULT 20, page_offset integer DEFAULT 0)
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
   DECLARE
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
  END;
  
  $function$
;

CREATE OR REPLACE FUNCTION public.get_user_id_by_username(target_username text)
 RETURNS uuid
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$

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
$function$
;

CREATE OR REPLACE FUNCTION public.signup_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
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
  $function$
;

create policy "chat_participants_insert"
on "public"."chat_participants"
as permissive
for all
to authenticated
using (true);


create policy "chat_participants_select"
on "public"."chat_participants"
as permissive
for all
to authenticated
using ((participant_id = auth.uid()));


create policy "chat_insert"
on "public"."chats"
as permissive
for all
to authenticated
using (true);


create policy "chat_select"
on "public"."chats"
as permissive
for all
to authenticated
using ((id IN ( SELECT cp.chat_id
   FROM chat_participants cp
  WHERE (cp.participant_id = auth.uid()))));


create policy "Users can manage own profile"
on "public"."user"
as permissive
for all
to authenticated
using ((auth.uid() = id));


create policy "Users can view profiles"
on "public"."user"
as permissive
for select
to public
using (true);


create policy "insert_new_user"
on "public"."user"
as permissive
for insert
to public
with check (true);


create policy "Enable delete for users based on user_id"
on "public"."user_contacts"
as permissive
for delete
to authenticated
using (((( SELECT auth.uid() AS uid) = uid1) OR (( SELECT auth.uid() AS uid) = uid2)));


create policy "Enable insert for users based on user_id"
on "public"."user_contacts"
as permissive
for insert
to authenticated
with check ((((( SELECT auth.uid() AS uid) = uid1) AND (status = 'REQ_UID1'::user_friend_status)) OR ((( SELECT auth.uid() AS uid) = uid2) AND (status = 'REQ_UID2'::user_friend_status))));


create policy "Enable users to view their own data only"
on "public"."user_contacts"
as permissive
for select
to authenticated
using (((( SELECT auth.uid() AS uid) = uid1) OR (( SELECT auth.uid() AS uid) = uid2)));


create policy "Update Policy"
on "public"."user_contacts"
as permissive
for update
to authenticated
using (((( SELECT auth.uid() AS uid) = uid1) OR (( SELECT auth.uid() AS uid) = uid2)));


CREATE TRIGGER trigger_participant_limit BEFORE INSERT ON public.chat_participants FOR EACH ROW EXECUTE FUNCTION check_chat_participant_limit();


CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION signup_user();


