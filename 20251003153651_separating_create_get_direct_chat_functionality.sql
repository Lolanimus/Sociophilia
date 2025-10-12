drop function if exists "public"."add_contact"(target_user_id uuid);

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.add_contact(target_username text)
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
   DECLARE
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
  END;
$function$
;

CREATE OR REPLACE FUNCTION public.get_direct_chat_by_user_id(target_user_id uuid)
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$DECLARE
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
END;$function$
;


                                                                                                                       
  DECLARE                                                                                                                     
    _messages JSONB;                                                                                                         
    _total_count INT;                                                                                                        
    _next_cursor INT;                                                                                                        
  BEGIN                                                                                                                       
    -- Check if user is a participant in this chat                                                                            
    IF NOT EXISTS (                                                                                                           
      SELECT 1 FROM public.chat_participants cp                                                                               
      WHERE cp.chat_id = _chat_id AND cp.participant_id = auth.uid()                                                         
    ) THEN                                                                                                                    
      RAISE EXCEPTION 'Access denied';                                                                                        
    END IF;                                                                                                                   

    -- Get total count for determining if there's a next page
    SELECT COUNT(*) INTO _total_count
    FROM public.chat_messages cm
    WHERE cm.chat_id = _chat_id;

    -- Calculate next cursor
    IF _cursor + plimit < _total_count THEN
      _next_cursor := _cursor + _limit;
    ELSE
      _next_cursor := NULL;
    END IF;

        -- Get messages
    SELECT jsonb_build_object(
      'data', COALESCE(jsonb_agg(to_jsonb(m.*) ORDER BY m.created_at DESC), '[]'::jsonb),
      'nextCursor', _next_cursor
    ) INTO _messages
    FROM (
      SELECT *
      FROM public.chat_messages cm
      WHERE cm.chat_id = _chat_id
      ORDER BY cm.created_at DESC
      OFFSET _cursor
      LIMIT _limit
    ) m;

    RETURN _messages;
  END;