drop function if exists "public"."add_user_contact"(target_username text);

drop function if exists "public"."approve_friendship"(target_username text);

drop function if exists "public"."create_direct_chat"(target_username text);

drop function if exists "public"."delete_contact"(target_username text);

drop function if exists "public"."get_user_contacts"(detail_level text, page_limit integer, page_offset integer);

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.add_contact(target_user_id uuid)
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$

   DECLARE
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
        'user_id', id
        'username', username,
        'status', status_val,
        'requester_pos', CASE
          WHEN uid1_val = requester_id THEN 'REQ_UID1'
          WHEN uid2_val = requester_id THEN 'REQ_UID2'
          ELSE NULL
        END
      ) FROM public."user" where id = target_user_id;
  END;
$function$
;

CREATE OR REPLACE FUNCTION public.approve_contact(target_user_id uuid)
 RETURNS boolean
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
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
  $function$
;

CREATE OR REPLACE FUNCTION public.create_direct_chat(target_user_id uuid)
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$DECLARE
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
END;$function$
;

CREATE OR REPLACE FUNCTION public.delete_contact(target_user_id uuid)
 RETURNS boolean
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
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
  
  $function$
;

CREATE OR REPLACE FUNCTION public.get_contacts(detail_level text DEFAULT 'list'::text, page_limit integer DEFAULT 20, page_offset integer DEFAULT 0)
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$DECLARE
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
  END;$function$
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


