create table "public"."chat_messages" (
    "id" uuid not null default gen_random_uuid(),
    "sender_id" uuid not null,
    "chat_id" uuid not null,
    "contents" text not null,
    "created_at" timestamp with time zone not null default now(),
    "metadata" jsonb
);


alter table "public"."chat_messages" enable row level security;

CREATE UNIQUE INDEX chat_messages_pkey ON public.chat_messages USING btree (id);

CREATE INDEX idx_chat_messages_chat_id_timestamp ON public.chat_messages USING btree (chat_id, created_at DESC);

CREATE INDEX idx_chat_messages_sender_id ON public.chat_messages USING btree (sender_id);

alter table "public"."chat_messages" add constraint "chat_messages_pkey" PRIMARY KEY using index "chat_messages_pkey";

alter table "public"."chat_messages" add constraint "chat_messages_chat_id_fkey" FOREIGN KEY (chat_id) REFERENCES chats(id) ON DELETE CASCADE not valid;

alter table "public"."chat_messages" validate constraint "chat_messages_chat_id_fkey";

alter table "public"."chat_messages" add constraint "chat_messages_sender_id_fkey" FOREIGN KEY (sender_id) REFERENCES "user"(id) not valid;

alter table "public"."chat_messages" validate constraint "chat_messages_sender_id_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.chat_messages_changes()
 RETURNS trigger
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$DECLARE
  participant_record RECORD;
BEGIN
  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
    FOR participant_record IN
      SELECT participant_id
      FROM public.chat_participants
      WHERE chat_id = NEW.chat_id
    LOOP
      PERFORM realtime.send(
        to_jsonb(NEW),
        ('chats_update'::public.realtime_events)::TEXT,  
        'chats:' || participant_record.participant_id,
        TRUE
      );
    END LOOP;
  ELSIF TG_OP = 'DELETE' THEN
    FOR participant_record IN
      SELECT participant_id
      FROM public.chat_participants
      WHERE chat_id = OLD.chat_id
    LOOP
      PERFORM realtime.send(
        to_jsonb(OLD),
        ('chats_update'::public.realtime_events)::TEXT,
        'chats:' || participant_record.participant_id,
        TRUE
      );
    END LOOP;
  END IF;
  RETURN NULL;
  END;$function$
;

CREATE OR REPLACE FUNCTION public.create_message(p_chat_id uuid, p_contents text)
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$DECLARE
  v_result jsonb;
BEGIN
  IF p_contents IS NULL OR p_contents = '' THEN 
    RAISE EXCEPTION 'Can''t create an empty message';
  END IF;

  INSERT INTO public.chat_messages (
    sender_id,
    chat_id,
    contents
  ) VALUES (
    auth.uid(),
    p_chat_id,
    p_contents
  ) RETURNING jsonb_build_object(
    'id', id,
    'sender_id', sender_id,
    'chat_id', chat_id,
    'contents', contents,
    'created_at', created_at
  ) INTO v_result;

  RETURN v_result;
END;$function$
;

CREATE OR REPLACE FUNCTION public.delete_messages(msg_ids uuid[])
 RETURNS boolean
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$DECLARE
BEGIN
    DELETE FROM public.chat_messages
    WHERE id = ANY(msg_ids);

    RETURN TRUE;
END;$function$
;

CREATE OR REPLACE FUNCTION public.get_messages(p_chat_id uuid, p_cursor integer DEFAULT 0, p_limit integer DEFAULT 20)
 RETURNS jsonb
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$DECLARE
    v_messages JSONB;
    v_total_count INT;
    v_next_cursor INT;
  BEGIN
    -- Get total count for determining if there's a next page
    SELECT COUNT(*) INTO v_total_count
    FROM public.chat_messages cm
    WHERE cm.chat_id = p_chat_id;

    -- Calculate next cursor
    IF p_cursor + p_limit < v_total_count THEN
      v_next_cursor := p_cursor + p_limit;
    ELSE
      v_next_cursor := NULL;
    END IF;

    -- Get messages
    SELECT jsonb_build_object(
      'messages', COALESCE(jsonb_agg(jsonb_build_object(
        'id', m.id,
        'sender_id', m.sender_id,
        'chat_id', m.chat_id,
        'contents', m.contents,
        'created_at', m.created_at
      ) ORDER BY m.created_at DESC), '[]'::jsonb),
      'nextCursor', v_next_cursor
    ) INTO v_messages
    FROM (
      SELECT cm.id, cm.sender_id, cm.chat_id, cm.contents, cm.created_at
      FROM public.chat_messages cm
      WHERE cm.chat_id = p_chat_id
      ORDER BY cm.created_at DESC
      OFFSET p_cursor
      LIMIT p_limit
    ) m;

    RETURN v_messages;
  END;$function$
;

CREATE OR REPLACE FUNCTION public.user_contacts_changes()
 RETURNS trigger
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$BEGIN
  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN                   
    PERFORM realtime.send(	   
      '{}'::jsonb,
      ('contacts_update'::public.realtime_events)::TEXT,
      'contacts:' || CASE WHEN NEW.uid1 = auth.uid() THEN NEW.uid2 ELSE NEW.uid1 END,
      TRUE
    );    
  ELSIF TG_OP = 'DELETE' THEN
    PERFORM realtime.send(	   
      '{}'::jsonb,
      ('contacts_update'::public.realtime_events)::TEXT,
      'contacts:' || CASE WHEN OLD.uid1 = auth.uid() THEN OLD.uid2 ELSE OLD.uid1 END,
      TRUE
    );  
  END IF;
  RETURN NULL;
END;$function$
;

grant delete on table "public"."chat_messages" to "anon";

grant insert on table "public"."chat_messages" to "anon";

grant references on table "public"."chat_messages" to "anon";

grant select on table "public"."chat_messages" to "anon";

grant trigger on table "public"."chat_messages" to "anon";

grant truncate on table "public"."chat_messages" to "anon";

grant update on table "public"."chat_messages" to "anon";

grant delete on table "public"."chat_messages" to "authenticated";

grant insert on table "public"."chat_messages" to "authenticated";

grant references on table "public"."chat_messages" to "authenticated";

grant select on table "public"."chat_messages" to "authenticated";

grant trigger on table "public"."chat_messages" to "authenticated";

grant truncate on table "public"."chat_messages" to "authenticated";

grant update on table "public"."chat_messages" to "authenticated";

grant delete on table "public"."chat_messages" to "service_role";

grant insert on table "public"."chat_messages" to "service_role";

grant references on table "public"."chat_messages" to "service_role";

grant select on table "public"."chat_messages" to "service_role";

grant trigger on table "public"."chat_messages" to "service_role";

grant truncate on table "public"."chat_messages" to "service_role";

grant update on table "public"."chat_messages" to "service_role";

create policy "delete_message"
on "public"."chat_messages"
as permissive
for delete
to authenticated
using ((chat_id IN ( SELECT cp.chat_id
   FROM chat_participants cp
  WHERE (cp.participant_id = auth.uid()))));


create policy "get_messages"
on "public"."chat_messages"
as permissive
for select
to authenticated
using ((chat_id IN ( SELECT cp.chat_id
   FROM chat_participants cp
  WHERE (cp.participant_id = auth.uid()))));


create policy "insert_message"
on "public"."chat_messages"
as permissive
for insert
to authenticated
with check (((chat_id IN ( SELECT cp.chat_id
   FROM chat_participants cp
  WHERE (cp.participant_id = auth.uid()))) AND (sender_id = auth.uid())));


CREATE TRIGGER broadcast_changes_for_chat_messages_trigger AFTER INSERT OR DELETE OR UPDATE ON public.chat_messages FOR EACH ROW EXECUTE FUNCTION chat_messages_changes();


