--
-- PostgreSQL database dump
--

\restrict 8uVw2fka55zKRJXSCH2ScUz48Re2GBCzpMavILcOmp5pz9zshaeHCB3EPUzgtrz

-- Dumped from database version 17.4
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_net; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_net IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA supabase_functions;


ALTER SCHEMA supabase_functions OWNER TO supabase_admin;

--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA supabase_migrations;


ALTER SCHEMA supabase_migrations OWNER TO postgres;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgtap; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgtap WITH SCHEMA extensions;


--
-- Name: EXTENSION pgtap; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgtap IS 'Unit testing for PostgreSQL';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: chat_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.chat_type AS ENUM (
    'DIRECT',
    'GROUP',
    'SELF'
);


ALTER TYPE public.chat_type OWNER TO postgres;

--
-- Name: realtime_events; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.realtime_events AS ENUM (
    'contacts_update',
    'chats_update'
);


ALTER TYPE public.realtime_events OWNER TO postgres;

--
-- Name: user_friend_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_friend_status AS ENUM (
    'REQ_UID1',
    'REQ_UID2',
    'APPROVED'
);


ALTER TYPE public.user_friend_status OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF EXISTS (
      SELECT 1
      FROM pg_event_trigger_ddl_commands() AS ev
      JOIN pg_extension AS ext
      ON ev.objid = ext.oid
      WHERE ext.extname = 'pg_net'
    )
    THEN
      GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

      IF EXISTS (
        SELECT FROM pg_extension
        WHERE extname = 'pg_net'
        -- all versions in use on existing projects as of 2025-02-20
        -- version 0.12.0 onwards don't need these applied
        AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
      ) THEN
        ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
        ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

        ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
        ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

        REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
        REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

        GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
        GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      END IF;
    END IF;
  END;
  $$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: add_contact(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.add_contact(target_username text) RETURNS jsonb
    LANGUAGE plpgsql
    SET search_path TO ''
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


ALTER FUNCTION public.add_contact(target_username text) OWNER TO postgres;

--
-- Name: approve_contact(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.approve_contact(target_user_id uuid) RETURNS boolean
    LANGUAGE plpgsql
    SET search_path TO ''
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


ALTER FUNCTION public.approve_contact(target_user_id uuid) OWNER TO postgres;

--
-- Name: chat_messages_changes(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.chat_messages_changes() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO ''
    AS $$DECLARE
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
  END;$$;


ALTER FUNCTION public.chat_messages_changes() OWNER TO postgres;

--
-- Name: check_chat_participant_limit(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_chat_participant_limit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
    IF (SELECT COUNT(*) FROM public.chat_participants WHERE chat_id = NEW.chat_id) > 100 THEN
      RAISE EXCEPTION 'Chat cannot have more than 100 participants';
    END IF;
    RETURN NEW;
  END;$$;


ALTER FUNCTION public.check_chat_participant_limit() OWNER TO postgres;

--
-- Name: create_direct_chat(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_direct_chat(target_user_id uuid) RETURNS jsonb
    LANGUAGE plpgsql
    SET search_path TO ''
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


ALTER FUNCTION public.create_direct_chat(target_user_id uuid) OWNER TO postgres;

--
-- Name: create_message(uuid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_message(p_chat_id uuid, p_contents text) RETURNS jsonb
    LANGUAGE plpgsql
    SET search_path TO ''
    AS $$DECLARE
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
END;$$;


ALTER FUNCTION public.create_message(p_chat_id uuid, p_contents text) OWNER TO postgres;

--
-- Name: delete_contact(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_contact(target_user_id uuid) RETURNS boolean
    LANGUAGE plpgsql
    SET search_path TO ''
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


ALTER FUNCTION public.delete_contact(target_user_id uuid) OWNER TO postgres;

--
-- Name: delete_messages(uuid[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_messages(msg_ids uuid[]) RETURNS boolean
    LANGUAGE plpgsql
    SET search_path TO ''
    AS $$DECLARE
BEGIN
    DELETE FROM public.chat_messages
    WHERE id = ANY(msg_ids);

    RETURN TRUE;
END;$$;


ALTER FUNCTION public.delete_messages(msg_ids uuid[]) OWNER TO postgres;

--
-- Name: get_client_chats(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_client_chats() RETURNS jsonb
    LANGUAGE plpgsql
    SET search_path TO ''
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


ALTER FUNCTION public.get_client_chats() OWNER TO postgres;

--
-- Name: get_contacts(text, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_contacts(detail_level text DEFAULT 'list'::text, page_limit integer DEFAULT 20, page_offset integer DEFAULT 0) RETURNS jsonb
    LANGUAGE plpgsql
    SET search_path TO ''
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


ALTER FUNCTION public.get_contacts(detail_level text, page_limit integer, page_offset integer) OWNER TO postgres;

--
-- Name: get_direct_chat_by_user_id(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_direct_chat_by_user_id(target_user_id uuid) RETURNS jsonb
    LANGUAGE plpgsql
    SET search_path TO ''
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


ALTER FUNCTION public.get_direct_chat_by_user_id(target_user_id uuid) OWNER TO postgres;

--
-- Name: get_messages(uuid, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_messages(p_chat_id uuid, p_cursor integer DEFAULT 0, p_limit integer DEFAULT 20) RETURNS jsonb
    LANGUAGE plpgsql
    SET search_path TO ''
    AS $$DECLARE
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
  END;$$;


ALTER FUNCTION public.get_messages(p_chat_id uuid, p_cursor integer, p_limit integer) OWNER TO postgres;

--
-- Name: get_user_id_by_username(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_user_id_by_username(target_username text) RETURNS uuid
    LANGUAGE plpgsql
    SET search_path TO ''
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


ALTER FUNCTION public.get_user_id_by_username(target_username text) OWNER TO postgres;

--
-- Name: signup_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.signup_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
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


ALTER FUNCTION public.signup_user() OWNER TO postgres;

--
-- Name: user_contacts_changes(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.user_contacts_changes() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path TO ''
    AS $$BEGIN
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
END;$$;


ALTER FUNCTION public.user_contacts_changes() OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


ALTER FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_update_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_level_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.prefixes_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
    DECLARE
      request_id bigint;
      payload jsonb;
      url text := TG_ARGV[0]::text;
      method text := TG_ARGV[1]::text;
      headers jsonb DEFAULT '{}'::jsonb;
      params jsonb DEFAULT '{}'::jsonb;
      timeout_ms integer DEFAULT 1000;
    BEGIN
      IF url IS NULL OR url = 'null' THEN
        RAISE EXCEPTION 'url argument is missing';
      END IF;

      IF method IS NULL OR method = 'null' THEN
        RAISE EXCEPTION 'method argument is missing';
      END IF;

      IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
        headers = '{"Content-Type": "application/json"}'::jsonb;
      ELSE
        headers = TG_ARGV[2]::jsonb;
      END IF;

      IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
        params = '{}'::jsonb;
      ELSE
        params = TG_ARGV[3]::jsonb;
      END IF;

      IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
        timeout_ms = 1000;
      ELSE
        timeout_ms = TG_ARGV[4]::integer;
      END IF;

      CASE
        WHEN method = 'GET' THEN
          SELECT http_get INTO request_id FROM net.http_get(
            url,
            params,
            headers,
            timeout_ms
          );
        WHEN method = 'POST' THEN
          payload = jsonb_build_object(
            'old_record', OLD,
            'record', NEW,
            'type', TG_OP,
            'table', TG_TABLE_NAME,
            'schema', TG_TABLE_SCHEMA
          );

          SELECT http_post INTO request_id FROM net.http_post(
            url,
            payload,
            params,
            headers,
            timeout_ms
          );
        ELSE
          RAISE EXCEPTION 'method argument % is invalid', method;
      END CASE;

      INSERT INTO supabase_functions.hooks
        (hook_table_id, hook_name, request_id)
      VALUES
        (TG_RELID, TG_NAME, request_id);

      RETURN NEW;
    END
  $$;


ALTER FUNCTION supabase_functions.http_request() OWNER TO supabase_functions_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_messages (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sender_id uuid NOT NULL,
    chat_id uuid NOT NULL,
    contents text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.chat_messages OWNER TO postgres;

--
-- Name: chat_participants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_participants (
    chat_id uuid NOT NULL,
    participant_id uuid NOT NULL,
    metadata jsonb NOT NULL
);


ALTER TABLE public.chat_participants OWNER TO postgres;

--
-- Name: chats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chats (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    chat_type public.chat_type NOT NULL,
    metadata jsonb
);


ALTER TABLE public.chats OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id uuid NOT NULL,
    username character varying(30) NOT NULL,
    email character varying(254),
    phone_number character varying(20),
    inserted_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    CONSTRAINT email_or_phone_required CHECK ((((email IS NOT NULL) AND ((email)::text <> ''::text)) OR ((phone_number IS NOT NULL) AND ((phone_number)::text <> ''::text))))
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_contacts (
    uid1 uuid NOT NULL,
    uid2 uuid NOT NULL,
    status public.user_friend_status NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    CONSTRAINT check_friend CHECK ((uid1 < uid2))
);


ALTER TABLE public.user_contacts OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_2026_01_01; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_01 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_01 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_02; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_02 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_02 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_03; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_03 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_03 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_04; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_04 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_04 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_05; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_05 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_05 OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


ALTER TABLE supabase_functions.hooks OWNER TO supabase_functions_admin;

--
-- Name: TABLE hooks; Type: COMMENT; Schema: supabase_functions; Owner: supabase_functions_admin
--

COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE supabase_functions.hooks_id_seq OWNER TO supabase_functions_admin;

--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE supabase_functions.migrations OWNER TO supabase_functions_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text
);


ALTER TABLE supabase_migrations.schema_migrations OWNER TO postgres;

--
-- Name: seed_files; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.seed_files (
    path text NOT NULL,
    hash text NOT NULL
);


ALTER TABLE supabase_migrations.seed_files OWNER TO postgres;

--
-- Name: messages_2026_01_01; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_01 FOR VALUES FROM ('2026-01-01 00:00:00') TO ('2026-01-02 00:00:00');


--
-- Name: messages_2026_01_02; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_02 FOR VALUES FROM ('2026-01-02 00:00:00') TO ('2026-01-03 00:00:00');


--
-- Name: messages_2026_01_03; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_03 FOR VALUES FROM ('2026-01-03 00:00:00') TO ('2026-01-04 00:00:00');


--
-- Name: messages_2026_01_04; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_04 FOR VALUES FROM ('2026-01-04 00:00:00') TO ('2026-01-05 00:00:00');


--
-- Name: messages_2026_01_05; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_05 FOR VALUES FROM ('2026-01-05 00:00:00') TO ('2026-01-06 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	6ff28d06-cd1d-4d8f-9c8c-02edf102b5ca	{"action":"user_confirmation_requested","actor_id":"f0da3f09-5c2e-4832-b503-77f9d5a5a215","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 17:17:55.251703+00	
00000000-0000-0000-0000-000000000000	8907925d-045b-4d62-8c47-92583b685741	{"action":"user_confirmation_requested","actor_id":"f0da3f09-5c2e-4832-b503-77f9d5a5a215","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 17:19:30.364481+00	
00000000-0000-0000-0000-000000000000	b23c4a39-7d14-4907-9bea-07e63eefd922	{"action":"user_signedup","actor_id":"f0da3f09-5c2e-4832-b503-77f9d5a5a215","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-05 17:25:03.150084+00	
00000000-0000-0000-0000-000000000000	2ea8bdba-0f05-40e5-a3ad-0d45884f1e05	{"action":"user_repeated_signup","actor_id":"f0da3f09-5c2e-4832-b503-77f9d5a5a215","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 17:35:54.094411+00	
00000000-0000-0000-0000-000000000000	2f6ac09a-c7f5-4406-bd28-ccb173018a40	{"action":"user_repeated_signup","actor_id":"f0da3f09-5c2e-4832-b503-77f9d5a5a215","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 17:37:02.613326+00	
00000000-0000-0000-0000-000000000000	b60a033c-9b4f-46a1-b0bf-98570bfe9286	{"action":"user_repeated_signup","actor_id":"f0da3f09-5c2e-4832-b503-77f9d5a5a215","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 17:39:46.944425+00	
00000000-0000-0000-0000-000000000000	40440fd0-9ba2-4bab-ad59-1e95d8686e70	{"action":"user_repeated_signup","actor_id":"f0da3f09-5c2e-4832-b503-77f9d5a5a215","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 17:41:22.433648+00	
00000000-0000-0000-0000-000000000000	c7249a1e-c043-451c-a737-ed3997133f5b	{"action":"user_repeated_signup","actor_id":"f0da3f09-5c2e-4832-b503-77f9d5a5a215","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 17:45:20.749341+00	
00000000-0000-0000-0000-000000000000	7e4b955a-86dd-4003-9dd9-fab6f58acfe4	{"action":"user_repeated_signup","actor_id":"f0da3f09-5c2e-4832-b503-77f9d5a5a215","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 17:47:27.718072+00	
00000000-0000-0000-0000-000000000000	1a9f3018-7cd7-4fd6-aec4-8f63adc1f2e5	{"action":"user_repeated_signup","actor_id":"f0da3f09-5c2e-4832-b503-77f9d5a5a215","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 17:47:28.62971+00	
00000000-0000-0000-0000-000000000000	a472879e-a779-4a54-a527-a76cd9126dca	{"action":"user_confirmation_requested","actor_id":"e8de26e7-6c1b-4aad-9158-0c0e94865629","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 17:48:28.186986+00	
00000000-0000-0000-0000-000000000000	04bda532-0dd9-4e4e-9696-a0ddffac55f1	{"action":"user_confirmation_requested","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 17:49:35.763154+00	
00000000-0000-0000-0000-000000000000	d11a2950-97d4-42d7-b461-09b4b5e816d9	{"action":"user_signedup","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-05 17:50:40.102113+00	
00000000-0000-0000-0000-000000000000	ac583e3e-b71e-4f2d-99ec-72885b91640e	{"action":"user_repeated_signup","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 18:06:32.240264+00	
00000000-0000-0000-0000-000000000000	d56bb357-0ae7-4844-9a62-cf7bb8b3f959	{"action":"user_repeated_signup","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 18:06:40.652691+00	
00000000-0000-0000-0000-000000000000	984e0715-086a-4846-9983-8dd76873bc2e	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-05 18:11:53.093254+00	
00000000-0000-0000-0000-000000000000	697a43eb-2462-453e-8b7e-715c5209b1b9	{"action":"user_confirmation_requested","actor_id":"725c4912-5669-4944-bdcc-cc96b60a023e","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-05 18:14:13.683078+00	
00000000-0000-0000-0000-000000000000	9b2eabd5-51af-44fd-846a-8ee254906dd4	{"action":"user_signedup","actor_id":"725c4912-5669-4944-bdcc-cc96b60a023e","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-05 18:14:48.829292+00	
00000000-0000-0000-0000-000000000000	45f48dc4-327e-4a98-b50a-4c479470c048	{"action":"login","actor_id":"725c4912-5669-4944-bdcc-cc96b60a023e","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-05 18:14:54.384674+00	
00000000-0000-0000-0000-000000000000	745d2760-a342-4abb-a0a1-d1dd1f90b93f	{"action":"token_refreshed","actor_id":"725c4912-5669-4944-bdcc-cc96b60a023e","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 21:40:53.341835+00	
00000000-0000-0000-0000-000000000000	c6b6ae93-23b9-4ecd-b826-a366818487a0	{"action":"token_revoked","actor_id":"725c4912-5669-4944-bdcc-cc96b60a023e","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-05 21:40:53.35304+00	
00000000-0000-0000-0000-000000000000	2e94d397-e9b0-436a-be7e-d8c41062efdd	{"action":"token_refreshed","actor_id":"725c4912-5669-4944-bdcc-cc96b60a023e","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-07 16:31:20.116832+00	
00000000-0000-0000-0000-000000000000	41320db3-4925-42b6-b79b-373554b80e09	{"action":"token_revoked","actor_id":"725c4912-5669-4944-bdcc-cc96b60a023e","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-07 16:31:20.128407+00	
00000000-0000-0000-0000-000000000000	4c1060dd-55e9-4035-b05c-b15f2c8f6afa	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-07 16:35:46.008945+00	
00000000-0000-0000-0000-000000000000	64ca71cb-5571-431a-9010-481ea04b97d3	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-07 18:04:35.494754+00	
00000000-0000-0000-0000-000000000000	161c8d3f-9a9e-44b8-8dd7-4b54af20d7ae	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-07 18:05:12.587991+00	
00000000-0000-0000-0000-000000000000	0e610a14-b00a-40fc-af20-f0c3bd280058	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-07 18:08:13.436515+00	
00000000-0000-0000-0000-000000000000	ee5a812d-95cf-4be0-8eea-e2dbce854073	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-07 18:08:21.256895+00	
00000000-0000-0000-0000-000000000000	abd5bc2c-05fa-44d5-a1e4-21d1174e2e61	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-07 18:10:18.35856+00	
00000000-0000-0000-0000-000000000000	a28d8908-7e2d-4e72-a139-ef4bdf6466dc	{"action":"token_refreshed","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 16:49:48.44859+00	
00000000-0000-0000-0000-000000000000	b5803e29-5cf2-4541-8b0c-22d2717389cd	{"action":"token_revoked","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 16:49:48.479988+00	
00000000-0000-0000-0000-000000000000	08c9fc44-eaca-4e91-8fb4-d53c19057acb	{"action":"logout","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-08 17:36:10.38757+00	
00000000-0000-0000-0000-000000000000	fc4f07dd-2dec-44c3-bc0e-6039a249d26e	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-08 17:41:07.272846+00	
00000000-0000-0000-0000-000000000000	c1adca86-2aa6-4c0f-8ac9-5bfaa505f468	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-08 17:41:07.521154+00	
00000000-0000-0000-0000-000000000000	7aaea3f5-0b68-437a-a179-55f65bcfc0a3	{"action":"logout","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-08 17:42:07.499819+00	
00000000-0000-0000-0000-000000000000	dcd22833-4059-4cc4-9913-39e317ac3828	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-08 17:42:52.896118+00	
00000000-0000-0000-0000-000000000000	c6b23853-abbe-403e-bff3-61a5bd58cd24	{"action":"logout","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-08 17:45:14.367844+00	
00000000-0000-0000-0000-000000000000	37ff97a3-c0cb-44ea-8c33-809db7379e6e	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-08 17:48:39.324772+00	
00000000-0000-0000-0000-000000000000	59c27596-d020-435a-b961-3783ec0264be	{"action":"logout","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-08 17:49:50.434597+00	
00000000-0000-0000-0000-000000000000	c7e1331d-9549-4c78-b1c6-c140cc7507ba	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-08 17:53:13.869177+00	
00000000-0000-0000-0000-000000000000	a9767245-5a9b-49c6-af96-19e382c3950e	{"action":"token_refreshed","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 19:19:18.06282+00	
00000000-0000-0000-0000-000000000000	eb6e6710-5238-4774-9942-da35edadbdfd	{"action":"token_revoked","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-08 19:19:18.089147+00	
00000000-0000-0000-0000-000000000000	74289bf4-228f-453d-8379-fc1ce326e319	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-08 19:19:19.574927+00	
00000000-0000-0000-0000-000000000000	b4c0ac55-b0c2-4e11-9226-214800d95096	{"action":"token_refreshed","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 16:27:08.817651+00	
00000000-0000-0000-0000-000000000000	60a83d62-6b03-4531-b65f-7ffbee15d99e	{"action":"token_revoked","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 16:27:08.846432+00	
00000000-0000-0000-0000-000000000000	0c876668-f826-4e48-80a6-c2c2fc5fef7e	{"action":"logout","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-09 16:27:14.694166+00	
00000000-0000-0000-0000-000000000000	fbfc99e4-dd76-4230-95b0-5407c939d55e	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-09 16:27:43.492418+00	
00000000-0000-0000-0000-000000000000	e883ab79-27a2-40fc-9d02-94c8a1049063	{"action":"token_refreshed","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 18:24:52.879588+00	
00000000-0000-0000-0000-000000000000	e4905f6c-f191-4cbc-a3ae-8df59a2ddc09	{"action":"token_revoked","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-09 18:24:52.906322+00	
00000000-0000-0000-0000-000000000000	37ed05bd-84e3-4006-8400-b23d80e7b05d	{"action":"token_refreshed","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 17:00:17.694255+00	
00000000-0000-0000-0000-000000000000	86c7e89f-6088-49ac-805a-1a8dfd4de07c	{"action":"token_revoked","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-10 17:00:17.723736+00	
00000000-0000-0000-0000-000000000000	670883c3-1e89-4bcd-bac6-26c42d2239a4	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 17:17:33.175704+00	
00000000-0000-0000-0000-000000000000	b22f15dc-4752-4fe3-baff-6eed49e2525b	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 17:17:36.698765+00	
00000000-0000-0000-0000-000000000000	e9a281eb-2094-479a-ad23-582dac842fa0	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 17:19:46.199707+00	
00000000-0000-0000-0000-000000000000	05116b3b-51f2-44e6-ab41-00b5de430607	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 17:25:59.947015+00	
00000000-0000-0000-0000-000000000000	099faf03-dd43-4851-ad77-048ed9967f7f	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 17:26:01.514752+00	
00000000-0000-0000-0000-000000000000	127229ef-fd77-4dff-9658-0da94e00a97e	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 18:35:12.329259+00	
00000000-0000-0000-0000-000000000000	96ef7eab-3db2-4b1b-bab4-d742bb58088b	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 18:36:38.273762+00	
00000000-0000-0000-0000-000000000000	eca0de40-22a6-4272-a957-3f4c2a6a1ef9	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 18:40:48.293587+00	
00000000-0000-0000-0000-000000000000	73730e1d-89b0-4dba-9bef-6cb1533f01fd	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 18:43:50.817962+00	
00000000-0000-0000-0000-000000000000	63399584-cfa1-4090-8d18-2455dbe45572	{"action":"logout","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-10 18:43:57.098398+00	
00000000-0000-0000-0000-000000000000	9aa2bcd5-6d4a-4d16-80b6-c79c7c2b34f9	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 18:45:23.61335+00	
00000000-0000-0000-0000-000000000000	d83c2fcf-3987-4892-bf03-9e0db9c04d96	{"action":"logout","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-10 18:45:24.810063+00	
00000000-0000-0000-0000-000000000000	11cec009-0af9-4c0e-bdcc-5d7ed5eb08cd	{"action":"user_repeated_signup","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-10 18:52:43.375797+00	
00000000-0000-0000-0000-000000000000	aeda3931-88be-4240-9faf-9f6ef53684ef	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 23:01:40.847133+00	
00000000-0000-0000-0000-000000000000	6fbc2b49-2a5a-4384-ac7b-2abfe1dd10cb	{"action":"logout","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-10 23:07:34.600838+00	
00000000-0000-0000-0000-000000000000	1211081d-144e-4431-b401-78c7dd2ea865	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 23:11:22.666712+00	
00000000-0000-0000-0000-000000000000	ca007e5b-f01d-4af1-9c48-494be0f1938b	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-10 23:21:29.102864+00	
00000000-0000-0000-0000-000000000000	450994f5-5d03-4f38-90bf-042f6f9a2c43	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 00:01:15.718144+00	
00000000-0000-0000-0000-000000000000	2de0babe-6a2e-4f0e-b9b4-f574427a1cd3	{"action":"logout","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-11 00:01:54.394098+00	
00000000-0000-0000-0000-000000000000	80274205-3cfd-45bf-abc2-97da5a2c144b	{"action":"user_confirmation_requested","actor_id":"ff181ec3-8b58-4662-8baa-a70ef4a6697c","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-11 03:34:41.677537+00	
00000000-0000-0000-0000-000000000000	279d5730-e51f-4d05-bc87-cae00989370c	{"action":"user_signedup","actor_id":"ff181ec3-8b58-4662-8baa-a70ef4a6697c","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-11 03:36:01.995384+00	
00000000-0000-0000-0000-000000000000	51ab3154-7b1f-40b3-8005-5477a7137627	{"action":"login","actor_id":"ff181ec3-8b58-4662-8baa-a70ef4a6697c","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 03:36:43.478895+00	
00000000-0000-0000-0000-000000000000	81c8b388-f793-4d2b-af00-e88babbd3d54	{"action":"logout","actor_id":"ff181ec3-8b58-4662-8baa-a70ef4a6697c","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-11 03:36:45.840161+00	
00000000-0000-0000-0000-000000000000	5acb14f6-d4ce-4eae-a043-ba07192d952a	{"action":"login","actor_id":"66bc7663-547a-478a-8762-ab2123f73c52","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 16:21:38.397533+00	
00000000-0000-0000-0000-000000000000	f1492784-9945-46b8-99ff-ebdbf56eafe2	{"action":"user_confirmation_requested","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-11 16:41:25.464008+00	
00000000-0000-0000-0000-000000000000	f9d50aa0-3b4b-434c-bc75-d05393e6b434	{"action":"user_confirmation_requested","actor_id":"956a53ca-1cda-4f88-813c-8b4bf986e1a4","actor_username":"antox.qscwd@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-11 16:43:24.572448+00	
00000000-0000-0000-0000-000000000000	2573c6f2-c6ca-4c1d-b4f9-09a66191c277	{"action":"user_signedup","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-11 16:45:04.511957+00	
00000000-0000-0000-0000-000000000000	10fe4ec8-694b-4d55-ab71-3dfd44cac332	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 16:45:10.580511+00	
00000000-0000-0000-0000-000000000000	ae72114d-90b5-4854-a1f1-3326689effa1	{"action":"logout","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-11 16:45:11.932369+00	
00000000-0000-0000-0000-000000000000	974ad4f0-4867-4064-840d-2a949822d01d	{"action":"user_repeated_signup","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-11 16:45:14.172613+00	
00000000-0000-0000-0000-000000000000	901371b1-1b6a-4ffa-9dfc-cd18d5646a66	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 16:51:31.013729+00	
00000000-0000-0000-0000-000000000000	f4220ff8-35e1-40e0-8a52-cf9c7d377e1b	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 16:57:52.956847+00	
00000000-0000-0000-0000-000000000000	f357a514-a207-4675-9b16-f8b438c62b78	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 16:59:07.760465+00	
00000000-0000-0000-0000-000000000000	b44d2e7e-2d4a-4c26-8911-609b8f406e4c	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 16:59:29.065968+00	
00000000-0000-0000-0000-000000000000	f67bf876-d574-412f-8260-2b77b7ff92b2	{"action":"logout","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-11 17:02:35.101776+00	
00000000-0000-0000-0000-000000000000	c28d2d09-4629-4547-b324-0264c09cbac0	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 17:02:37.936467+00	
00000000-0000-0000-0000-000000000000	229afe56-744b-4950-a50d-3918fcdb28ad	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 17:35:00.854531+00	
00000000-0000-0000-0000-000000000000	d20a2ed5-88be-40a7-86ab-1542f15a4d0e	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 17:36:23.588785+00	
00000000-0000-0000-0000-000000000000	6049c0ae-12c3-426b-950b-6191596a8638	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 18:24:04.080685+00	
00000000-0000-0000-0000-000000000000	3f13a280-8c52-4593-ab94-3a80be5057d2	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 18:27:34.497093+00	
00000000-0000-0000-0000-000000000000	be8f7b89-2499-4e52-a4cc-264acd482505	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 18:27:51.652198+00	
00000000-0000-0000-0000-000000000000	727288e4-6ae8-4cc8-8cb6-0009dfa22ecd	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 18:35:48.97119+00	
00000000-0000-0000-0000-000000000000	957eb796-31a5-439c-be69-b0395906a06e	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 18:40:06.947904+00	
00000000-0000-0000-0000-000000000000	378deb42-381c-4ad5-b1b2-e4416178174f	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 18:41:26.808117+00	
00000000-0000-0000-0000-000000000000	ae019a82-1163-46f6-ab17-b3b2bcb9182f	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 18:43:25.829039+00	
00000000-0000-0000-0000-000000000000	3f5835b1-7669-492b-9b35-845905b13715	{"action":"login","actor_id":"986f860e-043c-4985-84c7-c1c5308f722a","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 18:43:47.30708+00	
00000000-0000-0000-0000-000000000000	87273cfd-2bcd-4481-90b4-066643469898	{"action":"user_confirmation_requested","actor_id":"30bbfc48-da94-41b0-acea-bfbc25573ede","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-11 19:21:07.589511+00	
00000000-0000-0000-0000-000000000000	6a30b038-97ed-4cf9-87f0-13c91e333cb2	{"action":"user_confirmation_requested","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-11 19:24:27.658137+00	
00000000-0000-0000-0000-000000000000	57d9fcd0-3acb-44fc-bb17-3a2044bbca40	{"action":"user_confirmation_requested","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-11 19:25:34.380558+00	
00000000-0000-0000-0000-000000000000	873929c5-19e4-4533-95bb-4ab48e03527c	{"action":"user_signedup","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-11 19:26:06.56784+00	
00000000-0000-0000-0000-000000000000	db0e032b-7d2f-430d-8c80-9c8072143931	{"action":"user_confirmation_requested","actor_id":"471bbf12-3c48-4b53-98a7-121f47bf8690","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-11 19:26:46.584097+00	
00000000-0000-0000-0000-000000000000	09a601d7-7628-4f3e-b349-a7e1d49f02ee	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-11 19:32:06.917764+00	
00000000-0000-0000-0000-000000000000	a580ff68-2354-4d97-919f-1709e327352d	{"action":"token_refreshed","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 02:12:00.756495+00	
00000000-0000-0000-0000-000000000000	b37318e9-cdd0-4707-b0ca-5f0deee64467	{"action":"token_revoked","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 02:12:00.766369+00	
00000000-0000-0000-0000-000000000000	5d1b46e4-2371-4f66-9289-c74ebfaf8638	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 02:12:01.831021+00	
00000000-0000-0000-0000-000000000000	7d033b44-afdc-47e6-90fe-be63a28d63f2	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 02:14:49.524094+00	
00000000-0000-0000-0000-000000000000	1d0448c6-4b5b-4fbc-91fc-d0cc0d1d76ad	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 02:42:00.126113+00	
00000000-0000-0000-0000-000000000000	a3acdd10-9e0e-4325-9c3c-d76ee28f078b	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 02:45:03.89048+00	
00000000-0000-0000-0000-000000000000	7d9df701-5e1e-49ed-be94-f67672042a38	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 02:48:13.142271+00	
00000000-0000-0000-0000-000000000000	3644d3e9-c418-44c1-8127-e9eeefbad93e	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 02:49:40.859296+00	
00000000-0000-0000-0000-000000000000	6c5dc91b-15e9-4a5b-80f0-131df80bd897	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 03:01:44.778129+00	
00000000-0000-0000-0000-000000000000	d9eb09d4-d22c-4747-a499-5985f85286eb	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 03:12:54.527706+00	
00000000-0000-0000-0000-000000000000	5b3eff96-2f36-4004-a788-aaf3bf90958f	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 03:14:00.178473+00	
00000000-0000-0000-0000-000000000000	6045b520-c3f1-4ce4-b0c9-7f05e44d187b	{"action":"token_refreshed","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 15:32:11.905159+00	
00000000-0000-0000-0000-000000000000	995b224d-01a0-4a0e-8ac7-d32a98822737	{"action":"token_revoked","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 15:32:11.931494+00	
00000000-0000-0000-0000-000000000000	bbf85657-0790-4fa9-809a-a44d6afd6e20	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 15:32:12.185785+00	
00000000-0000-0000-0000-000000000000	8c83c449-09ca-4413-937b-803b973a2b8f	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 16:00:42.045822+00	
00000000-0000-0000-0000-000000000000	a69e6c22-ab16-48db-b58e-9d868c99b7e9	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 16:03:15.115974+00	
00000000-0000-0000-0000-000000000000	b0213cf0-68fb-490a-9460-082339d5b7be	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 16:14:42.393225+00	
00000000-0000-0000-0000-000000000000	9777291b-28cf-4d5a-b451-351a832eed09	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 16:21:05.631352+00	
00000000-0000-0000-0000-000000000000	363c5e45-ac35-45ee-927b-d9af462493fe	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 16:23:52.129629+00	
00000000-0000-0000-0000-000000000000	688608ba-7690-4b9b-a3b1-8e93c18f3e98	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 16:55:15.73996+00	
00000000-0000-0000-0000-000000000000	35f622cf-22fd-42d0-bd1a-4f51e2d5e7ee	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 17:00:59.459068+00	
00000000-0000-0000-0000-000000000000	64c18162-9209-44db-b412-02258ce16d0d	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 17:02:24.420279+00	
00000000-0000-0000-0000-000000000000	0042a67f-5504-4283-9a23-c42ac4582554	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 17:03:18.716761+00	
00000000-0000-0000-0000-000000000000	c4722087-75ae-4af2-bbe2-b8a5da7fec87	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 17:17:10.927135+00	
00000000-0000-0000-0000-000000000000	a72e167e-2d48-4fce-960c-ff6d6c2ef7e5	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 17:21:28.263387+00	
00000000-0000-0000-0000-000000000000	13d38974-a67e-4c35-a064-dfcf014d2e2f	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 17:23:39.801548+00	
00000000-0000-0000-0000-000000000000	030edd0f-c598-4b9d-9b79-1ea76e4f603e	{"action":"login","actor_id":"6f5a3d78-ffc2-466c-a034-12e5f3a4edfc","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 17:33:13.437365+00	
00000000-0000-0000-0000-000000000000	5d04b8b6-2c6f-433d-b317-8a8ae3a5f305	{"action":"user_confirmation_requested","actor_id":"3c32d982-84c0-473d-971d-19f906b582f6","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-12 17:54:54.163903+00	
00000000-0000-0000-0000-000000000000	ab7c5d66-1167-4c72-be67-afedd3efedaf	{"action":"user_confirmation_requested","actor_id":"988ce0ce-3ecb-4fa5-96bc-86537ff535c0","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-12 17:55:15.411126+00	
00000000-0000-0000-0000-000000000000	5a34994a-3bd2-45a0-99e9-dc002317e73d	{"action":"user_signedup","actor_id":"3c32d982-84c0-473d-971d-19f906b582f6","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-12 17:55:29.567755+00	
00000000-0000-0000-0000-000000000000	33b69754-fa93-4a1a-ad50-e8546f751f74	{"action":"user_signedup","actor_id":"988ce0ce-3ecb-4fa5-96bc-86537ff535c0","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-12 17:55:40.74826+00	
00000000-0000-0000-0000-000000000000	a6ee36a7-424e-46fd-8841-3c62d403aea8	{"action":"login","actor_id":"3c32d982-84c0-473d-971d-19f906b582f6","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 17:55:47.086819+00	
00000000-0000-0000-0000-000000000000	26bd1444-3d5b-414a-baf2-94c9886a5e23	{"action":"user_confirmation_requested","actor_id":"f4b85754-9332-4931-a303-fb1c0fb2e621","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-12 17:57:04.323801+00	
00000000-0000-0000-0000-000000000000	b0b40376-1684-4434-846a-d6d4c76bca99	{"action":"user_confirmation_requested","actor_id":"7b15f324-fe0d-4e91-b1df-b3b7e58cbf50","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-12 17:57:20.31123+00	
00000000-0000-0000-0000-000000000000	3b167370-cba5-48dc-a7e2-8b413e643c34	{"action":"user_signedup","actor_id":"f4b85754-9332-4931-a303-fb1c0fb2e621","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-12 17:57:29.888029+00	
00000000-0000-0000-0000-000000000000	c7fb7b52-7217-4043-8390-6a8c83a249f1	{"action":"login","actor_id":"f4b85754-9332-4931-a303-fb1c0fb2e621","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 17:57:30.994569+00	
00000000-0000-0000-0000-000000000000	156915fc-2a0d-4730-a2dc-86a039cc463c	{"action":"user_confirmation_requested","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-12 17:59:59.527677+00	
00000000-0000-0000-0000-000000000000	dd8f6e0f-82cc-4359-a128-83f3e7caf2a1	{"action":"user_confirmation_requested","actor_id":"228df4da-ec50-4a41-a60a-e69854198f4c","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-12 18:00:15.389391+00	
00000000-0000-0000-0000-000000000000	6a2d526d-3206-425e-add0-e875f1743e79	{"action":"user_signedup","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-12 18:00:35.709479+00	
00000000-0000-0000-0000-000000000000	338a6e8f-9677-495b-871a-cb97461425a6	{"action":"user_signedup","actor_id":"228df4da-ec50-4a41-a60a-e69854198f4c","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-12 18:01:03.023577+00	
00000000-0000-0000-0000-000000000000	a20c4892-9e6f-4250-8e52-e0b359a02a17	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 18:01:06.939657+00	
00000000-0000-0000-0000-000000000000	765fa0b5-0e0b-4892-85aa-21cdb00ea747	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 18:18:27.645203+00	
00000000-0000-0000-0000-000000000000	502d2e0e-30a8-42a7-87f9-9fd5baccfed9	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 18:43:54.750592+00	
00000000-0000-0000-0000-000000000000	c0391c78-a69f-443c-a699-ed5eb04868f2	{"action":"logout","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-12 18:44:14.093961+00	
00000000-0000-0000-0000-000000000000	6b0b6a59-61c3-4883-a269-fb02fc012992	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 18:44:55.551492+00	
00000000-0000-0000-0000-000000000000	cc0ccfc5-78cd-49c8-8339-33d9d9a6e809	{"action":"logout","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-12 18:45:09.84754+00	
00000000-0000-0000-0000-000000000000	d64523f9-67bb-4c3b-ba74-46def3e3afa8	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 18:45:31.642171+00	
00000000-0000-0000-0000-000000000000	ca200ea7-d9f0-419a-8603-38928ca65a4a	{"action":"logout","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-12 18:46:01.0419+00	
00000000-0000-0000-0000-000000000000	8241a98e-5411-4129-893d-2c3b169c49f5	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 18:46:11.163966+00	
00000000-0000-0000-0000-000000000000	25490566-e148-4aa3-afdf-929b0b7d20a3	{"action":"logout","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-12 18:46:23.248981+00	
00000000-0000-0000-0000-000000000000	115fa7a3-e9f4-4550-b788-4027acb6f1b3	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 18:46:24.18968+00	
00000000-0000-0000-0000-000000000000	85c9eb8a-7a7c-4780-b6ce-bb44b3822fed	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 18:58:55.740076+00	
00000000-0000-0000-0000-000000000000	a08edc5f-bfa3-4787-b3e5-8a25a3c43bb6	{"action":"logout","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-12 19:01:48.010956+00	
00000000-0000-0000-0000-000000000000	215ad0e7-a9f5-4916-b84e-5fdf39908aa1	{"action":"login","actor_id":"228df4da-ec50-4a41-a60a-e69854198f4c","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 19:01:55.244754+00	
00000000-0000-0000-0000-000000000000	95fa9302-9398-4425-a7b8-5ad665ee9810	{"action":"token_refreshed","actor_id":"228df4da-ec50-4a41-a60a-e69854198f4c","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 20:02:17.316394+00	
00000000-0000-0000-0000-000000000000	c2f0e7b2-b5cd-401f-bbb1-93662eb82ea3	{"action":"token_revoked","actor_id":"228df4da-ec50-4a41-a60a-e69854198f4c","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 20:02:17.329456+00	
00000000-0000-0000-0000-000000000000	7747bf94-55cf-486e-89da-64c8519a735e	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 20:02:22.583113+00	
00000000-0000-0000-0000-000000000000	8c26ef41-1ccd-4179-bc94-a3ee8fdaba02	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 20:21:25.929086+00	
00000000-0000-0000-0000-000000000000	323e6e1b-f4be-42ca-b129-5cba7debaf4a	{"action":"logout","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-12 20:22:20.746908+00	
00000000-0000-0000-0000-000000000000	c1a4d79a-d7ad-4d8d-a265-2621a2eef36a	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 20:22:21.807034+00	
00000000-0000-0000-0000-000000000000	c45c87e8-aff7-42cc-878a-5341f6b8897a	{"action":"logout","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-12 20:22:29.327429+00	
00000000-0000-0000-0000-000000000000	71e7e729-bafe-478e-9f89-fb09ee3de3de	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 20:22:30.315179+00	
00000000-0000-0000-0000-000000000000	e331a2d6-a3c9-48bb-ad41-3b99ccc6ea1c	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 20:23:45.158556+00	
00000000-0000-0000-0000-000000000000	ccfdc2b0-64ed-4253-8f81-f590169b2a7e	{"action":"token_refreshed","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 23:20:26.072963+00	
00000000-0000-0000-0000-000000000000	f2a0ddab-5bf7-4a84-a3f2-51be345ff418	{"action":"token_revoked","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-12 23:20:26.088163+00	
00000000-0000-0000-0000-000000000000	6a56d015-1596-4f8e-aa20-f68f7dd65490	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 23:20:27.251569+00	
00000000-0000-0000-0000-000000000000	f6c49fa3-403e-40f5-88a6-8b91a6fb2f59	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 23:36:46.34663+00	
00000000-0000-0000-0000-000000000000	e93b220a-89f2-4ba6-89ee-4ba9c4384e11	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 23:37:48.792938+00	
00000000-0000-0000-0000-000000000000	26cc793b-6ebe-486a-a660-2a3c046f125a	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 23:40:37.577983+00	
00000000-0000-0000-0000-000000000000	6515a227-9a58-4c94-b69e-ec84beec52ac	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 23:41:12.401022+00	
00000000-0000-0000-0000-000000000000	f6bd8fbe-0b17-499f-b69b-94144d65f1ca	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 23:42:03.313118+00	
00000000-0000-0000-0000-000000000000	b6234214-90ea-4be1-bdfc-f2d85f9e1bb5	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 23:42:27.602229+00	
00000000-0000-0000-0000-000000000000	d917d8b3-a630-4544-b55e-466f37905f8d	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 23:46:59.909591+00	
00000000-0000-0000-0000-000000000000	462857f1-799a-4495-abf7-2d78eb5b8635	{"action":"logout","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-12 23:51:30.543998+00	
00000000-0000-0000-0000-000000000000	7698a7d5-880a-42e2-bacb-81a90470c32b	{"action":"login","actor_id":"228df4da-ec50-4a41-a60a-e69854198f4c","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 23:51:36.096596+00	
00000000-0000-0000-0000-000000000000	b3e0c329-a53b-4f64-a722-72bf82d787bc	{"action":"logout","actor_id":"228df4da-ec50-4a41-a60a-e69854198f4c","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-12 23:51:40.693162+00	
00000000-0000-0000-0000-000000000000	da7e0d2a-44b9-4661-9a65-663fac68ab5c	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-12 23:51:42.217977+00	
00000000-0000-0000-0000-000000000000	350965ad-ca7f-4d17-9b58-abeaeec1289f	{"action":"token_refreshed","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-13 14:43:53.541864+00	
00000000-0000-0000-0000-000000000000	491198d1-f7c3-4294-b6ab-46848388d72e	{"action":"token_revoked","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-13 14:43:53.552526+00	
00000000-0000-0000-0000-000000000000	306e2ed1-d3f3-413c-94ec-ac8ff13c4c34	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 14:43:59.482858+00	
00000000-0000-0000-0000-000000000000	0270cca3-6f58-45bc-80ea-c6f5b2decb46	{"action":"logout","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 14:51:26.964038+00	
00000000-0000-0000-0000-000000000000	b7817d86-27e1-4811-bcd9-a3bd84854e0a	{"action":"login","actor_id":"6113a299-ae6a-498a-875d-3b548704933b","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 14:51:28.168062+00	
00000000-0000-0000-0000-000000000000	c54396d1-dff5-462e-98e2-80dd339f000e	{"action":"user_confirmation_requested","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-13 15:49:28.420165+00	
00000000-0000-0000-0000-000000000000	ad8db731-d800-44f3-9e54-3220f056d60a	{"action":"user_signedup","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-13 15:49:44.486817+00	
00000000-0000-0000-0000-000000000000	2cb9c5ac-a192-449b-89c1-ea1a2a74c85a	{"action":"login","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 15:49:50.347466+00	
00000000-0000-0000-0000-000000000000	77c6fd4d-38ec-406c-a2a5-36f8eedd4904	{"action":"logout","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 15:49:51.386026+00	
00000000-0000-0000-0000-000000000000	074c3090-ce87-4ac4-a630-6e42954367bb	{"action":"login","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 15:50:03.313521+00	
00000000-0000-0000-0000-000000000000	92ffbd87-265f-4d46-9334-0a7f688e2b07	{"action":"login","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 15:51:08.417805+00	
00000000-0000-0000-0000-000000000000	91ca46a2-e44b-44d4-9686-7e756bd942c3	{"action":"login","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 15:51:48.257988+00	
00000000-0000-0000-0000-000000000000	bc6c773d-5a0b-4b9c-aad2-7a003305af24	{"action":"login","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:05:06.425749+00	
00000000-0000-0000-0000-000000000000	75193ba9-fceb-4465-9091-0a7abc44484c	{"action":"login","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:07:59.519365+00	
00000000-0000-0000-0000-000000000000	3179deee-d858-4dce-93c9-b3d66d0f1a59	{"action":"login","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:08:53.511783+00	
00000000-0000-0000-0000-000000000000	41526eac-300f-487a-aec9-6852cd50ec26	{"action":"login","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:09:30.878833+00	
00000000-0000-0000-0000-000000000000	b8ce62ed-d70c-4c04-9c80-000db20da1f0	{"action":"login","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:09:58.963656+00	
00000000-0000-0000-0000-000000000000	5cd294aa-1ed6-45ea-ab67-bdb623c67a91	{"action":"login","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:11:53.412844+00	
00000000-0000-0000-0000-000000000000	d0f2c525-b1b1-42fc-ac11-81cf7b51ca51	{"action":"logout","actor_id":"e2123dc2-7e6f-44fa-a2f0-420b7913b05f","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 16:12:12.301112+00	
00000000-0000-0000-0000-000000000000	c66e1721-f32d-4ede-ae94-f7f0477405ba	{"action":"user_confirmation_requested","actor_id":"b72b8a93-50c2-48e4-857d-3a8d18babaf6","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-13 16:12:27.441617+00	
00000000-0000-0000-0000-000000000000	fccf243f-dc96-4217-934a-99e41a258ca6	{"action":"user_confirmation_requested","actor_id":"671060ce-5965-46f2-a03a-1bd4becf9a34","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-13 16:16:42.893629+00	
00000000-0000-0000-0000-000000000000	f4d00e08-58ff-4b7f-b7ff-777cc3601ae3	{"action":"user_confirmation_requested","actor_id":"671060ce-5965-46f2-a03a-1bd4becf9a34","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-13 16:19:06.611722+00	
00000000-0000-0000-0000-000000000000	0bd6acb1-6e81-4eb0-9827-e4ea9c9ffbf9	{"action":"user_confirmation_requested","actor_id":"671060ce-5965-46f2-a03a-1bd4becf9a34","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-13 16:20:11.973578+00	
00000000-0000-0000-0000-000000000000	6df88b76-0cac-455b-a137-e4ec5c99d954	{"action":"user_signedup","actor_id":"671060ce-5965-46f2-a03a-1bd4becf9a34","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-13 16:20:46.271555+00	
00000000-0000-0000-0000-000000000000	0f36f0d1-7091-4906-bb32-f95ab42b0b3c	{"action":"user_confirmation_requested","actor_id":"2fff10be-ce4e-4d44-a0f1-f5c36ca8cae1","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-13 16:20:59.430163+00	
00000000-0000-0000-0000-000000000000	020b8da6-e8b8-4b31-b5e1-d435d3a371f6	{"action":"login","actor_id":"671060ce-5965-46f2-a03a-1bd4becf9a34","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:21:10.326747+00	
00000000-0000-0000-0000-000000000000	1a56d482-f4df-4b94-b27f-f7c5bd3418c5	{"action":"user_signedup","actor_id":"2fff10be-ce4e-4d44-a0f1-f5c36ca8cae1","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-13 16:21:54.449902+00	
00000000-0000-0000-0000-000000000000	723f3c3e-961f-4c44-ab6d-854d7b6676d7	{"action":"logout","actor_id":"671060ce-5965-46f2-a03a-1bd4becf9a34","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 16:21:59.700049+00	
00000000-0000-0000-0000-000000000000	921b2dcc-ad04-471b-9078-6b4bd38241d4	{"action":"login","actor_id":"671060ce-5965-46f2-a03a-1bd4becf9a34","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:22:00.962196+00	
00000000-0000-0000-0000-000000000000	4655eeba-b859-4536-ab31-8a6311f613b9	{"action":"logout","actor_id":"671060ce-5965-46f2-a03a-1bd4becf9a34","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 16:22:02.754922+00	
00000000-0000-0000-0000-000000000000	fa54d43b-b261-4e43-b64f-2dac05b41302	{"action":"login","actor_id":"2fff10be-ce4e-4d44-a0f1-f5c36ca8cae1","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:22:08.606914+00	
00000000-0000-0000-0000-000000000000	c5fe3789-c544-4b5b-a652-a46f35929890	{"action":"login","actor_id":"671060ce-5965-46f2-a03a-1bd4becf9a34","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:33:17.952446+00	
00000000-0000-0000-0000-000000000000	e3894295-33f2-4fbf-99fa-8de270fe307f	{"action":"user_confirmation_requested","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-13 16:51:16.468704+00	
00000000-0000-0000-0000-000000000000	dfb25ffe-6455-4303-8cce-ab76e0b3ff0d	{"action":"user_signedup","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-13 16:51:28.039123+00	
00000000-0000-0000-0000-000000000000	a5860283-7f80-4dec-9c44-e89d745f1b92	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:51:31.118076+00	
00000000-0000-0000-0000-000000000000	49eba3ee-32fa-43d5-aef6-072352e1f37c	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 16:51:34.217291+00	
00000000-0000-0000-0000-000000000000	1f6fb9c6-cee4-4cd1-912c-72a3512f0865	{"action":"user_confirmation_requested","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-13 16:51:45.750908+00	
00000000-0000-0000-0000-000000000000	467fcfef-a298-4d9e-9f14-e7d4248c88bb	{"action":"user_signedup","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-13 16:52:01.70112+00	
00000000-0000-0000-0000-000000000000	34c77048-210c-43fb-9d9f-9a1e6546cc9c	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:52:08.948089+00	
00000000-0000-0000-0000-000000000000	5f3e5928-58a4-4e24-9323-12ef88293520	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 16:52:24.303847+00	
00000000-0000-0000-0000-000000000000	90bbd3c8-0250-42b5-84ee-4870cf210e89	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:52:25.484697+00	
00000000-0000-0000-0000-000000000000	dca282d2-4edd-4016-b476-7fb193ff4d90	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 16:52:46.799632+00	
00000000-0000-0000-0000-000000000000	b83cb52e-5fbd-4ab9-a46a-8b2d64e6d0fc	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:08:59.099016+00	
00000000-0000-0000-0000-000000000000	3b102d10-377e-4d2e-83cc-c2c47f5e73b3	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 17:09:11.076465+00	
00000000-0000-0000-0000-000000000000	097a4033-a65d-487c-949d-e71d195072eb	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:09:17.490394+00	
00000000-0000-0000-0000-000000000000	40357cc4-ce56-4dc0-bb8d-345dfcd0faa6	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:18:05.166263+00	
00000000-0000-0000-0000-000000000000	9377b73e-c15b-438e-a616-da114da964b5	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:30:55.524245+00	
00000000-0000-0000-0000-000000000000	be395141-b194-4cd9-9cf9-87fb68765808	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 17:32:40.01508+00	
00000000-0000-0000-0000-000000000000	0edbbd7a-105d-4b15-b0ed-223d6042bbfa	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:32:40.898736+00	
00000000-0000-0000-0000-000000000000	5f456272-78b3-418a-bd73-7de9f8d43508	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 17:32:48.863042+00	
00000000-0000-0000-0000-000000000000	31dc9c03-0c3b-4474-95be-318cb004fa7d	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:32:50.025008+00	
00000000-0000-0000-0000-000000000000	a4167c2d-395a-45ef-aefe-0a23a23cf538	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 17:35:07.268522+00	
00000000-0000-0000-0000-000000000000	4ccee680-2c9b-4267-9e6a-9b35f0995ffe	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:35:08.285296+00	
00000000-0000-0000-0000-000000000000	9a45536c-67f2-49f1-92e6-1edc1ccd7255	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:37:14.458075+00	
00000000-0000-0000-0000-000000000000	192d892b-3192-49ac-a8e5-bf3884336800	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 17:43:41.758108+00	
00000000-0000-0000-0000-000000000000	ec8b02c4-2572-45b5-9806-318b95774a3e	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:43:42.750652+00	
00000000-0000-0000-0000-000000000000	3336df86-3839-472c-8aac-5ca792898d5a	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 17:44:20.742414+00	
00000000-0000-0000-0000-000000000000	953a658d-ce12-47e9-ae19-d452b65bb069	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:44:21.862696+00	
00000000-0000-0000-0000-000000000000	e1592e11-c4c9-4ab4-b858-2c9ce0b718bb	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:44:59.572697+00	
00000000-0000-0000-0000-000000000000	23d0db41-8ce1-4a5d-909d-297f93f0c129	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 17:53:31.406559+00	
00000000-0000-0000-0000-000000000000	632d905e-1331-4a49-a4a0-e30427c75443	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:53:32.41757+00	
00000000-0000-0000-0000-000000000000	9575936f-afde-4b39-ae67-c749483d0290	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:54:52.43688+00	
00000000-0000-0000-0000-000000000000	e9889700-55a7-483c-bdd8-a495130ab423	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 17:57:58.650439+00	
00000000-0000-0000-0000-000000000000	71f77940-6731-4c64-8057-b8ea0bb77415	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 17:58:00.04775+00	
00000000-0000-0000-0000-000000000000	78377a28-c6ec-4efd-ba11-4b31eb6644d1	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:01:07.138804+00	
00000000-0000-0000-0000-000000000000	0c15a511-2be3-419b-bd0d-527ea8f512a9	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:01:49.034401+00	
00000000-0000-0000-0000-000000000000	3111a2f7-8e66-42a5-b9bf-7432e9224097	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:01:49.984609+00	
00000000-0000-0000-0000-000000000000	9877a5e8-0262-4ee0-a14a-b0c63b8f1e53	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:02:31.567618+00	
00000000-0000-0000-0000-000000000000	960e28aa-270f-4dba-ac18-6ceb02e20751	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:02:32.723299+00	
00000000-0000-0000-0000-000000000000	296eb17a-28bb-409c-8fd2-6141a1be7604	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:03:42.940718+00	
00000000-0000-0000-0000-000000000000	4bfd0fc1-165d-413a-9892-242a50393a33	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:03:43.853681+00	
00000000-0000-0000-0000-000000000000	07004c01-7830-482b-a376-63ace0a145cf	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:08:07.730756+00	
00000000-0000-0000-0000-000000000000	f46f149c-cd44-4aff-8c4a-632fc27e0c2e	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:08:08.520744+00	
00000000-0000-0000-0000-000000000000	d0c19e58-afc3-433a-addf-704505276464	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:10:11.431876+00	
00000000-0000-0000-0000-000000000000	0d053b4c-384b-4d6b-b231-503c9a078a36	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:10:12.222659+00	
00000000-0000-0000-0000-000000000000	75228663-0edb-43f0-893a-be82770671d3	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:10:31.732347+00	
00000000-0000-0000-0000-000000000000	88f2b818-0137-4639-a4d3-626087213db5	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:10:32.62054+00	
00000000-0000-0000-0000-000000000000	0a6fba50-96ed-47c6-91c6-54d59e743b06	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:15:24.234175+00	
00000000-0000-0000-0000-000000000000	acc907c0-5cd2-42cb-a472-45b9f829ec8d	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:16:11.392934+00	
00000000-0000-0000-0000-000000000000	d7487921-dae4-47f6-aa67-7faa4931fbe5	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:17:20.065808+00	
00000000-0000-0000-0000-000000000000	05e516b6-d906-4a30-b732-2334ced33adc	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:17:43.457057+00	
00000000-0000-0000-0000-000000000000	c1b954c5-492d-4096-ad6a-4c8eb9c08cde	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:17:48.36586+00	
00000000-0000-0000-0000-000000000000	2dea9d67-653a-4b47-aa66-0461c6c25621	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:18:05.208448+00	
00000000-0000-0000-0000-000000000000	4e7a7fa5-80e4-4368-9d7f-787449087083	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:18:06.429554+00	
00000000-0000-0000-0000-000000000000	99a77f99-118b-47d8-b552-358a49d84628	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:52:05.836753+00	
00000000-0000-0000-0000-000000000000	951024b0-042a-49b3-90ad-b2483cdccdb5	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:52:06.999486+00	
00000000-0000-0000-0000-000000000000	a9ff6180-22fa-4dc3-82a0-357dbcecade4	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:52:47.89972+00	
00000000-0000-0000-0000-000000000000	bd55e63c-bd9a-4fa1-9406-a2504bfd5bb0	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:57:04.500243+00	
00000000-0000-0000-0000-000000000000	e6d0107f-9780-4c2c-9d4f-5eaccc0b7521	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:57:05.492514+00	
00000000-0000-0000-0000-000000000000	2916d3c7-9450-4008-af74-fe825cd42ab5	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 18:59:12.299319+00	
00000000-0000-0000-0000-000000000000	6d28524f-26f5-4c0a-ae8f-f85ca6f27e42	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 18:59:13.102996+00	
00000000-0000-0000-0000-000000000000	745c3d1d-b8df-45d3-b59a-88ed7f8612c0	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:04:15.952584+00	
00000000-0000-0000-0000-000000000000	7d8a8650-3db0-4121-a2fd-2b02ebe75d2b	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:04:17.05278+00	
00000000-0000-0000-0000-000000000000	d77298eb-8e49-4868-9fd2-6c31f94b6a7c	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:09:02.470277+00	
00000000-0000-0000-0000-000000000000	d451fe25-319a-49b1-8c71-e614505e72a4	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:09:03.322745+00	
00000000-0000-0000-0000-000000000000	a2394934-7557-4848-a653-ed7b323f2cd3	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:11:23.003914+00	
00000000-0000-0000-0000-000000000000	a0433ec6-5f7c-4cb8-8f4e-91e7141269be	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:11:23.985865+00	
00000000-0000-0000-0000-000000000000	cca37a02-3d76-4952-b3d3-a395dde3c732	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:15:24.702832+00	
00000000-0000-0000-0000-000000000000	67ca28b6-af56-4868-b16e-3d07b924911a	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:15:25.485067+00	
00000000-0000-0000-0000-000000000000	4cdcc350-a74c-41d5-876c-31e131f52cd3	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:16:32.522021+00	
00000000-0000-0000-0000-000000000000	16a8ff93-f02a-4da8-b94e-0de9d9830a9a	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:16:33.378597+00	
00000000-0000-0000-0000-000000000000	82aeb478-26ec-45f7-bec3-4f99671dc6a0	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:17:00.436912+00	
00000000-0000-0000-0000-000000000000	631401af-3d0c-415d-9a11-d613d17a536a	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:17:01.46775+00	
00000000-0000-0000-0000-000000000000	ba983478-9f2d-474b-aded-20fe012fe20d	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:17:24.228319+00	
00000000-0000-0000-0000-000000000000	3fe0a3fd-ad2c-4efa-b14d-4559d220b6ba	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:17:25.177745+00	
00000000-0000-0000-0000-000000000000	cdda7d6a-2e12-4c7f-b169-5da76d2c175d	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:19:34.23682+00	
00000000-0000-0000-0000-000000000000	d3980cf3-f201-45a2-9f57-5aa4bff04ff6	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:19:51.809713+00	
00000000-0000-0000-0000-000000000000	2d9b12e1-fa21-4dbe-9b88-b6aaaaa8cea2	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:20:48.525586+00	
00000000-0000-0000-0000-000000000000	f7158a20-1f8b-4c0b-8a60-7a3b82cfa6dd	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:22:36.262104+00	
00000000-0000-0000-0000-000000000000	6fa9f92f-c0e8-404e-b27e-8481d29619c3	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:23:46.623192+00	
00000000-0000-0000-0000-000000000000	99bb577a-8193-4796-ad92-065761026e62	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:26:59.450189+00	
00000000-0000-0000-0000-000000000000	2f7d22fd-86ba-4e38-8f5c-e333532f4223	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:27:01.22036+00	
00000000-0000-0000-0000-000000000000	d80c0175-9a01-461f-bec3-13eb9c816593	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:30:09.539421+00	
00000000-0000-0000-0000-000000000000	aec51646-28d9-489e-b8e1-d80525c55205	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:30:10.291465+00	
00000000-0000-0000-0000-000000000000	b32d43d5-9772-43d3-abbc-af9d98c99c3b	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:30:33.331008+00	
00000000-0000-0000-0000-000000000000	b8e82b9f-6bd7-45db-b35b-2f51346779e7	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:33:05.751482+00	
00000000-0000-0000-0000-000000000000	cb29a623-2213-41fe-a76e-57736fe54181	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:33:12.22558+00	
00000000-0000-0000-0000-000000000000	c81e8b60-f78a-42ab-9397-122b6210d544	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:46:33.558702+00	
00000000-0000-0000-0000-000000000000	03fbca4a-a828-4763-8f39-4325e8f64056	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:47:18.75934+00	
00000000-0000-0000-0000-000000000000	d21d98fd-561d-40f1-a338-e3d6345e2a67	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:47:19.867101+00	
00000000-0000-0000-0000-000000000000	9f93ec8f-ee0c-4469-9544-c071dd0be6e8	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:47:21.926419+00	
00000000-0000-0000-0000-000000000000	3b4583c7-b218-441d-974b-fcad0c91ba0c	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:47:22.859536+00	
00000000-0000-0000-0000-000000000000	ff5903bc-335b-4e0c-bde2-efac053532e7	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:48:40.459081+00	
00000000-0000-0000-0000-000000000000	28e5da62-1f60-467c-a6a1-f866aa7508f4	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:48:41.317806+00	
00000000-0000-0000-0000-000000000000	a5aea150-7d04-41d2-b2f9-92f59e1ab41b	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:49:30.824494+00	
00000000-0000-0000-0000-000000000000	b9ea51ca-c77f-4fad-b3d0-b5ef8b191697	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:49:31.943015+00	
00000000-0000-0000-0000-000000000000	d9fcfb45-960e-4ca2-a94b-d29413e5218c	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:50:11.335771+00	
00000000-0000-0000-0000-000000000000	96bb8949-dded-4da0-b4f3-6d80a1d9bdb5	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:50:12.77644+00	
00000000-0000-0000-0000-000000000000	8b46253d-282a-40c2-927e-252c02e29e84	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:50:16.43177+00	
00000000-0000-0000-0000-000000000000	f14e0a5a-6a79-43b6-9577-ea5157a42e5f	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:50:17.852284+00	
00000000-0000-0000-0000-000000000000	1e7e458f-6098-4c22-9bec-de0c7b25e060	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:50:35.742727+00	
00000000-0000-0000-0000-000000000000	d9a380f6-4268-419c-8a10-9e8329756fcd	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:50:36.838927+00	
00000000-0000-0000-0000-000000000000	54265153-0fd8-49a3-b18b-9e8745e37051	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:52:03.96988+00	
00000000-0000-0000-0000-000000000000	c437e0d6-7262-4208-8ad3-fb1e55a30813	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:54:15.627711+00	
00000000-0000-0000-0000-000000000000	426218e3-500e-47f6-a322-fd4a4972c94b	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:55:02.76297+00	
00000000-0000-0000-0000-000000000000	72fc292d-f985-4dc3-8437-e5aa3da609f7	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:55:03.750176+00	
00000000-0000-0000-0000-000000000000	fc6e1e9b-5292-4ae5-aa89-71b7fc794af5	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 19:56:18.782151+00	
00000000-0000-0000-0000-000000000000	ae031470-925b-4f6b-bd99-e8bff636c47b	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 19:59:59.818677+00	
00000000-0000-0000-0000-000000000000	a8dce9d8-8daf-46d8-9313-4e734d74f361	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 20:00:00.700794+00	
00000000-0000-0000-0000-000000000000	6a31446e-50e6-498b-8266-a0b0ed34d6ea	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 20:03:38.265821+00	
00000000-0000-0000-0000-000000000000	7d7a6a1f-3ba0-45b4-9550-3df4e74e9a16	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 20:03:38.983478+00	
00000000-0000-0000-0000-000000000000	9be7f525-6ce1-43f0-bd01-8256db803a49	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 20:04:23.229037+00	
00000000-0000-0000-0000-000000000000	d2cd44c2-5284-4dbd-8d27-839b1ec5a628	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 20:04:24.178002+00	
00000000-0000-0000-0000-000000000000	baa314e6-f086-4f6f-bc59-103494836d71	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 20:09:04.398525+00	
00000000-0000-0000-0000-000000000000	ceaba7af-54d9-4560-a88e-0bebc6bea8a1	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 20:09:21.064791+00	
00000000-0000-0000-0000-000000000000	ffec1454-5b3f-4d6b-b294-fafdb7496f5c	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 20:10:03.498356+00	
00000000-0000-0000-0000-000000000000	d754d588-523c-4a26-a3d8-88ca2130fbc7	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 20:10:11.430577+00	
00000000-0000-0000-0000-000000000000	17a12b0d-04be-45bd-a90b-3f780b98d327	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-13 20:10:15.582023+00	
00000000-0000-0000-0000-000000000000	55ed1aa3-b67a-4fad-98e9-03b870d45b60	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-13 20:10:19.232383+00	
00000000-0000-0000-0000-000000000000	000affea-ead0-4d9c-bdf2-302eec2fa124	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:02:54.477828+00	
00000000-0000-0000-0000-000000000000	753b377b-b565-4b6b-a64d-15544c7591f2	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 00:02:54.508213+00	
00000000-0000-0000-0000-000000000000	e65b2b2a-5486-49e8-938b-328dbebce73e	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:02:55.171876+00	
00000000-0000-0000-0000-000000000000	362c9cee-fbf0-4cd0-9633-31143603d2f0	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 00:03:08.135861+00	
00000000-0000-0000-0000-000000000000	f5b5ab4d-8559-4d19-a4b2-ca2fcc918c45	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:03:18.015017+00	
00000000-0000-0000-0000-000000000000	81732558-dbb3-4c08-b3a5-4fb964518163	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:16:55.751749+00	
00000000-0000-0000-0000-000000000000	c958f297-1cc8-4739-b261-c4a1f75ecc77	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:24:14.129435+00	
00000000-0000-0000-0000-000000000000	ba611389-30ba-4370-bf18-742634680dd1	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 00:34:07.955972+00	
00000000-0000-0000-0000-000000000000	0d28fffe-4b4d-42d3-bd10-28df750c5c35	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:34:20.222728+00	
00000000-0000-0000-0000-000000000000	2ed9701e-7fb0-45ad-83b6-e6f19c4fd9fb	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:37:30.849989+00	
00000000-0000-0000-0000-000000000000	88ab1461-c32d-4c67-99ea-ce0cc06893f2	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:39:17.812832+00	
00000000-0000-0000-0000-000000000000	76aea364-4b9c-4517-80d4-a37ebe4800bb	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:39:37.434183+00	
00000000-0000-0000-0000-000000000000	42d4080c-7a50-4f59-89c7-afc72ef38100	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 00:39:39.027406+00	
00000000-0000-0000-0000-000000000000	6efe87d4-97a0-47cf-b288-abdb1c66f610	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:39:39.849615+00	
00000000-0000-0000-0000-000000000000	5d024dbf-90e8-465d-9d91-15444984692c	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:40:04.597958+00	
00000000-0000-0000-0000-000000000000	6c09cb23-14eb-480d-a89e-6d938530e978	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 00:41:29.913853+00	
00000000-0000-0000-0000-000000000000	bbe4e4dc-df95-4300-b097-91ce527aee90	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:41:36.938965+00	
00000000-0000-0000-0000-000000000000	2cd4ff0b-f1fc-45da-8957-77cd9ff6674c	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 00:56:28.230039+00	
00000000-0000-0000-0000-000000000000	cce491bc-a3f7-4b41-9c35-ed7a65a2c3d6	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:56:29.259181+00	
00000000-0000-0000-0000-000000000000	5ff9d357-9aee-4cae-9d2d-b5dab29d33c6	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 00:56:47.062009+00	
00000000-0000-0000-0000-000000000000	7d0f8378-cdc6-4fb7-9baf-3f29ddb2ef76	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 00:56:48.194399+00	
00000000-0000-0000-0000-000000000000	dc5e28e3-d30a-4b2c-841b-daa9dee54330	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 00:59:12.651696+00	
00000000-0000-0000-0000-000000000000	5b3bcf82-08a1-4dd3-80e7-2949c5b6cedc	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 01:00:33.209027+00	
00000000-0000-0000-0000-000000000000	5fd91b1d-9771-4a17-93c8-13a9fd879748	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 01:00:36.579857+00	
00000000-0000-0000-0000-000000000000	8e3ec8c3-df92-466c-b50e-fe3948d653d1	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 01:01:43.301877+00	
00000000-0000-0000-0000-000000000000	2e1ac06f-9cd4-4e10-9248-5781ef17279e	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 01:01:56.008951+00	
00000000-0000-0000-0000-000000000000	abaf579e-b6f0-4847-a095-dec31c924ce9	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 01:01:57.2748+00	
00000000-0000-0000-0000-000000000000	d147bedb-dcdd-4dc9-9d22-499970f81722	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 01:06:08.265204+00	
00000000-0000-0000-0000-000000000000	054e419a-b482-410e-9af0-fecbf2992f8e	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 01:39:43.91042+00	
00000000-0000-0000-0000-000000000000	69069e36-7bac-44c2-b59b-d33b79b3264b	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 01:45:30.289972+00	
00000000-0000-0000-0000-000000000000	6d92a8da-7086-4e70-9217-94dcd708c5ab	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 01:45:31.558603+00	
00000000-0000-0000-0000-000000000000	973c7f3b-bee7-421f-81e3-65f762fbe099	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 01:45:42.340683+00	
00000000-0000-0000-0000-000000000000	4165978c-0d64-40e8-b15b-73a75ab3bd89	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 01:45:56.211303+00	
00000000-0000-0000-0000-000000000000	16bd4895-b1da-445f-8f23-f6ed0db5c89c	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 01:45:58.060096+00	
00000000-0000-0000-0000-000000000000	ea8c5a6d-0322-454e-912b-fcdad66071d3	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 01:59:44.639989+00	
00000000-0000-0000-0000-000000000000	7b492e55-f13b-4621-8eed-92c463b4187d	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 01:59:45.650263+00	
00000000-0000-0000-0000-000000000000	55bb9476-7281-4591-947f-5a551f1bcd08	{"action":"user_confirmation_requested","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-14 02:52:10.756139+00	
00000000-0000-0000-0000-000000000000	3e32f3d1-c409-454d-90b8-cd2041fb40d4	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 03:17:33.247223+00	
00000000-0000-0000-0000-000000000000	fbd53488-46d4-4421-8db6-7fb30c400a64	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 03:17:33.274354+00	
00000000-0000-0000-0000-000000000000	83339762-3159-415a-a589-6a45f60830e6	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 03:17:39.774783+00	
00000000-0000-0000-0000-000000000000	ad2fd5be-11fc-42a8-85da-d79d4e92274e	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 03:17:55.948088+00	
00000000-0000-0000-0000-000000000000	ef54d63e-4d48-48fa-912c-dc838bb0971e	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 03:18:02.231274+00	
00000000-0000-0000-0000-000000000000	c2b88fe3-600b-4a5e-854a-d598c2b33ee2	{"action":"user_confirmation_requested","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-14 03:23:21.0721+00	
00000000-0000-0000-0000-000000000000	1237a346-be6c-4015-b249-17380fa0fadd	{"action":"user_signedup","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-09-14 03:24:09.953282+00	
00000000-0000-0000-0000-000000000000	199fa331-b2a4-4c41-8c06-e277fb281413	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 03:24:16.499954+00	
00000000-0000-0000-0000-000000000000	8c367f9f-2161-417f-b30a-b28a95ce02ab	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 03:24:39.586387+00	
00000000-0000-0000-0000-000000000000	2dd8a0e5-6c51-4393-af8a-d496a91bce08	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 03:24:41.644182+00	
00000000-0000-0000-0000-000000000000	5c5bf5f7-a6a7-4f60-882c-bd9d943c0222	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 03:24:49.511741+00	
00000000-0000-0000-0000-000000000000	87ba5555-3ea9-4105-9712-40475e1cae0f	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 03:24:50.662002+00	
00000000-0000-0000-0000-000000000000	b51de058-8d2e-4ae6-a8d3-f920fa55fefc	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 03:25:26.989762+00	
00000000-0000-0000-0000-000000000000	3d7bdd31-180b-473b-b0d4-9a846f12d0af	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 03:25:28.138281+00	
00000000-0000-0000-0000-000000000000	5dc30485-13b2-4963-a034-8c5941636fe1	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 14:54:17.270193+00	
00000000-0000-0000-0000-000000000000	bcabc6eb-3cc1-4f3e-8322-dea94e919876	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 14:54:17.299+00	
00000000-0000-0000-0000-000000000000	d741fa83-02b1-4b3e-aa5c-0ca25a4c8c36	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 14:54:18.937282+00	
00000000-0000-0000-0000-000000000000	cb710fe7-6a73-43cf-ba14-41d7d8557015	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 15:17:10.02133+00	
00000000-0000-0000-0000-000000000000	15025524-65ce-4051-8af1-c334f49b85a7	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 15:17:11.837571+00	
00000000-0000-0000-0000-000000000000	9430a3ea-2a52-4eca-8d45-f9b9f153eb72	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 15:17:13.907369+00	
00000000-0000-0000-0000-000000000000	92d43f61-c34e-41ed-aed8-168b1dc6edd3	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 15:17:29.856467+00	
00000000-0000-0000-0000-000000000000	e76065e7-44d6-4465-9781-fbb4eff081cb	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 15:19:53.143306+00	
00000000-0000-0000-0000-000000000000	924574eb-573b-4a69-ae12-21e2686f5b9f	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 15:19:54.738411+00	
00000000-0000-0000-0000-000000000000	265f2023-5e43-4454-a412-65eb931b653d	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 15:23:43.316758+00	
00000000-0000-0000-0000-000000000000	231bf88a-06f0-423b-8b71-5fa9b3cc0eeb	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 15:23:44.598362+00	
00000000-0000-0000-0000-000000000000	4a22187e-d88c-47bc-a2fc-a03bdb01c43e	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 15:23:51.847474+00	
00000000-0000-0000-0000-000000000000	488cdbea-f5e2-4d21-8b8b-6af587d198d7	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 15:23:52.791124+00	
00000000-0000-0000-0000-000000000000	3454b0b9-636a-4cca-9275-fe914433503d	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 15:25:41.529412+00	
00000000-0000-0000-0000-000000000000	f9137ba0-55e6-4c1a-b952-ae0a24508591	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 15:25:43.014496+00	
00000000-0000-0000-0000-000000000000	9cc86a35-7947-429b-b666-c6a6869fe1e2	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 15:40:33.749329+00	
00000000-0000-0000-0000-000000000000	dd55c0b2-4141-4b0d-8ab2-ab3d1ec93e04	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 15:40:52.180913+00	
00000000-0000-0000-0000-000000000000	e694f65c-c8b4-47e9-8b81-5042b72599c1	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 15:54:19.317773+00	
00000000-0000-0000-0000-000000000000	3d16fa40-1911-4396-8ced-551eb543969f	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 15:55:25.138857+00	
00000000-0000-0000-0000-000000000000	7321d95b-2a69-45f2-a2d1-7ee48f0952cb	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 16:10:32.881752+00	
00000000-0000-0000-0000-000000000000	f2a8b882-4348-4573-a293-b0485cc02da3	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 16:10:43.079029+00	
00000000-0000-0000-0000-000000000000	57768acd-3ad9-45a0-81da-9122de6a2338	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 16:10:56.072148+00	
00000000-0000-0000-0000-000000000000	6cd9784b-8da7-47d9-ac3f-12047765017d	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:07:56.569996+00	
00000000-0000-0000-0000-000000000000	075a68b3-8e29-4ddb-bd80-116beed457af	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:08:06.979726+00	
00000000-0000-0000-0000-000000000000	82522b9b-0ba3-4005-8a13-5417e5d28ef0	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:08:08.40002+00	
00000000-0000-0000-0000-000000000000	ba09399c-5c1d-4daa-94b7-b32c4a897e40	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:08:19.1263+00	
00000000-0000-0000-0000-000000000000	af3521f5-68a2-41cc-b8c1-74999f81fae5	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:08:24.332505+00	
00000000-0000-0000-0000-000000000000	612f3a99-eecd-4039-9247-09bc919f1de8	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:15:24.533069+00	
00000000-0000-0000-0000-000000000000	52567f17-f48a-47a9-baf2-e43443eee6f7	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:15:26.155699+00	
00000000-0000-0000-0000-000000000000	3f06ff18-69f5-4652-ab4b-9239945a8ca8	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:15:34.431296+00	
00000000-0000-0000-0000-000000000000	7460d49d-7f66-4618-ba4e-345f42a333ec	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:26:56.648661+00	
00000000-0000-0000-0000-000000000000	47e5f520-4156-46be-8b1c-67a1127e28e0	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:27:03.447192+00	
00000000-0000-0000-0000-000000000000	ece2d616-8d96-4601-a9f5-103b3cd56577	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:27:06.541668+00	
00000000-0000-0000-0000-000000000000	e4c1d69c-e6a0-4781-b358-ffa44918ab61	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:27:11.644416+00	
00000000-0000-0000-0000-000000000000	95993a4d-397e-4c1d-a567-f5c2c645d71f	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:27:16.899708+00	
00000000-0000-0000-0000-000000000000	f63c05c2-592d-44a5-b077-47cc552a0747	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:27:24.319969+00	
00000000-0000-0000-0000-000000000000	d92619df-a347-4813-b22f-7d908ff6252f	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:27:26.284687+00	
00000000-0000-0000-0000-000000000000	00bfa7d2-f71b-4f83-b67b-833aeee84fe6	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:27:30.194637+00	
00000000-0000-0000-0000-000000000000	bce36f2a-07db-457b-9467-5b4ccbc8344e	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:27:34.760837+00	
00000000-0000-0000-0000-000000000000	6ab12594-78b9-4a2f-926f-aba1dc7ec77d	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:27:35.969481+00	
00000000-0000-0000-0000-000000000000	5354fb87-2300-47c2-9911-534c5e2b8dac	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:27:40.721571+00	
00000000-0000-0000-0000-000000000000	c92b5199-b2ca-4dcf-9d62-f99ed2c33326	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:27:50.213294+00	
00000000-0000-0000-0000-000000000000	465e98cc-8f24-4a5b-ab56-56222faab7aa	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:27:51.29245+00	
00000000-0000-0000-0000-000000000000	78f59705-c499-47f4-a4ea-9bc660d1da7c	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:37:04.498224+00	
00000000-0000-0000-0000-000000000000	88474e8e-d365-41b5-baf1-bf16a1bab770	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:39:04.549285+00	
00000000-0000-0000-0000-000000000000	52c0c4cd-13f1-45b3-b424-bb014a870022	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:39:10.798478+00	
00000000-0000-0000-0000-000000000000	1bf96b14-6faa-4583-ac09-94666c59ea1b	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:55:24.874899+00	
00000000-0000-0000-0000-000000000000	b079fee7-9b17-4673-81ad-a779b76cb2d7	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:58:24.851089+00	
00000000-0000-0000-0000-000000000000	8e3994f2-d327-4419-87a2-f0100e3d9576	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:58:25.949488+00	
00000000-0000-0000-0000-000000000000	b04f8787-63b0-4764-af01-49bcdee43a57	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:59:47.148581+00	
00000000-0000-0000-0000-000000000000	23d10b3c-16e4-4d9d-a00b-d402f31334f1	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 17:59:48.46978+00	
00000000-0000-0000-0000-000000000000	ae220191-8cd8-4389-94d0-5e50365b67ec	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 17:59:55.580359+00	
00000000-0000-0000-0000-000000000000	5eb8968c-509e-4367-be38-25702ae5c1ec	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 18:00:00.749747+00	
00000000-0000-0000-0000-000000000000	e460999d-50f4-400d-a4f7-c23a063465e1	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 18:08:19.702992+00	
00000000-0000-0000-0000-000000000000	c4b706ee-f5e9-4512-ad74-edbd28472600	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 18:08:24.632283+00	
00000000-0000-0000-0000-000000000000	d8de959a-e902-4407-9866-19b728108654	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 18:08:46.217502+00	
00000000-0000-0000-0000-000000000000	c2381708-87d7-4363-b474-eab877c1bde6	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 18:08:54.330563+00	
00000000-0000-0000-0000-000000000000	199b886d-f917-4e5b-852d-572452e86280	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 18:08:56.145943+00	
00000000-0000-0000-0000-000000000000	017a0cea-6aee-4169-9f10-f0c0d998d8ec	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 18:14:47.534093+00	
00000000-0000-0000-0000-000000000000	9ad6316d-56bc-443f-aeab-59b0daee9c0e	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 18:15:21.258754+00	
00000000-0000-0000-0000-000000000000	a0004e72-ca1b-46d1-be1f-1fc3e31b0ac0	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 18:15:30.741712+00	
00000000-0000-0000-0000-000000000000	b47c1bb7-9f29-4b00-95df-c936dcd39ccb	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 18:15:55.263495+00	
00000000-0000-0000-0000-000000000000	db58399b-160f-4be0-a9dd-81790f51d654	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 18:16:36.378802+00	
00000000-0000-0000-0000-000000000000	62da7ebf-139f-49d2-95b6-73351d0defe9	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 18:16:41.096763+00	
00000000-0000-0000-0000-000000000000	1d3ce428-a03d-4cbd-96d1-8f1c9d60691b	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 18:16:45.731783+00	
00000000-0000-0000-0000-000000000000	c7765d5d-3efa-4508-904f-d95fbe2e1bb6	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 18:16:46.70571+00	
00000000-0000-0000-0000-000000000000	34ecd0b1-c217-4670-b2bf-2e281c2829aa	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 18:17:29.256558+00	
00000000-0000-0000-0000-000000000000	ddecc08f-6fc1-48c3-80b2-edb37fe0dcf2	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 18:17:34.113176+00	
00000000-0000-0000-0000-000000000000	8b0044dd-805b-47e7-baa9-74f6ec2626df	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 18:17:40.620024+00	
00000000-0000-0000-0000-000000000000	ef6f1cd1-71e3-4a80-9f88-1b47209135ba	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 18:17:41.655031+00	
00000000-0000-0000-0000-000000000000	d0951863-2c74-463f-afc7-a65fb27fd389	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 19:25:40.586253+00	
00000000-0000-0000-0000-000000000000	29b30444-6b62-4f3a-8bbb-569dc081ab51	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 19:25:40.601361+00	
00000000-0000-0000-0000-000000000000	faa4bf62-7d70-400a-a0e3-2ba03c680798	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 19:25:51.046833+00	
00000000-0000-0000-0000-000000000000	19acf1e4-dd0d-45bf-82e9-1821c3f25199	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 19:26:14.007812+00	
00000000-0000-0000-0000-000000000000	f0928b0a-bd23-4ccf-8f59-3ff8689bfb51	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 19:26:19.342214+00	
00000000-0000-0000-0000-000000000000	9ef3cd34-4fb3-43cd-a528-0b402c0fe649	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 19:26:23.552818+00	
00000000-0000-0000-0000-000000000000	2684a220-8992-481f-8b9d-d72b62cf3ff1	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 19:26:24.652544+00	
00000000-0000-0000-0000-000000000000	bf76cd5a-8fdc-44db-890c-d7777ebf7574	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 20:41:08.561027+00	
00000000-0000-0000-0000-000000000000	01593836-e6d7-4fef-91b1-43e26266cbf5	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 20:41:08.589642+00	
00000000-0000-0000-0000-000000000000	b88abadb-a9b6-4368-b20c-34b6642f8455	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 23:30:23.068701+00	
00000000-0000-0000-0000-000000000000	274b499b-8feb-4a1f-b88e-b86859b9a8f8	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-14 23:30:23.087129+00	
00000000-0000-0000-0000-000000000000	8b7f9791-4cdb-4055-805b-d2b23ad8bb17	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 23:38:02.065126+00	
00000000-0000-0000-0000-000000000000	08d1fe7e-9adf-4aba-9e8d-25fb87bd725c	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 23:38:10.344862+00	
00000000-0000-0000-0000-000000000000	c891bdf6-05ca-4947-b58d-2b1da376a1ff	{"action":"user_repeated_signup","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-14 23:38:12.738227+00	
00000000-0000-0000-0000-000000000000	63f499ae-85c1-4be6-a0fe-3dd6b38987e8	{"action":"user_repeated_signup","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-14 23:38:15.015673+00	
00000000-0000-0000-0000-000000000000	244f3b53-a5a9-4df2-ba9d-b8f6a915e9e4	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 23:42:26.341937+00	
00000000-0000-0000-0000-000000000000	d5a75aab-570a-40f7-aedc-1298d02b292a	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 23:42:30.680553+00	
00000000-0000-0000-0000-000000000000	cac160ff-a2c4-4530-9bd9-82b8f9607f6d	{"action":"user_repeated_signup","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-14 23:42:33.372843+00	
00000000-0000-0000-0000-000000000000	48e4bfae-50fe-44f0-9192-fef471a89520	{"action":"user_repeated_signup","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-14 23:42:56.924945+00	
00000000-0000-0000-0000-000000000000	9b0ba07c-585b-4c1b-a898-9848d7dacda2	{"action":"user_repeated_signup","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-14 23:43:59.967348+00	
00000000-0000-0000-0000-000000000000	b4a24fdb-4ea8-4df4-954a-a5c6fafda27f	{"action":"user_repeated_signup","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-14 23:58:07.687758+00	
00000000-0000-0000-0000-000000000000	b2633141-7781-4081-921c-bdb7506f0e5f	{"action":"user_repeated_signup","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-09-14 23:59:18.057923+00	
00000000-0000-0000-0000-000000000000	12c1b472-46f0-4632-b10f-cd513bf9b7d3	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 23:59:21.853456+00	
00000000-0000-0000-0000-000000000000	b180a9ad-b9c8-4f74-a48c-347101063632	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 23:59:39.053853+00	
00000000-0000-0000-0000-000000000000	7a0d0aa6-3695-4abc-8dd5-20b40ce3461a	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 23:59:44.612539+00	
00000000-0000-0000-0000-000000000000	79b87d01-fa6c-4d2d-8154-606f60dccf2b	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-14 23:59:49.081274+00	
00000000-0000-0000-0000-000000000000	b094dc07-2c73-4e0d-89da-a807451e7b1b	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-14 23:59:50.401851+00	
00000000-0000-0000-0000-000000000000	9eb24578-46d6-4ce0-b7f7-27437f5b0cd5	{"action":"token_refreshed","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 03:01:41.290352+00	
00000000-0000-0000-0000-000000000000	d22c5cc4-c6e3-46df-b839-168e01ee2844	{"action":"token_revoked","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 03:01:41.320241+00	
00000000-0000-0000-0000-000000000000	011c8ce6-ab14-4050-8048-fe138b6e2b8a	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 03:01:43.781934+00	
00000000-0000-0000-0000-000000000000	14ae2b13-8217-4d30-b1c5-7acf7e50d2cc	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 03:07:32.837533+00	
00000000-0000-0000-0000-000000000000	545f0c1e-a74f-4e51-8ce2-b5d7c5db1be4	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 03:07:34.084813+00	
00000000-0000-0000-0000-000000000000	c546d49b-5c37-495d-867e-6d7e42fa7225	{"action":"token_refreshed","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 04:37:07.409103+00	
00000000-0000-0000-0000-000000000000	72e7b698-f271-47a8-8b5b-a8f0527adff8	{"action":"token_revoked","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 04:37:07.436262+00	
00000000-0000-0000-0000-000000000000	f058eab4-27ab-432c-92e6-d91a4373e492	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 04:37:10.293111+00	
00000000-0000-0000-0000-000000000000	6825bf00-3a9d-46c4-ac69-97ba36432533	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 04:38:19.781799+00	
00000000-0000-0000-0000-000000000000	8b4fd201-28e1-46fc-8faf-2772dbb90f06	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 04:40:07.643502+00	
00000000-0000-0000-0000-000000000000	ccd3095d-a644-4f03-b400-92193af881ae	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 04:40:13.117269+00	
00000000-0000-0000-0000-000000000000	1f3d6fff-f207-4bec-95d7-aaa89a251f5b	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 04:40:35.664397+00	
00000000-0000-0000-0000-000000000000	5db9a5af-dea7-4bbf-aeef-703ec64f0e6b	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 04:40:40.227744+00	
00000000-0000-0000-0000-000000000000	297f43bc-67b7-48f2-8d36-84ab6e4eedcb	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 04:41:49.924709+00	
00000000-0000-0000-0000-000000000000	d8b1fc42-e276-467b-be8f-f9a273b8f99b	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 04:41:51.324664+00	
00000000-0000-0000-0000-000000000000	56967f99-c8e5-4b79-b214-ddbb1dc4439d	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 04:48:35.557335+00	
00000000-0000-0000-0000-000000000000	3433a910-9a6e-4f29-8c1c-501fcfb26a17	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 04:48:38.289641+00	
00000000-0000-0000-0000-000000000000	c88046c3-e097-4010-9e1a-6ecaeffb45be	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 04:48:43.887003+00	
00000000-0000-0000-0000-000000000000	d312f186-4a0b-45a7-9775-5b3c3e61cc53	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 04:49:45.26287+00	
00000000-0000-0000-0000-000000000000	673b10ca-06a8-4df6-8432-06d65ba8d576	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 05:00:59.183164+00	
00000000-0000-0000-0000-000000000000	3b3ee5b4-e4a9-4e56-a297-bb095917fd78	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 17:11:06.847875+00	
00000000-0000-0000-0000-000000000000	b2a4534b-32e5-4d90-a0ec-5ec303e18ce9	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-15 17:11:06.876837+00	
00000000-0000-0000-0000-000000000000	c5a4417f-a077-4538-988e-53a482e77f0a	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 17:11:07.660432+00	
00000000-0000-0000-0000-000000000000	39fcf35c-c509-485d-b7db-fe3ae45d0c5d	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 17:11:25.682561+00	
00000000-0000-0000-0000-000000000000	c2596538-9083-4d34-ab3a-325f774b4ca8	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 17:11:30.511895+00	
00000000-0000-0000-0000-000000000000	8fd1a95e-cb00-4d68-adda-d730c96709f1	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 17:11:39.936588+00	
00000000-0000-0000-0000-000000000000	69ab7e53-ac70-4284-a78a-16a880fe76f7	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 17:11:41.184608+00	
00000000-0000-0000-0000-000000000000	6f14c1e9-7593-45ed-9808-68e424a0b493	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 17:50:18.082919+00	
00000000-0000-0000-0000-000000000000	e854ae9b-8746-40c7-8fea-e77a9cbff7b7	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 17:50:29.090076+00	
00000000-0000-0000-0000-000000000000	54f3af00-015a-4c99-8b80-f8cad0a7d819	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 17:50:31.901858+00	
00000000-0000-0000-0000-000000000000	1fb64bfd-8fd0-4798-a0b6-913b669d2714	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 17:50:32.95995+00	
00000000-0000-0000-0000-000000000000	7268330b-97cf-49cc-acdd-60701a7294e6	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 17:50:43.725274+00	
00000000-0000-0000-0000-000000000000	ccb255ff-c856-4c2a-ad73-4c4c62cb5ce8	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 17:50:51.062295+00	
00000000-0000-0000-0000-000000000000	e884688c-4298-42e1-96d3-7e032f246ba5	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-15 17:50:54.143891+00	
00000000-0000-0000-0000-000000000000	dc10e8c3-19c8-4e6f-a98a-758174098284	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-15 17:50:55.683702+00	
00000000-0000-0000-0000-000000000000	ad9230ec-78a0-4da1-b467-e5e2234d4606	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 17:18:36.734379+00	
00000000-0000-0000-0000-000000000000	f6031a70-4527-4efa-8df1-6b566948126f	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-17 17:18:36.747729+00	
00000000-0000-0000-0000-000000000000	a141ccd8-09eb-432d-ba82-032ed2a5f25b	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-17 17:19:38.032402+00	
00000000-0000-0000-0000-000000000000	ce6b30ae-182b-4d98-a835-3ede30186b9c	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-17 17:19:46.367305+00	
00000000-0000-0000-0000-000000000000	55bbe6bc-714d-4506-b5ea-3f9f5c7c0115	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-17 17:19:51.430332+00	
00000000-0000-0000-0000-000000000000	9a670343-27d6-40b5-9bda-b43f22c59daa	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-17 17:19:53.715933+00	
00000000-0000-0000-0000-000000000000	7ed34c46-d799-40e2-a9de-c9dade8e08b2	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-17 17:19:56.014791+00	
00000000-0000-0000-0000-000000000000	fa6daef0-b013-40d0-b143-cddb0c582d66	{"action":"token_refreshed","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 04:10:06.268419+00	
00000000-0000-0000-0000-000000000000	ffd9a1f3-4f65-4865-96bf-ef8cfb66f04d	{"action":"token_revoked","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-20 04:10:06.279465+00	
00000000-0000-0000-0000-000000000000	e95df535-a4d7-4b1f-a06d-677ba96c032e	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-20 04:10:07.213138+00	
00000000-0000-0000-0000-000000000000	7ff2d59c-f161-4fe8-9e48-7c2ec49e01c8	{"action":"token_refreshed","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 02:36:24.938242+00	
00000000-0000-0000-0000-000000000000	555c732c-7414-481c-bc05-2a8d646e43ba	{"action":"token_revoked","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-21 02:36:24.979195+00	
00000000-0000-0000-0000-000000000000	4c56483a-53d7-4243-86a5-471b6126ab77	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 02:36:37.484074+00	
00000000-0000-0000-0000-000000000000	54add6c0-2736-4f8e-b324-c5b397e9c158	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-21 02:45:06.772113+00	
00000000-0000-0000-0000-000000000000	34603912-fce6-486c-9687-cca41627c2dd	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 02:45:07.866192+00	
00000000-0000-0000-0000-000000000000	c15da2b7-c0aa-46bb-83d5-4244c65b34fb	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-21 02:47:09.854962+00	
00000000-0000-0000-0000-000000000000	4586bd9a-0965-466d-9327-3672019219ba	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 02:47:21.595773+00	
00000000-0000-0000-0000-000000000000	edfb4c7f-2931-42db-99ae-b4dbe9995010	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-21 02:49:38.343042+00	
00000000-0000-0000-0000-000000000000	4a974f56-f8e1-4134-8fc7-f74952f9fd8e	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 02:49:38.822914+00	
00000000-0000-0000-0000-000000000000	60320efb-5c31-4eac-b9ca-10e23c2fdc35	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-21 02:49:39.721248+00	
00000000-0000-0000-0000-000000000000	f9341e0b-a96b-49e0-8b25-a176744624a7	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 02:49:56.865172+00	
00000000-0000-0000-0000-000000000000	af5db4d8-5d50-4604-b4bb-d0949c668451	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 02:51:40.994632+00	
00000000-0000-0000-0000-000000000000	8415aa89-dc60-4e75-b9ec-b29510976758	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 03:20:25.255779+00	
00000000-0000-0000-0000-000000000000	2724fe9c-ba26-4852-bd6f-af737de81b6c	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 03:52:25.78481+00	
00000000-0000-0000-0000-000000000000	0ef76c40-cfb9-4da3-9e17-3c6242016abb	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-21 04:08:28.594372+00	
00000000-0000-0000-0000-000000000000	277cf828-e2b5-4bb8-bd95-0d426d5f376e	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 04:08:29.961551+00	
00000000-0000-0000-0000-000000000000	37ad3a09-c6a2-4519-aab9-2caf9b7e1bb6	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 04:08:55.501406+00	
00000000-0000-0000-0000-000000000000	f6f1ff5e-bd12-4cb7-a64c-9bcb8a9a1573	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 04:17:35.565257+00	
00000000-0000-0000-0000-000000000000	7cd3c9c6-b2cf-4c14-93db-0621c2f3d3c4	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 04:17:35.585592+00	
00000000-0000-0000-0000-000000000000	3d7435e6-4cec-4781-af37-062b1d9a9ceb	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 04:20:25.820545+00	
00000000-0000-0000-0000-000000000000	13052541-0786-405c-8b48-f045ffa235eb	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 04:20:25.889229+00	
00000000-0000-0000-0000-000000000000	edd63072-84f2-4a98-8f30-c8aad0623027	{"action":"login","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-21 04:20:36.078562+00	
00000000-0000-0000-0000-000000000000	3fc7bc28-37ea-4fae-9826-c6316ac9f3e0	{"action":"logout","actor_id":"04710c85-cdfa-4b6b-a50b-6bce632d1836","actor_username":"dragonscripter03@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-21 04:29:11.315539+00	
00000000-0000-0000-0000-000000000000	b6ae5d84-0db1-4e7c-b5d8-305bc9c121b6	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 00:39:49.480043+00	
00000000-0000-0000-0000-000000000000	b55f6e15-b4d3-4fd5-8dce-f85ff20e337d	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 00:39:49.493028+00	
00000000-0000-0000-0000-000000000000	74f64d0d-a50d-44dd-895e-9e9fe21377ad	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 00:39:53.893366+00	
00000000-0000-0000-0000-000000000000	18b89323-6684-4a93-8d87-522146475755	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 01:20:09.300246+00	
00000000-0000-0000-0000-000000000000	2e970ce8-8203-4527-a8f8-67ea1e859dc8	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 15:11:03.774894+00	
00000000-0000-0000-0000-000000000000	923a199c-d599-4884-9205-0bdbcc481756	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 15:11:03.7867+00	
00000000-0000-0000-0000-000000000000	01eee208-59b7-4bdc-b0a2-7f9ff67e98f4	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 15:11:05.224428+00	
00000000-0000-0000-0000-000000000000	6b8ffb03-4ebf-4177-addc-6742bf287579	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 15:27:22.723492+00	
00000000-0000-0000-0000-000000000000	951e8ce8-5070-4fd1-8a83-477f4c5d2cbc	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 15:29:04.720655+00	
00000000-0000-0000-0000-000000000000	a9baf258-6213-43ca-8dd2-9bac7efda03b	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 15:43:13.479225+00	
00000000-0000-0000-0000-000000000000	77fd3c0a-33e4-4968-9c6d-999df4b2e006	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 16:36:06.632686+00	
00000000-0000-0000-0000-000000000000	77e83835-51bb-4db2-86fe-71bcfe7836e3	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 17:27:28.54443+00	
00000000-0000-0000-0000-000000000000	308a91e5-9962-48ad-9492-6e2696a51ab6	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 17:56:44.711388+00	
00000000-0000-0000-0000-000000000000	c02fa4bd-b6b8-4f8a-9c4d-6287cea8d14c	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 18:13:27.626743+00	
00000000-0000-0000-0000-000000000000	a9caa227-4296-401f-a14f-536f5659b494	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 19:43:18.596691+00	
00000000-0000-0000-0000-000000000000	7cd92fa6-6ebf-4ce3-927d-c1ee5d587585	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 19:43:18.612651+00	
00000000-0000-0000-0000-000000000000	88fe872b-0a5e-448d-abcd-d078031a0aaa	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 20:13:02.211763+00	
00000000-0000-0000-0000-000000000000	23f5893e-a6d4-443e-8476-34ae0a42cfed	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 21:26:16.169267+00	
00000000-0000-0000-0000-000000000000	c1944ced-5d7c-4789-ade6-db4e8f8f37a7	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 21:26:16.183097+00	
00000000-0000-0000-0000-000000000000	d33a7b3d-e8c4-4653-9697-8a63397a5168	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-22 21:34:16.726574+00	
00000000-0000-0000-0000-000000000000	1cc9c91a-f8cd-49d8-8690-adfd49ceab15	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 22:56:20.624776+00	
00000000-0000-0000-0000-000000000000	17417973-0c19-41c2-acb9-d9e872baa9a5	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-22 22:56:20.649919+00	
00000000-0000-0000-0000-000000000000	1474160c-b8eb-42eb-9a77-2d3513a2193c	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 00:13:32.417182+00	
00000000-0000-0000-0000-000000000000	5748c60d-890c-45b0-bdec-06d1ef6aa073	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 00:13:32.428649+00	
00000000-0000-0000-0000-000000000000	b8bcd91b-f3d0-411a-9318-eb4678f51772	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 13:11:39.520075+00	
00000000-0000-0000-0000-000000000000	7bc34e92-ac10-4857-961a-55387f8ff102	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 13:11:39.53679+00	
00000000-0000-0000-0000-000000000000	981c4f6a-0af6-4cc3-9892-1806dbc9c519	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-23 13:11:57.636635+00	
00000000-0000-0000-0000-000000000000	33b2c8cd-54d0-4294-b312-a48756cb5e23	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 14:47:01.918853+00	
00000000-0000-0000-0000-000000000000	9ec43ffb-e78a-43c1-9eee-ac39424a4e6a	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-23 14:47:01.93045+00	
00000000-0000-0000-0000-000000000000	6836350b-0cd9-4cc3-ab63-e4b2875d4cd0	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-23 14:47:21.320875+00	
00000000-0000-0000-0000-000000000000	659c14da-d359-4033-9622-42ecf2866e3a	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-23 15:00:55.109564+00	
00000000-0000-0000-0000-000000000000	6167e900-ae39-4c29-a976-3582957d9dfa	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-23 15:01:00.061139+00	
00000000-0000-0000-0000-000000000000	0570ed46-c59a-46db-bad9-018584fe0eab	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-23 15:01:07.609997+00	
00000000-0000-0000-0000-000000000000	90e6c3fd-85f1-4f79-bea3-876b8c2b923f	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-23 15:01:08.654143+00	
00000000-0000-0000-0000-000000000000	b0755b12-60f8-4a5f-8398-1650202d63be	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 17:00:29.582652+00	
00000000-0000-0000-0000-000000000000	496ca95c-7e06-4451-9395-464f672c12c6	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-24 17:00:29.605507+00	
00000000-0000-0000-0000-000000000000	977e7850-49e2-408c-b619-1688af2eafe9	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-24 17:00:31.721212+00	
00000000-0000-0000-0000-000000000000	8b1cbc67-3fe5-498d-9d7f-5ea6d08c4f98	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-24 17:00:39.165671+00	
00000000-0000-0000-0000-000000000000	122bbf41-faa7-4b1c-8231-2cbc656403a2	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-24 17:00:45.004429+00	
00000000-0000-0000-0000-000000000000	d9ee586c-3897-4e48-8e78-3f4f4af6bb76	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 14:32:56.580551+00	
00000000-0000-0000-0000-000000000000	a34b1789-2f34-4d52-9d8f-936f878c77dd	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-09-25 14:32:56.604985+00	
00000000-0000-0000-0000-000000000000	ebb1efe5-4891-4c8b-8957-abd675a6c0c8	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-09-25 14:51:06.78088+00	
00000000-0000-0000-0000-000000000000	9c4955b2-cf40-4b5f-9137-7ad539511d71	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-09-25 14:51:11.162004+00	
00000000-0000-0000-0000-000000000000	1c7ea0f2-f9ea-43b3-874f-56c5e1a15630	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 15:04:05.824371+00	
00000000-0000-0000-0000-000000000000	09ae7d36-38c8-40c7-b878-23363c826d74	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 15:04:06.039242+00	
00000000-0000-0000-0000-000000000000	663e9523-fdff-4eb5-8085-8151de4e631d	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 15:04:28.111477+00	
00000000-0000-0000-0000-000000000000	ac336ea2-2f97-421d-b870-29dbc3ab3aea	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 15:04:30.756451+00	
00000000-0000-0000-0000-000000000000	71a4eef2-b749-4051-986c-a4d20ac2dbc3	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-06 15:05:03.137532+00	
00000000-0000-0000-0000-000000000000	86ff603f-c7f9-4b02-90b1-361fbc028b3b	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 15:05:03.965347+00	
00000000-0000-0000-0000-000000000000	872d8e13-574e-4f58-92b0-f61182eb83bd	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-06 15:05:08.551622+00	
00000000-0000-0000-0000-000000000000	e929f9bd-0cfa-49b6-a5e4-aa43ad65e909	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 15:05:27.021468+00	
00000000-0000-0000-0000-000000000000	cce6b602-f00a-4e7f-9168-5879155d82e0	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-06 15:12:08.08716+00	
00000000-0000-0000-0000-000000000000	93b7ed3e-8e54-4e03-89d1-a2c09bcdce7f	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 15:12:20.807336+00	
00000000-0000-0000-0000-000000000000	a77cb659-0f55-46f0-9beb-7b12ce682412	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 16:09:10.350914+00	
00000000-0000-0000-0000-000000000000	628fac4c-e206-46c6-906a-43a11134cfb4	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-06 16:09:59.615353+00	
00000000-0000-0000-0000-000000000000	193b5e8e-e7d2-4bfd-b805-19874a54c0d6	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 16:10:21.355202+00	
00000000-0000-0000-0000-000000000000	2a86bb14-bfb7-4648-a743-046fb68c6fe1	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-06 16:10:26.281557+00	
00000000-0000-0000-0000-000000000000	0163abef-d83f-4e42-bba3-7ae85ff1bf24	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 16:10:26.940631+00	
00000000-0000-0000-0000-000000000000	aef02878-2662-4971-8171-3af74088784d	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 17:08:34.757076+00	
00000000-0000-0000-0000-000000000000	e4d80bbb-14bb-4061-8f3d-116c812cd2e9	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 17:08:34.756917+00	
00000000-0000-0000-0000-000000000000	76d1c766-e7fc-45b3-ad32-d44fa52c01db	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 17:08:34.779756+00	
00000000-0000-0000-0000-000000000000	095aadfb-b416-4abe-b066-431eaf3c8f3d	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-06 17:08:34.781673+00	
00000000-0000-0000-0000-000000000000	58a536ad-8d79-4153-9e8d-20ed7b2a2ea4	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-06 17:19:34.170382+00	
00000000-0000-0000-0000-000000000000	c21069d8-225e-47ba-a0aa-cd6cbdda55fb	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-06 17:19:36.013534+00	
00000000-0000-0000-0000-000000000000	b5c79cb9-87d2-4e89-acf6-f08f713bdbe0	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 01:03:37.099561+00	
00000000-0000-0000-0000-000000000000	6374652f-74e7-4170-97df-bbaec116e391	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 01:03:37.135957+00	
00000000-0000-0000-0000-000000000000	f5bad84f-8f30-496b-97c9-790160c1666a	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 01:03:59.725923+00	
00000000-0000-0000-0000-000000000000	8e024e9b-a681-4d30-b59b-02c8308557e7	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 01:03:59.728776+00	
00000000-0000-0000-0000-000000000000	00bee42a-f172-4c1d-9588-dbb871c31177	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 01:04:07.261833+00	
00000000-0000-0000-0000-000000000000	c83129b9-02cc-4b0f-9bf9-2fafb20313d6	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 01:04:11.770379+00	
00000000-0000-0000-0000-000000000000	0f0028b8-d200-46f1-a1cc-d71013532b6f	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 01:04:52.81957+00	
00000000-0000-0000-0000-000000000000	af52f239-00a3-4434-834e-d0c88664fdbb	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 01:04:54.888715+00	
00000000-0000-0000-0000-000000000000	29c1e4a9-dbde-407a-99b4-22c0a32821f1	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 01:04:59.075168+00	
00000000-0000-0000-0000-000000000000	96aed6bf-70f4-46cc-a6c6-423bceff2214	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 01:21:36.55642+00	
00000000-0000-0000-0000-000000000000	d6ab51e9-8f2b-4f99-adbb-b90e9738f10e	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 01:21:36.981861+00	
00000000-0000-0000-0000-000000000000	a0b51d68-af3d-4580-adda-6cbb62a72bc2	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 01:21:37.77105+00	
00000000-0000-0000-0000-000000000000	8b2ef43d-c10c-4a23-8aef-3a0feba92eb2	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 01:21:39.024419+00	
00000000-0000-0000-0000-000000000000	04c445a7-879f-4fe4-b9a1-59c6c665d212	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 01:22:21.307782+00	
00000000-0000-0000-0000-000000000000	6face163-0150-49d4-a691-f33ffc8dc271	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 01:22:23.506414+00	
00000000-0000-0000-0000-000000000000	c8b256e6-06a7-4cff-90e8-975208321f0a	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 01:22:24.173489+00	
00000000-0000-0000-0000-000000000000	c7815afc-10c0-4d0f-b25a-590dafa84d84	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 01:22:25.030673+00	
00000000-0000-0000-0000-000000000000	a54fa968-6ecd-45d8-b99b-eaf33b3210fa	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 12:24:10.179045+00	
00000000-0000-0000-0000-000000000000	cc205f89-c06e-4563-a429-551b335a1ccc	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 12:24:10.213718+00	
00000000-0000-0000-0000-000000000000	2e081a17-23d7-43f8-9dda-ea961226b703	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 14:27:04.416415+00	
00000000-0000-0000-0000-000000000000	52696567-7d20-4263-8be0-6ba43d0f501f	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 14:27:04.430186+00	
00000000-0000-0000-0000-000000000000	a76a8778-f67b-4dc4-a91f-e2e86b8d6340	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 14:27:04.438218+00	
00000000-0000-0000-0000-000000000000	4f397268-f01e-4674-9fbb-47251ae422ef	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 14:27:04.443322+00	
00000000-0000-0000-0000-000000000000	15abc8b8-1d8c-4458-93cd-f5c836bde960	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 15:25:11.636862+00	
00000000-0000-0000-0000-000000000000	7799c43d-f1d7-4eb4-b819-767686951d36	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 15:25:11.636101+00	
00000000-0000-0000-0000-000000000000	f918419f-0181-4435-9e13-e6388cb47d22	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 15:25:11.658989+00	
00000000-0000-0000-0000-000000000000	55e7be4d-5951-4023-91b4-0bd235f8f5b7	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 15:25:11.660226+00	
00000000-0000-0000-0000-000000000000	9151f6d2-b5e7-4761-87a1-1e064b704273	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 16:23:13.715727+00	
00000000-0000-0000-0000-000000000000	6a4b6bd7-f0ba-498b-bc3c-605fdeadbb2f	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 16:23:13.714998+00	
00000000-0000-0000-0000-000000000000	81a8e333-9815-45b6-9d6a-893f37baef99	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 16:23:13.731155+00	
00000000-0000-0000-0000-000000000000	6cfbbd64-d8ba-4973-b5e0-cfde38f92c19	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 16:23:13.730299+00	
00000000-0000-0000-0000-000000000000	c920d499-43bb-4b3a-91ab-6e8090af751c	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 16:42:05.287445+00	
00000000-0000-0000-0000-000000000000	74956bf6-9d0d-4c99-a2a9-dcf65487c3f7	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 16:42:05.747506+00	
00000000-0000-0000-0000-000000000000	3c1632fb-a792-4f42-b850-c25a77e3314f	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 16:42:32.896768+00	
00000000-0000-0000-0000-000000000000	003c9e77-4f04-4ba0-bfb9-78dc3de4bf87	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 16:42:34.491628+00	
00000000-0000-0000-0000-000000000000	44ae6c19-6404-4b10-9f93-c8d0c73e95bd	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 16:42:39.0002+00	
00000000-0000-0000-0000-000000000000	8872414c-4f35-4830-a94b-6c0d6f5bc00d	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 16:42:41.011085+00	
00000000-0000-0000-0000-000000000000	07b0b4d3-9d60-465a-b30b-c657414e8a66	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 16:42:57.194932+00	
00000000-0000-0000-0000-000000000000	ed902d72-2829-448f-b4f4-b44f723e55f6	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 16:44:15.889816+00	
00000000-0000-0000-0000-000000000000	569f575a-7b33-4aac-8031-4ad6414ffed5	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 16:44:31.972646+00	
00000000-0000-0000-0000-000000000000	9a2cb724-29dc-440f-9c66-d5678ed24e20	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 16:46:46.134627+00	
00000000-0000-0000-0000-000000000000	17a75992-ba4d-4720-8751-d07ab5e86d87	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 16:47:12.896542+00	
00000000-0000-0000-0000-000000000000	220c3fc7-0e4f-4c95-9886-361b13fdef12	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 16:47:14.981115+00	
00000000-0000-0000-0000-000000000000	741b048a-9994-48c9-9388-1e1f515b7aa7	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 16:47:19.883744+00	
00000000-0000-0000-0000-000000000000	9475770e-69f6-4725-8f70-0903c151a518	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 16:47:25.641408+00	
00000000-0000-0000-0000-000000000000	2024f797-d8a3-4f6d-835f-c476ea9e9eca	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 16:50:24.945442+00	
00000000-0000-0000-0000-000000000000	a2cae9e1-d149-48d8-90d7-d5176c0299ef	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 16:50:27.0834+00	
00000000-0000-0000-0000-000000000000	7d622634-d862-4786-956d-c49b007098a5	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 16:50:29.420021+00	
00000000-0000-0000-0000-000000000000	6f04e348-8e70-4533-bf45-283ced768a6e	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 16:50:33.635112+00	
00000000-0000-0000-0000-000000000000	9161d359-e41d-484b-b897-10c4ff67a603	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 16:52:08.096697+00	
00000000-0000-0000-0000-000000000000	b86a5784-5f48-4786-89cc-d368e0bc20f0	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 16:52:13.999588+00	
00000000-0000-0000-0000-000000000000	f5f1c885-3139-4e7f-9789-57e81e80e9cc	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 17:40:47.479968+00	
00000000-0000-0000-0000-000000000000	f3ff24ca-2844-47cb-a120-638ce1622d59	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 17:50:16.644282+00	
00000000-0000-0000-0000-000000000000	0690bf12-9b4a-43e7-9ef6-71b6a6675188	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 17:50:16.651557+00	
00000000-0000-0000-0000-000000000000	78f6e0c4-1327-407c-8643-b0a6cc2cafe9	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 18:22:15.178048+00	
00000000-0000-0000-0000-000000000000	7b04a503-ee26-4165-a15c-bcaed6cc907e	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 18:22:20.958937+00	
00000000-0000-0000-0000-000000000000	1293c2f4-abeb-45b6-82b1-430afac812eb	{"action":"logout","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 18:24:53.629704+00	
00000000-0000-0000-0000-000000000000	e70a169d-9c2d-4a6a-af55-6b2a64cb84bf	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 18:24:53.713294+00	
00000000-0000-0000-0000-000000000000	1310abd0-c693-4a30-a60f-255cf09c2027	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 18:25:02.627625+00	
00000000-0000-0000-0000-000000000000	c45fe8ec-f1ed-4bc4-b6e7-ae706b26a874	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 18:25:09.186497+00	
00000000-0000-0000-0000-000000000000	0e2e0b30-7063-4eed-992f-41b5faa0fedc	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-07 18:40:25.106674+00	
00000000-0000-0000-0000-000000000000	0b12b858-c082-4bcb-8bb5-3c794c3092be	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-07 18:40:25.769685+00	
00000000-0000-0000-0000-000000000000	773ffc61-0068-48bc-ab2b-14850c37335d	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 21:54:41.769512+00	
00000000-0000-0000-0000-000000000000	45df3fbd-ec40-4770-bcf2-3e96f79ce1b6	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-07 21:54:41.800984+00	
00000000-0000-0000-0000-000000000000	e7abf8e9-81cb-48f9-a5ac-82e05eb4c216	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 13:03:33.514527+00	
00000000-0000-0000-0000-000000000000	4adf6b28-4cfe-46f4-baf0-12c9edd9601d	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 13:03:33.513218+00	
00000000-0000-0000-0000-000000000000	4662fbba-0bd4-4304-8c82-5ef00619a2d8	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 13:03:33.541262+00	
00000000-0000-0000-0000-000000000000	6670109b-4996-4e0a-859c-daf38aa54173	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-08 13:03:33.540444+00	
00000000-0000-0000-0000-000000000000	58ca3a19-ec86-4256-b108-a6e0bd4e3290	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-08 13:40:11.969978+00	
00000000-0000-0000-0000-000000000000	445dd545-1f99-4e14-aece-653fc5a8255e	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-08 13:40:16.24322+00	
00000000-0000-0000-0000-000000000000	1ee11809-2741-4ca3-a0aa-e18d2f59f7bb	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-08 22:50:13.406229+00	
00000000-0000-0000-0000-000000000000	b5681abf-0c6d-4b7c-89bf-b606a43c69e6	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-08 22:50:14.105482+00	
00000000-0000-0000-0000-000000000000	97eee882-2b1d-48d4-9a14-1a82931a1c11	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 01:22:17.517732+00	
00000000-0000-0000-0000-000000000000	3a032924-b06a-44f4-b7c3-5dfa13ff1f6b	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 01:22:17.553027+00	
00000000-0000-0000-0000-000000000000	0b9938f7-969f-4b6c-a009-d3901b3c688e	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 01:41:30.455787+00	
00000000-0000-0000-0000-000000000000	191bb880-5dd1-46fb-9728-0ddde38457a7	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 01:41:31.538143+00	
00000000-0000-0000-0000-000000000000	f2339264-bab4-49ca-b300-f2e16c0a9a80	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 01:41:33.347472+00	
00000000-0000-0000-0000-000000000000	b1839a40-0159-4360-9adc-10730386183e	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 01:48:10.082936+00	
00000000-0000-0000-0000-000000000000	036aa281-9efa-4b61-a152-a78e6f1671db	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 02:56:30.346185+00	
00000000-0000-0000-0000-000000000000	167c250f-3e2b-4af6-be51-62bac792d090	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 02:56:30.372572+00	
00000000-0000-0000-0000-000000000000	0c7501a4-3ddd-4d6d-8a3f-9b85686731fb	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 14:33:17.301526+00	
00000000-0000-0000-0000-000000000000	3befbaff-44db-4063-91fe-fb791c11e20f	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-09 14:33:17.31548+00	
00000000-0000-0000-0000-000000000000	a1a4aa43-52b7-4d00-827b-491f29af445b	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 14:34:09.991775+00	
00000000-0000-0000-0000-000000000000	74f3b008-c562-4ef4-ac46-95af71c94383	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 15:54:57.150095+00	
00000000-0000-0000-0000-000000000000	89a1ec47-13b0-47fa-8e0c-bfa2ca86eb32	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 15:55:49.595213+00	
00000000-0000-0000-0000-000000000000	fb0c6383-264a-4fa0-98c3-2fc6ce53cbc2	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 15:56:00.811984+00	
00000000-0000-0000-0000-000000000000	379816b8-ede9-4ab4-a9dd-f08419e87328	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 15:56:03.262333+00	
00000000-0000-0000-0000-000000000000	ff67508c-a009-4f92-86b5-a7fb1c88393b	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 16:06:19.469989+00	
00000000-0000-0000-0000-000000000000	14ddfcec-95c0-490c-8110-8607d8353183	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 16:09:19.742907+00	
00000000-0000-0000-0000-000000000000	64826958-04c3-4ebf-9ca0-cdaad964ccad	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 16:15:44.59354+00	
00000000-0000-0000-0000-000000000000	90ea80c4-376c-4901-99fc-9009ac187bb9	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 16:30:42.271589+00	
00000000-0000-0000-0000-000000000000	07fff666-45f6-4bc8-8f10-107c00638bc5	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 16:30:43.401806+00	
00000000-0000-0000-0000-000000000000	33d4c483-cc81-4d2e-bfc8-85b73bfafc8e	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 16:30:46.039139+00	
00000000-0000-0000-0000-000000000000	dc847857-bb82-4233-a0aa-f5882fd99759	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 16:30:46.833479+00	
00000000-0000-0000-0000-000000000000	657feb8b-3514-4268-906b-c4498b7b5d6b	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 16:49:15.984933+00	
00000000-0000-0000-0000-000000000000	95383c5e-72e3-45fb-8b90-5e32c685c7d5	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 16:51:27.165692+00	
00000000-0000-0000-0000-000000000000	ca68e2f0-65b3-4e2c-9ba8-1edb78db11c2	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 17:39:22.402058+00	
00000000-0000-0000-0000-000000000000	c9bf4480-d862-40cb-a039-2df3b9b9c282	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 17:39:48.63312+00	
00000000-0000-0000-0000-000000000000	70d33099-3a98-4d4f-bee8-162ee8b4132a	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 17:40:19.667187+00	
00000000-0000-0000-0000-000000000000	169dc34e-fcdb-4fc2-ad8c-bf06f4dcc4b0	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 17:41:30.924425+00	
00000000-0000-0000-0000-000000000000	26763068-12ea-450b-ae31-ab76a52fa455	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 17:41:33.202082+00	
00000000-0000-0000-0000-000000000000	06c52c4b-bc77-49b7-a8f5-07779e5600f7	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 17:41:34.33551+00	
00000000-0000-0000-0000-000000000000	aef3eb33-b715-4465-bb28-3f67e3f974a3	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 17:41:37.909082+00	
00000000-0000-0000-0000-000000000000	fb6b32f4-950f-420c-9321-9d6c743705fa	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 17:43:48.3153+00	
00000000-0000-0000-0000-000000000000	b64a61af-5502-4cf8-8b11-65c517d93a00	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 17:43:58.841924+00	
00000000-0000-0000-0000-000000000000	6537c8de-940e-4da3-bdc0-7b770c2a0ad3	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 17:49:23.652418+00	
00000000-0000-0000-0000-000000000000	4b1d29b3-2c1c-484c-afdd-30c3d4098fa7	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 17:49:26.315438+00	
00000000-0000-0000-0000-000000000000	5677a93b-4bc0-4e6e-b344-2d7f771d6b88	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 17:49:27.547968+00	
00000000-0000-0000-0000-000000000000	622398fd-d76a-4de1-aac9-58fd9c2481b4	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 17:49:38.410797+00	
00000000-0000-0000-0000-000000000000	c4357c28-d605-4e83-aa71-a2844428c7d8	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 17:49:39.144126+00	
00000000-0000-0000-0000-000000000000	54d823ff-907d-4ebf-877e-ffb22c9a3909	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 17:53:43.557809+00	
00000000-0000-0000-0000-000000000000	15348812-5007-40bd-809e-c43e67ce34a0	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 18:22:07.503543+00	
00000000-0000-0000-0000-000000000000	e47dab93-91c0-4f12-800c-adb749a127db	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-09 18:22:08.124369+00	
00000000-0000-0000-0000-000000000000	554b1bca-c77d-4172-9d80-4fc5a3da892d	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-09 18:22:09.329483+00	
00000000-0000-0000-0000-000000000000	e4324cf1-08ce-4018-800c-831622953d47	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-10 13:50:34.878829+00	
00000000-0000-0000-0000-000000000000	3294c5ed-118d-4fac-b9a9-9ca510e4b628	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-10 13:50:42.851729+00	
00000000-0000-0000-0000-000000000000	357e1b70-d848-4d7b-a33c-78fac76473b9	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-10 15:13:24.480208+00	
00000000-0000-0000-0000-000000000000	31a2385d-e150-452d-b10d-f52b7df0e65b	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-10 15:13:24.493042+00	
00000000-0000-0000-0000-000000000000	61ec3339-d641-4e00-9805-14833c967c66	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-10 15:13:36.456636+00	
00000000-0000-0000-0000-000000000000	526f1a61-9a73-4bb5-a15a-74d75916dd36	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-10 15:14:00.645169+00	
00000000-0000-0000-0000-000000000000	a4a17acd-e085-48b6-a087-42ca60c914fa	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-10 15:51:28.158822+00	
00000000-0000-0000-0000-000000000000	df83d559-ce07-470a-88ad-53149c8d446b	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-10 15:51:32.551184+00	
00000000-0000-0000-0000-000000000000	e6838351-3ebb-45bd-8735-0e50f331b7b2	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-10 16:39:42.378097+00	
00000000-0000-0000-0000-000000000000	ab61ee4a-58db-4711-9657-fe5ed590c1c6	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-10 16:39:43.33175+00	
00000000-0000-0000-0000-000000000000	b43212f4-6c51-4550-91e7-2cde3487bf00	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-12 17:21:48.779724+00	
00000000-0000-0000-0000-000000000000	79b6d4ca-00de-4581-8c1b-d7304db164a6	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-12 17:21:48.784463+00	
00000000-0000-0000-0000-000000000000	ef565957-daf3-44c3-ba88-e753f597868a	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-12 17:21:48.803843+00	
00000000-0000-0000-0000-000000000000	485bc7b7-e761-4569-ba8b-91e74e2dfe4e	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-12 17:21:48.803955+00	
00000000-0000-0000-0000-000000000000	0c862be3-2543-4c0c-910f-258cacc5be45	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-19 15:25:58.053862+00	
00000000-0000-0000-0000-000000000000	83b0ee14-cf2f-4580-9c37-4508e23a59a5	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-19 15:25:58.077145+00	
00000000-0000-0000-0000-000000000000	e0fde1f6-268e-4ab2-99b6-cc7341120a90	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-19 17:11:30.095209+00	
00000000-0000-0000-0000-000000000000	ee281d6c-e56b-484e-bd8a-a9f1c24abf45	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-19 17:11:30.117709+00	
00000000-0000-0000-0000-000000000000	538cb632-24fa-4fa0-9259-40625d4ea539	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-26 01:46:48.540368+00	
00000000-0000-0000-0000-000000000000	bf8216f5-2976-4fae-b2ee-d82fba1827d9	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-26 01:46:48.550111+00	
00000000-0000-0000-0000-000000000000	a01fe1bc-e0b9-413b-a7d5-1d35acaa2c38	{"action":"token_refreshed","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-26 01:47:54.556066+00	
00000000-0000-0000-0000-000000000000	db2263a8-8a77-4d1d-9bc0-523df5a87cdc	{"action":"token_revoked","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-26 01:47:54.558788+00	
00000000-0000-0000-0000-000000000000	f686f028-7bac-45e6-a6bd-e25793097489	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-26 01:48:43.161075+00	
00000000-0000-0000-0000-000000000000	763920b6-c25c-49ff-9f9e-ea74facb6ea8	{"action":"token_refreshed","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 02:50:35.541502+00	
00000000-0000-0000-0000-000000000000	9f7ac266-734a-4548-8c80-41b2cbb09a68	{"action":"token_revoked","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 02:50:35.570124+00	
00000000-0000-0000-0000-000000000000	d7f50c80-735c-4726-b59c-cf2f04a82eaa	{"action":"login","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-02 02:15:10.98012+00	
00000000-0000-0000-0000-000000000000	7f999d84-96ec-408d-99f0-59a149d02fe9	{"action":"logout","actor_id":"0747f033-3d78-4c01-b853-4281f0df0b92","actor_username":"antox.qscwdv@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-01-02 02:15:35.641707+00	
00000000-0000-0000-0000-000000000000	5b483d89-6579-49ed-9fdb-ac2fb166a151	{"action":"login","actor_id":"fd5bb50a-01b5-4397-a060-3775a53f4336","actor_username":"jost12.qsc12@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-02 02:15:54.909457+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
0747f033-3d78-4c01-b853-4281f0df0b92	0747f033-3d78-4c01-b853-4281f0df0b92	{"sub": "0747f033-3d78-4c01-b853-4281f0df0b92", "email": "antox.qscwdv@gmail.com", "username": "suka", "email_verified": true, "phone_verified": false}	email	2025-09-13 16:51:16.45779+00	2025-09-13 16:51:16.457843+00	2025-09-13 16:51:16.457843+00	5532ca8b-4115-4b24-b3f6-54272806cc31
fd5bb50a-01b5-4397-a060-3775a53f4336	fd5bb50a-01b5-4397-a060-3775a53f4336	{"sub": "fd5bb50a-01b5-4397-a060-3775a53f4336", "email": "jost12.qsc12@gmail.com", "username": "blya", "email_verified": true, "phone_verified": false}	email	2025-09-13 16:51:45.747533+00	2025-09-13 16:51:45.747589+00	2025-09-13 16:51:45.747589+00	af7c74d5-59cf-4629-9466-4a31c2fd0593
04710c85-cdfa-4b6b-a50b-6bce632d1836	04710c85-cdfa-4b6b-a50b-6bce632d1836	{"sub": "04710c85-cdfa-4b6b-a50b-6bce632d1836", "email": "dragonscripter03@gmail.com", "username": "Drago", "email_verified": true, "phone_verified": false}	email	2025-09-14 02:52:10.745328+00	2025-09-14 02:52:10.745386+00	2025-09-14 02:52:10.745386+00	6f43cdd7-cd04-4ac1-8568-6c6666475797
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
1b85290a-fab4-4378-8ea3-6698c4e1e21d	2025-10-10 13:50:42.863189+00	2025-10-10 13:50:42.863189+00	password	9392578d-2edd-4288-9204-75e26a2ccc31
949dcd39-9c83-46d9-ab8f-91e322859d1f	2026-01-02 02:15:54.916183+00	2026-01-02 02:15:54.916183+00	password	2bd3b17c-6f8a-4e5a-983e-7ff63586f1cc
2b2e8d91-35fd-472a-9109-49f10beba2c1	2025-10-07 18:25:02.648989+00	2025-10-07 18:25:02.648989+00	password	3fce5e20-f6da-4c59-8a6c-2394dd93b851
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	441	v2uothk7xx35	fd5bb50a-01b5-4397-a060-3775a53f4336	t	2025-10-10 13:50:42.859387+00	2025-10-12 17:21:48.807127+00	\N	1b85290a-fab4-4378-8ea3-6698c4e1e21d
00000000-0000-0000-0000-000000000000	448	of3x2mdugo3i	fd5bb50a-01b5-4397-a060-3775a53f4336	t	2025-10-12 17:21:48.82789+00	2025-10-19 15:25:58.078441+00	v2uothk7xx35	1b85290a-fab4-4378-8ea3-6698c4e1e21d
00000000-0000-0000-0000-000000000000	449	fvdb6iizoyxm	fd5bb50a-01b5-4397-a060-3775a53f4336	t	2025-10-19 15:25:58.106157+00	2025-10-19 17:11:30.118933+00	of3x2mdugo3i	1b85290a-fab4-4378-8ea3-6698c4e1e21d
00000000-0000-0000-0000-000000000000	406	pnmtewrdw5wl	fd5bb50a-01b5-4397-a060-3775a53f4336	t	2025-10-07 18:25:02.634847+00	2025-10-07 21:54:41.804674+00	\N	2b2e8d91-35fd-472a-9109-49f10beba2c1
00000000-0000-0000-0000-000000000000	450	famunuhqfhuv	fd5bb50a-01b5-4397-a060-3775a53f4336	t	2025-10-19 17:11:30.130532+00	2025-10-26 01:47:54.559507+00	fvdb6iizoyxm	1b85290a-fab4-4378-8ea3-6698c4e1e21d
00000000-0000-0000-0000-000000000000	452	mr2ealsopcyc	fd5bb50a-01b5-4397-a060-3775a53f4336	f	2025-10-26 01:47:54.56014+00	2025-10-26 01:47:54.56014+00	famunuhqfhuv	1b85290a-fab4-4378-8ea3-6698c4e1e21d
00000000-0000-0000-0000-000000000000	409	pwrybvyzfnzw	fd5bb50a-01b5-4397-a060-3775a53f4336	t	2025-10-07 21:54:41.828453+00	2025-10-08 13:03:33.542503+00	pnmtewrdw5wl	2b2e8d91-35fd-472a-9109-49f10beba2c1
00000000-0000-0000-0000-000000000000	410	coupau26wr35	fd5bb50a-01b5-4397-a060-3775a53f4336	f	2025-10-08 13:03:33.570108+00	2025-10-08 13:03:33.570108+00	pwrybvyzfnzw	2b2e8d91-35fd-472a-9109-49f10beba2c1
00000000-0000-0000-0000-000000000000	456	4iyntvg6rtdo	fd5bb50a-01b5-4397-a060-3775a53f4336	f	2026-01-02 02:15:54.913318+00	2026-01-02 02:15:54.913318+00	\N	949dcd39-9c83-46d9-ab8f-91e322859d1f
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
1b85290a-fab4-4378-8ea3-6698c4e1e21d	fd5bb50a-01b5-4397-a060-3775a53f4336	2025-10-10 13:50:42.856762+00	2025-10-26 01:47:54.564794+00	\N	aal1	\N	2025-10-26 01:47:54.564719	okhttp/4.12.0	38.49.168.246	\N	\N	\N	\N	\N
949dcd39-9c83-46d9-ab8f-91e322859d1f	fd5bb50a-01b5-4397-a060-3775a53f4336	2026-01-02 02:15:54.912019+00	2026-01-02 02:15:54.912019+00	\N	aal1	\N	\N	Sociophilia/1 CFNetwork/3860.100.1 Darwin/25.1.0	38.131.87.85	\N	\N	\N	\N	\N
2b2e8d91-35fd-472a-9109-49f10beba2c1	fd5bb50a-01b5-4397-a060-3775a53f4336	2025-10-07 18:25:02.630791+00	2025-10-08 13:03:33.591715+00	\N	aal1	\N	2025-10-08 13:03:33.591646	okhttp/4.12.0	184.151.37.167	\N	\N	\N	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	0747f033-3d78-4c01-b853-4281f0df0b92	authenticated	authenticated	antox.qscwdv@gmail.com	$2a$10$oREW87SJcTF0jAmLu8dS0eCyTndxGNDqyZqrsfs7Nkt6Z8GBj6Zh2	2025-09-13 16:51:28.039893+00	\N		2025-09-13 16:51:16.475642+00		\N			\N	2026-01-02 02:15:10.993705+00	{"provider": "email", "providers": ["email"]}	{"sub": "0747f033-3d78-4c01-b853-4281f0df0b92", "email": "antox.qscwdv@gmail.com", "username": "suka", "email_verified": true, "phone_verified": false}	\N	2025-09-13 16:51:16.444381+00	2026-01-02 02:15:11.026148+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	04710c85-cdfa-4b6b-a50b-6bce632d1836	authenticated	authenticated	dragonscripter03@gmail.com	$2a$10$HPy33FNKJjxJBQMg97ZqGeILoVKHqb/r/yQYJwp75wymKhynKM2KS	2025-09-14 03:24:09.954024+00	\N		2025-09-14 03:23:21.083566+00		\N			\N	2025-09-21 04:20:36.079607+00	{"provider": "email", "providers": ["email"]}	{"sub": "04710c85-cdfa-4b6b-a50b-6bce632d1836", "email": "dragonscripter03@gmail.com", "username": "Drago", "email_verified": true, "phone_verified": false}	\N	2025-09-14 02:52:10.647725+00	2025-09-21 04:20:36.081934+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	fd5bb50a-01b5-4397-a060-3775a53f4336	authenticated	authenticated	jost12.qsc12@gmail.com	$2a$10$ZJGgbNt2p4r4syvuhRTLuuEZMMmYUQcU0dLCG5WyOGXz56R9OGmku	2025-09-13 16:52:01.701866+00	\N		2025-09-13 16:51:45.751584+00		\N			\N	2026-01-02 02:15:54.911267+00	{"provider": "email", "providers": ["email"]}	{"sub": "fd5bb50a-01b5-4397-a060-3775a53f4336", "email": "jost12.qsc12@gmail.com", "username": "blya", "email_verified": true, "phone_verified": false}	\N	2025-09-13 16:51:45.742254+00	2026-01-02 02:15:54.915847+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_messages (id, sender_id, chat_id, contents, created_at, metadata) FROM stdin;
022e42d4-cadc-4ba3-b59b-7a51caa71f59	0747f033-3d78-4c01-b853-4281f0df0b92	d20389ce-d726-41b0-b618-e5912addb036	Das	2026-01-02 02:15:27.774513+00	\N
6bdedd44-6ce1-4f5b-ab95-b30543e3da13	0747f033-3d78-4c01-b853-4281f0df0b92	d20389ce-d726-41b0-b618-e5912addb036	Dad	2026-01-02 02:15:29.092089+00	\N
\.


--
-- Data for Name: chat_participants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_participants (chat_id, participant_id, metadata) FROM stdin;
d20389ce-d726-41b0-b618-e5912addb036	0747f033-3d78-4c01-b853-4281f0df0b92	{}
d20389ce-d726-41b0-b618-e5912addb036	fd5bb50a-01b5-4397-a060-3775a53f4336	{}
1d16d237-8e80-4fd1-94f6-b94754b72c49	0747f033-3d78-4c01-b853-4281f0df0b92	{}
1d16d237-8e80-4fd1-94f6-b94754b72c49	04710c85-cdfa-4b6b-a50b-6bce632d1836	{}
\.


--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chats (id, chat_type, metadata) FROM stdin;
d20389ce-d726-41b0-b618-e5912addb036	DIRECT	{}
1d16d237-8e80-4fd1-94f6-b94754b72c49	DIRECT	{}
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, email, phone_number, inserted_at, updated_at) FROM stdin;
0747f033-3d78-4c01-b853-4281f0df0b92	suka	antox.qscwdv@gmail.com	\N	2025-09-13 16:51:16.44404+00	2025-09-13 16:51:16.44404+00
fd5bb50a-01b5-4397-a060-3775a53f4336	blya	jost12.qsc12@gmail.com	\N	2025-09-13 16:51:45.741069+00	2025-09-13 16:51:45.741069+00
04710c85-cdfa-4b6b-a50b-6bce632d1836	Drago	dragonscripter03@gmail.com	\N	2025-09-14 02:52:10.646752+00	2025-09-14 02:52:10.646752+00
\.


--
-- Data for Name: user_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_contacts (uid1, uid2, status, id) FROM stdin;
0747f033-3d78-4c01-b853-4281f0df0b92	fd5bb50a-01b5-4397-a060-3775a53f4336	APPROVED	9eb88206-d230-4d32-ac98-820ed46089e8
\.


--
-- Data for Name: messages_2026_01_01; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_01 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_01_02; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_02 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
chats:0747f033-3d78-4c01-b853-4281f0df0b92	broadcast	{"id": "1667d778-018d-45a7-bc64-55f378401225", "chat_id": "d20389ce-d726-41b0-b618-e5912addb036", "contents": "Vffh", "metadata": null, "sender_id": "0747f033-3d78-4c01-b853-4281f0df0b92", "created_at": "2025-10-26T01:48:04.446787+00:00"}	chats_update	t	2026-01-02 02:15:23.650209	2026-01-02 02:15:23.650209	5a683601-adad-4cf4-ae41-8dd847333a36
chats:fd5bb50a-01b5-4397-a060-3775a53f4336	broadcast	{"id": "1667d778-018d-45a7-bc64-55f378401225", "chat_id": "d20389ce-d726-41b0-b618-e5912addb036", "contents": "Vffh", "metadata": null, "sender_id": "0747f033-3d78-4c01-b853-4281f0df0b92", "created_at": "2025-10-26T01:48:04.446787+00:00"}	chats_update	t	2026-01-02 02:15:23.650209	2026-01-02 02:15:23.650209	07a691d7-fb81-445a-9bce-735cebc6b672
chats:0747f033-3d78-4c01-b853-4281f0df0b92	broadcast	{"id": "e3c09a8d-b287-41b9-ad81-236cd72bc9ad", "chat_id": "d20389ce-d726-41b0-b618-e5912addb036", "contents": "hjjh", "metadata": null, "sender_id": "fd5bb50a-01b5-4397-a060-3775a53f4336", "created_at": "2025-10-26T01:48:08.95723+00:00"}	chats_update	t	2026-01-02 02:15:24.61898	2026-01-02 02:15:24.61898	0f2950cf-1f60-40e4-a991-7f0fca7702f0
chats:fd5bb50a-01b5-4397-a060-3775a53f4336	broadcast	{"id": "e3c09a8d-b287-41b9-ad81-236cd72bc9ad", "chat_id": "d20389ce-d726-41b0-b618-e5912addb036", "contents": "hjjh", "metadata": null, "sender_id": "fd5bb50a-01b5-4397-a060-3775a53f4336", "created_at": "2025-10-26T01:48:08.95723+00:00"}	chats_update	t	2026-01-02 02:15:24.61898	2026-01-02 02:15:24.61898	a7c4ab87-3d18-4170-98a4-0aa75e339cf0
chats:0747f033-3d78-4c01-b853-4281f0df0b92	broadcast	{"id": "4a9a37f6-3fa0-4257-b64e-a4f954cbefc1", "chat_id": "d20389ce-d726-41b0-b618-e5912addb036", "contents": "Fhb", "metadata": null, "sender_id": "0747f033-3d78-4c01-b853-4281f0df0b92", "created_at": "2025-10-26T01:48:15.924673+00:00"}	chats_update	t	2026-01-02 02:15:25.627891	2026-01-02 02:15:25.627891	faa6800f-91ff-4eeb-9dc5-ee46c7fadef2
chats:fd5bb50a-01b5-4397-a060-3775a53f4336	broadcast	{"id": "4a9a37f6-3fa0-4257-b64e-a4f954cbefc1", "chat_id": "d20389ce-d726-41b0-b618-e5912addb036", "contents": "Fhb", "metadata": null, "sender_id": "0747f033-3d78-4c01-b853-4281f0df0b92", "created_at": "2025-10-26T01:48:15.924673+00:00"}	chats_update	t	2026-01-02 02:15:25.627891	2026-01-02 02:15:25.627891	f28be3ae-3727-4c92-b2ed-72bd418ec030
chats:0747f033-3d78-4c01-b853-4281f0df0b92	broadcast	{"id": "022e42d4-cadc-4ba3-b59b-7a51caa71f59", "chat_id": "d20389ce-d726-41b0-b618-e5912addb036", "contents": "Das", "metadata": null, "sender_id": "0747f033-3d78-4c01-b853-4281f0df0b92", "created_at": "2026-01-02T02:15:27.774513+00:00"}	chats_update	t	2026-01-02 02:15:27.774513	2026-01-02 02:15:27.774513	c5f07792-ee29-46d1-a594-45d48f20ff5c
chats:fd5bb50a-01b5-4397-a060-3775a53f4336	broadcast	{"id": "022e42d4-cadc-4ba3-b59b-7a51caa71f59", "chat_id": "d20389ce-d726-41b0-b618-e5912addb036", "contents": "Das", "metadata": null, "sender_id": "0747f033-3d78-4c01-b853-4281f0df0b92", "created_at": "2026-01-02T02:15:27.774513+00:00"}	chats_update	t	2026-01-02 02:15:27.774513	2026-01-02 02:15:27.774513	af156383-218b-4376-8534-d07fe04ee623
chats:0747f033-3d78-4c01-b853-4281f0df0b92	broadcast	{"id": "6bdedd44-6ce1-4f5b-ab95-b30543e3da13", "chat_id": "d20389ce-d726-41b0-b618-e5912addb036", "contents": "Dad", "metadata": null, "sender_id": "0747f033-3d78-4c01-b853-4281f0df0b92", "created_at": "2026-01-02T02:15:29.092089+00:00"}	chats_update	t	2026-01-02 02:15:29.092089	2026-01-02 02:15:29.092089	bf55d4a1-6d4a-492f-846c-cf8fb5202259
chats:fd5bb50a-01b5-4397-a060-3775a53f4336	broadcast	{"id": "6bdedd44-6ce1-4f5b-ab95-b30543e3da13", "chat_id": "d20389ce-d726-41b0-b618-e5912addb036", "contents": "Dad", "metadata": null, "sender_id": "0747f033-3d78-4c01-b853-4281f0df0b92", "created_at": "2026-01-02T02:15:29.092089+00:00"}	chats_update	t	2026-01-02 02:15:29.092089	2026-01-02 02:15:29.092089	558ed22b-a9f5-42cf-8c06-63af6a2e7667
\.


--
-- Data for Name: messages_2026_01_03; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_03 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_01_04; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_04 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_01_05; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_05 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-08-29 15:17:56
20211116045059	2025-08-29 15:17:59
20211116050929	2025-08-29 15:18:02
20211116051442	2025-08-29 15:18:04
20211116212300	2025-08-29 15:18:07
20211116213355	2025-08-29 15:18:09
20211116213934	2025-08-29 15:18:11
20211116214523	2025-08-29 15:18:14
20211122062447	2025-08-29 15:18:17
20211124070109	2025-08-29 15:18:19
20211202204204	2025-08-29 15:18:21
20211202204605	2025-08-29 15:18:23
20211210212804	2025-08-29 15:18:31
20211228014915	2025-08-29 15:18:33
20220107221237	2025-08-29 15:18:35
20220228202821	2025-08-29 15:18:37
20220312004840	2025-08-29 15:18:40
20220603231003	2025-08-29 15:18:43
20220603232444	2025-08-29 15:18:46
20220615214548	2025-08-29 15:18:48
20220712093339	2025-08-29 15:18:51
20220908172859	2025-08-29 15:18:53
20220916233421	2025-08-29 15:18:55
20230119133233	2025-08-29 15:18:57
20230128025114	2025-08-29 15:19:00
20230128025212	2025-08-29 15:19:03
20230227211149	2025-08-29 15:19:05
20230228184745	2025-08-29 15:19:07
20230308225145	2025-08-29 15:19:09
20230328144023	2025-08-29 15:19:12
20231018144023	2025-08-29 15:19:14
20231204144023	2025-08-29 15:19:18
20231204144024	2025-08-29 15:19:20
20231204144025	2025-08-29 15:19:23
20240108234812	2025-08-29 15:19:25
20240109165339	2025-08-29 15:19:27
20240227174441	2025-08-29 15:19:31
20240311171622	2025-08-29 15:19:34
20240321100241	2025-08-29 15:19:39
20240401105812	2025-08-29 15:19:46
20240418121054	2025-08-29 15:19:49
20240523004032	2025-08-29 15:19:57
20240618124746	2025-08-29 15:19:59
20240801235015	2025-08-29 15:20:01
20240805133720	2025-08-29 15:20:04
20240827160934	2025-08-29 15:20:06
20240919163303	2025-08-29 15:20:09
20240919163305	2025-08-29 15:20:11
20241019105805	2025-08-29 15:20:14
20241030150047	2025-08-29 15:20:22
20241108114728	2025-08-29 15:20:25
20241121104152	2025-08-29 15:20:27
20241130184212	2025-08-29 15:20:30
20241220035512	2025-08-29 15:20:32
20241220123912	2025-08-29 15:20:35
20241224161212	2025-08-29 15:20:37
20250107150512	2025-08-29 15:20:39
20250110162412	2025-08-29 15:20:41
20250123174212	2025-08-29 15:20:44
20250128220012	2025-08-29 15:20:46
20250506224012	2025-08-29 15:20:48
20250523164012	2025-08-29 15:20:50
20250714121412	2025-08-29 15:20:52
20250905041441	2025-09-24 23:55:45
20251103001201	2026-01-01 20:38:54
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-08-29 15:17:46.466944
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-08-29 15:17:46.496843
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-08-29 15:17:46.503763
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-08-29 15:17:46.560416
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-08-29 15:17:46.629756
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-08-29 15:17:46.635219
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-08-29 15:17:46.641007
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-08-29 15:17:46.646784
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-08-29 15:17:46.652439
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-08-29 15:17:46.657778
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-08-29 15:17:46.663955
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-08-29 15:17:46.671618
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-08-29 15:17:46.681771
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-08-29 15:17:46.687546
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-08-29 15:17:46.696778
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-08-29 15:17:46.73495
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-08-29 15:17:46.740105
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-08-29 15:17:46.745162
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-08-29 15:17:46.756301
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-08-29 15:17:46.764235
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-08-29 15:17:46.769726
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-08-29 15:17:46.777921
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-08-29 15:17:46.793323
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-08-29 15:17:46.808221
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-08-29 15:17:46.814088
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-08-29 15:17:46.819485
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-09-05 23:26:09.784208
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-09-05 23:26:10.097645
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-09-05 23:26:10.189747
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-09-05 23:26:10.279735
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-09-05 23:26:10.292296
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-09-05 23:26:10.380072
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-09-05 23:26:10.393869
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-09-05 23:26:10.479722
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-09-05 23:26:10.483404
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-09-05 23:26:10.501879
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-09-05 23:26:10.510051
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-09-05 23:26:10.584399
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-09-05 23:26:10.594165
39	add-search-v2-sort-support	39cf7d1e6bf515f4b02e41237aba845a7b492853	2025-09-25 00:26:25.697367
40	fix-prefix-race-conditions-optimized	fd02297e1c67df25a9fc110bf8c8a9af7fb06d1f	2025-09-25 00:26:25.743378
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2025-10-03 15:26:35.095997
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2025-10-03 15:26:35.118951
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2025-10-03 15:26:35.128
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-01-01 20:07:31.247902
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-01-01 20:07:31.269893
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-01-01 20:07:31.336443
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-01-01 20:07:31.344835
48	iceberg-catalog-ids	2666dff93346e5d04e0a878416be1d5fec345d6f	2026-01-01 20:07:31.352065
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-01-01 20:07:31.386224
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
initial	2025-09-14 00:42:05.62075+00
20210809183423_update_grants	2025-09-14 00:42:05.62075+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.schema_migrations (version, statements, name) FROM stdin;
20251010145005	{"SET statement_timeout = 0","SET lock_timeout = 0","SET idle_in_transaction_session_timeout = 0","SET client_encoding = 'UTF8'","SET standard_conforming_strings = on","SELECT pg_catalog.set_config('search_path', '', false)","SET check_function_bodies = false","SET xmloption = content","SET client_min_messages = warning","SET row_security = off","CREATE EXTENSION IF NOT EXISTS \\"pg_net\\" WITH SCHEMA \\"extensions\\"","COMMENT ON SCHEMA \\"public\\" IS 'standard public schema'","CREATE EXTENSION IF NOT EXISTS \\"pg_graphql\\" WITH SCHEMA \\"graphql\\"","CREATE EXTENSION IF NOT EXISTS \\"pg_stat_statements\\" WITH SCHEMA \\"extensions\\"","CREATE EXTENSION IF NOT EXISTS \\"pgcrypto\\" WITH SCHEMA \\"extensions\\"","CREATE EXTENSION IF NOT EXISTS \\"pgtap\\" WITH SCHEMA \\"extensions\\"","CREATE EXTENSION IF NOT EXISTS \\"supabase_vault\\" WITH SCHEMA \\"vault\\"","CREATE EXTENSION IF NOT EXISTS \\"uuid-ossp\\" WITH SCHEMA \\"extensions\\"","CREATE TYPE \\"public\\".\\"chat_type\\" AS ENUM (\n    'DIRECT',\n    'GROUP',\n    'SELF'\n)","ALTER TYPE \\"public\\".\\"chat_type\\" OWNER TO \\"postgres\\"","CREATE TYPE \\"public\\".\\"realtime_events\\" AS ENUM (\n    'contacts_update',\n    'chats_update'\n)","ALTER TYPE \\"public\\".\\"realtime_events\\" OWNER TO \\"postgres\\"","CREATE TYPE \\"public\\".\\"user_friend_status\\" AS ENUM (\n    'REQ_UID1',\n    'REQ_UID2',\n    'APPROVED'\n)","ALTER TYPE \\"public\\".\\"user_friend_status\\" OWNER TO \\"postgres\\"","CREATE OR REPLACE FUNCTION \\"public\\".\\"add_contact\\"(\\"target_username\\" \\"text\\") RETURNS \\"jsonb\\"\n    LANGUAGE \\"plpgsql\\"\n    SET \\"search_path\\" TO ''\n    AS $$DECLARE\n      target_user_id UUID := public.get_user_id_by_username(target_username);\n      client_user_id UUID := auth.uid();\n      uid1_val UUID;\n      uid2_val UUID;\n      status_val public.user_friend_status;\n    BEGIN\n      -- Check if user is authenticated\n      IF client_user_id IS NULL THEN\n        RAISE EXCEPTION 'Not authenticated';\n      END IF;\n\n      -- Check if user exists\n      IF target_user_id IS NULL THEN\n        RAISE EXCEPTION 'User not found';\n      END IF;\n\n      -- Check if trying to add yourself\n      IF target_user_id = client_user_id THEN\n        RAISE EXCEPTION 'Cannot add yourself as contact';\n      END IF;\n\n      -- Check if contact already exists\n      IF EXISTS (SELECT 1 FROM public.user_contacts WHERE uid1 = LEAST(client_user_id, target_user_id) AND uid2 =\n    GREATEST(client_user_id, target_user_id)) THEN\n        RAISE EXCEPTION 'Contact already exists';\n      END IF;\n\n      -- Determine values based on constraint uid1 < uid2\n      IF client_user_id < target_user_id THEN\n        uid1_val := client_user_id;\n        uid2_val := target_user_id;\n        status_val := 'REQ_UID1'::public.user_friend_status;\n      ELSE\n        uid1_val := target_user_id;\n        uid2_val := client_user_id;\n        status_val := 'REQ_UID2'::public.user_friend_status;\n      END IF;\n\n      -- Insert new contact relationship\n      INSERT INTO public.user_contacts (uid1, uid2, status)\n      VALUES (uid1_val, uid2_val, status_val);\n      -- Return JSON object\n      RETURN jsonb_build_object(\n        'user_id', id,\n        'username', username,\n        'status', status_val,\n        'requester_pos', CASE\n          WHEN uid1_val = client_user_id THEN 'REQ_UID1'\n          WHEN uid2_val = client_user_id THEN 'REQ_UID2'\n          ELSE NULL\n        END\n      ) FROM public.\\"user\\" where id = target_user_id;\n  END;$$","ALTER FUNCTION \\"public\\".\\"add_contact\\"(\\"target_username\\" \\"text\\") OWNER TO \\"postgres\\"","CREATE OR REPLACE FUNCTION \\"public\\".\\"approve_contact\\"(\\"target_user_id\\" \\"uuid\\") RETURNS boolean\n    LANGUAGE \\"plpgsql\\"\n    SET \\"search_path\\" TO ''\n    AS $$\n  DECLARE\n      client_user_id UUID;\n      current_status public.user_friend_status;\n      requester_position TEXT;\n      is_less BOOLEAN;\n      result_row RECORD;\n  BEGIN\n      -- Get authenticated user ID\n      client_user_id := auth.uid();\n      IF client_user_id IS NULL THEN\n          RAISE EXCEPTION 'Not authenticated';\n      END IF;\n\n      IF target_user_id IS NULL THEN\n          RAISE EXCEPTION 'User with id % not found', target_user_id;\n      END IF;\n\n      -- Get current friendship status and determine requester position\n      SELECT\n          uc.status,\n          CASE\n              WHEN uc.uid1 = client_user_id THEN 'UID1'\n              WHEN uc.uid2 = client_user_id THEN 'UID2'\n              ELSE NULL\n          END\n      INTO current_status, requester_position\n      FROM public.user_contacts uc\n      WHERE (uc.uid1 = client_user_id AND uc.uid2 = target_user_id)\n         OR (uc.uid1 = target_user_id AND uc.uid2 = client_user_id);\n\n      -- Check if friendship exists\n      IF current_status IS NULL THEN\n          RAISE EXCEPTION 'No friendship request found';\n      END IF;\n\n      -- Check if already approved\n      IF current_status = 'APPROVED' THEN\n          RAISE EXCEPTION 'Friendship already approved';\n      END IF;\n\n      -- Determine if user_id < target_id\n      is_less := client_user_id < target_user_id;\n\n      -- Apply approval logic\n      IF (current_status = 'REQ_UID1' AND is_less) OR (current_status = 'REQ_UID2' AND NOT is_less) THEN\n          RAISE EXCEPTION 'Cannot approve friendship without the target user''s permission';\n      ELSIF (current_status = 'REQ_UID2' AND is_less) OR (current_status = 'REQ_UID1' AND NOT is_less) THEN\n          -- Update status to APPROVED and return the updated row\n          UPDATE public.user_contacts\n          SET status = 'APPROVED'\n          WHERE (uid1 = client_user_id AND uid2 = target_user_id)\n             OR (uid1 = target_user_id AND uid2 = client_user_id);\n      \n\t  RETURN TRUE;\n      ELSE\n          RAISE EXCEPTION 'Invalid friendship state';\n      END IF;\n  END;\n  $$","ALTER FUNCTION \\"public\\".\\"approve_contact\\"(\\"target_user_id\\" \\"uuid\\") OWNER TO \\"postgres\\"","CREATE OR REPLACE FUNCTION \\"public\\".\\"check_chat_participant_limit\\"() RETURNS \\"trigger\\"\n    LANGUAGE \\"plpgsql\\"\n    AS $$BEGIN\r\n    IF (SELECT COUNT(*) FROM public.chat_participants WHERE chat_id = NEW.chat_id) > 100 THEN\r\n      RAISE EXCEPTION 'Chat cannot have more than 100 participants';\r\n    END IF;\r\n    RETURN NEW;\r\n  END;$$","ALTER FUNCTION \\"public\\".\\"check_chat_participant_limit\\"() OWNER TO \\"postgres\\"","CREATE OR REPLACE FUNCTION \\"public\\".\\"create_direct_chat\\"(\\"target_user_id\\" \\"uuid\\") RETURNS \\"jsonb\\"\n    LANGUAGE \\"plpgsql\\"\n    SET \\"search_path\\" TO ''\n    AS $$DECLARE\n    chat_row public.chats%ROWTYPE;\n    client_user_id UUID := auth.uid()::uuid;\nBEGIN\n    IF target_user_id IS NULL THEN\n        RAISE EXCEPTION 'User with id % does not exist', target_user_id;\n    END IF;\n\n    RAISE LOG 'client_user_id: %, target_user_id: %', client_user_id, target_user_id;\n\n    -- Try to find existing direct chat\n    SELECT c.*\n    INTO chat_row\n    FROM public.chats c\n    JOIN public.chat_participants cp1\n        ON cp1.chat_id = c.id AND cp1.participant_id = client_user_id\n    JOIN public.chat_participants cp2\n        ON cp2.chat_id = c.id AND cp2.participant_id = target_user_id\n    WHERE c.chat_type = 'DIRECT'::public.chat_type;\n    \n    IF FOUND THEN\n        RETURN jsonb_build_object(\n            'id', chat_row.id,\n            'chat_type', chat_row.chat_type,\n            'metadata', chat_row.metadata\n        );\n    END IF;\n\n    -- Create new chat\n    INSERT INTO public.chats (chat_type, metadata)\n    VALUES ('DIRECT'::public.chat_type, '{}'::json)\n    RETURNING * INTO chat_row;\n\n    INSERT INTO public.chat_participants (chat_id, participant_id, metadata)\n    VALUES\n        (chat_row.id, client_user_id, '{}'::json),\n        (chat_row.id, target_user_id, '{}'::json);\n\n    RETURN jsonb_build_object(\n        'id', chat_row.id,\n        'chat_type', chat_row.chat_type,\n        'metadata', chat_row.metadata\n    );\nEND;$$","ALTER FUNCTION \\"public\\".\\"create_direct_chat\\"(\\"target_user_id\\" \\"uuid\\") OWNER TO \\"postgres\\"","CREATE OR REPLACE FUNCTION \\"public\\".\\"delete_contact\\"(\\"target_user_id\\" \\"uuid\\") RETURNS boolean\n    LANGUAGE \\"plpgsql\\"\n    SET \\"search_path\\" TO ''\n    AS $$\n  BEGIN\n      -- If user not found, return false\n      IF target_user_id IS NULL THEN\n          RETURN FALSE;\n      END IF;\n\n      -- Delete the contact (RLS will ensure user can only delete their own contacts)\n      DELETE FROM public.user_contacts WHERE uid1 = target_user_id OR uid2 = target_user_id;\n\n      -- Return true if contact was deleted, false if not found or not allowed\n      RETURN FOUND;\n  END;\n  \n  $$","ALTER FUNCTION \\"public\\".\\"delete_contact\\"(\\"target_user_id\\" \\"uuid\\") OWNER TO \\"postgres\\"","CREATE OR REPLACE FUNCTION \\"public\\".\\"get_client_chats\\"() RETURNS \\"jsonb\\"\n    LANGUAGE \\"plpgsql\\"\n    SET \\"search_path\\" TO ''\n    AS $$\nBEGIN\n  RETURN (\n      SELECT jsonb_agg(\n          jsonb_build_object(\n              'id', c.id,\n              'metadata', c.metadata\n          )\n      )\n      FROM public.chats c\n      JOIN public.chat_participants cp ON c.id = cp.chat_id\n      WHERE cp.participant_id = auth.uid()\n  );\nEND;\n$$","ALTER FUNCTION \\"public\\".\\"get_client_chats\\"() OWNER TO \\"postgres\\"","CREATE OR REPLACE FUNCTION \\"public\\".\\"get_contacts\\"(\\"detail_level\\" \\"text\\" DEFAULT 'list'::\\"text\\", \\"page_limit\\" integer DEFAULT 20, \\"page_offset\\" integer DEFAULT 0) RETURNS \\"jsonb\\"\n    LANGUAGE \\"plpgsql\\"\n    SET \\"search_path\\" TO ''\n    AS $$DECLARE\r\n    user_id UUID;\r\n    total_contacts BIGINT;\r\n    requester_position text;\r\nBEGIN\r\n    -- Get current authenticated user ID\r\n    user_id := auth.uid();\r\n\r\n    -- Check if user is authenticated\r\n    IF user_id IS NULL THEN\r\n      RAISE EXCEPTION 'Not authenticated';\r\n    END IF;\r\n\r\n    -- Get total count for pagination info\r\n    SELECT COUNT(*) INTO total_contacts\r\n    FROM public.user_contacts uc\r\n    WHERE uc.uid1 = user_id OR uc.uid2 = user_id;\r\n\r\n     RETURN jsonb_build_object(\r\n      'meta', jsonb_build_object(\r\n        'total_contacts', total_contacts,\r\n        'page_limit', page_limit,\r\n        'page_offset', page_offset\r\n      ),\r\n      'data', COALESCE(\r\n        (SELECT json_agg(contact_row)\r\n        FROM (\r\n          SELECT jsonb_strip_nulls(\r\n            jsonb_build_object(\r\n              'user_id', u.id,\r\n              'username', u.username,\r\n              'status', uc.status,\r\n                'requester_pos', CASE\r\n                    WHEN uc.status != 'APPROVED' THEN\r\n                        CASE\r\n                        WHEN uc.uid1 = user_id THEN 'REQ_UID1'\r\n                        WHEN uc.uid2 = user_id THEN 'REQ_UID2'\r\n                        ELSE NULL\r\n                        END\r\n                    END,\r\n                'email', CASE WHEN detail_level = 'full' THEN u.email END,\r\n              'phone_number', CASE WHEN detail_level = 'full' THEN u.phone_number END\r\n            )\r\n          ) AS contact_row\r\n          FROM public.user_contacts uc\r\n          JOIN public.\\"user\\" u ON (\r\n            CASE\r\n              WHEN uc.uid1 = user_id THEN u.id = uc.uid2\r\n              ELSE u.id = uc.uid1\r\n            END\r\n          )\r\n          WHERE uc.uid1 = user_id OR uc.uid2 = user_id\r\n          ORDER BY u.username ASC\r\n          LIMIT page_limit\r\n          OFFSET page_offset\r\n        ) contacts\r\n        ),\r\n        '[]'::json\r\n      )\r\n    );\r\n  END;$$","ALTER FUNCTION \\"public\\".\\"get_contacts\\"(\\"detail_level\\" \\"text\\", \\"page_limit\\" integer, \\"page_offset\\" integer) OWNER TO \\"postgres\\"","CREATE OR REPLACE FUNCTION \\"public\\".\\"get_direct_chat_by_user_id\\"(\\"target_user_id\\" \\"uuid\\") RETURNS \\"jsonb\\"\n    LANGUAGE \\"plpgsql\\"\n    SET \\"search_path\\" TO ''\n    AS $$DECLARE\n    client_user_id UUID := auth.uid()::uuid;\nBEGIN\n    IF target_user_id IS NULL THEN\n        RAISE EXCEPTION 'User with id % does not exist', target_user_id;\n    END IF;\n\n    RAISE LOG 'client_user_id: %, target_user_id: %', client_user_id, target_user_id;\n\n    -- Try to find existing direct chat\n    RETURN  (\n      SELECT jsonb_build_object(\n        'id', c.id,\n        'chat_type', c.chat_type,\n        'metadata', c.metadata\n      )\n      FROM public.chats c\n      JOIN public.chat_participants cp1\n        ON cp1.chat_id = c.id AND cp1.participant_id = client_user_id\n      JOIN public.chat_participants cp2\n        ON cp2.chat_id = c.id AND cp2.participant_id = target_user_id\n      WHERE c.chat_type = 'DIRECT'::public.chat_type\n    );\nEND;$$","ALTER FUNCTION \\"public\\".\\"get_direct_chat_by_user_id\\"(\\"target_user_id\\" \\"uuid\\") OWNER TO \\"postgres\\"","CREATE OR REPLACE FUNCTION \\"public\\".\\"get_user_id_by_username\\"(\\"target_username\\" \\"text\\") RETURNS \\"uuid\\"\n    LANGUAGE \\"plpgsql\\"\n    SET \\"search_path\\" TO ''\n    AS $$\r\n\r\n   DECLARE\r\n      target_user_id UUID;\r\n    BEGIN\r\n      -- Find target user by username (qualify with table alias)\r\n      SELECT u.id INTO target_user_id\r\n      FROM public.user u\r\n      WHERE u.username = target_username;\r\n\r\n      -- Return JSON object\r\n      RETURN target_user_id;\r\n  END;\r\n$$","ALTER FUNCTION \\"public\\".\\"get_user_id_by_username\\"(\\"target_username\\" \\"text\\") OWNER TO \\"postgres\\"","CREATE OR REPLACE FUNCTION \\"public\\".\\"signup_user\\"() RETURNS \\"trigger\\"\n    LANGUAGE \\"plpgsql\\" SECURITY DEFINER\n    AS $$\r\n  BEGIN\r\n    INSERT INTO public.user (id, email, username)\r\n    VALUES (\r\n      NEW.id,\r\n      NEW.email,\r\n      NEW.raw_user_meta_data->>'username'\r\n    );\r\n\r\n    RETURN NEW;\r\n  EXCEPTION\r\n    WHEN OTHERS THEN\r\n      -- Fail the entire auth signup if profile creation fails\r\n      RAISE EXCEPTION 'Profile creation failed: %', SQLERRM;\r\n  END;\r\n  $$","ALTER FUNCTION \\"public\\".\\"signup_user\\"() OWNER TO \\"postgres\\"","CREATE OR REPLACE FUNCTION \\"public\\".\\"user_contacts_changes\\"() RETURNS \\"trigger\\"\n    LANGUAGE \\"plpgsql\\"\n    SET \\"search_path\\" TO ''\n    AS $$BEGIN\n  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN                   \n    PERFORM realtime.send(\t   \n      '{}'::jsonb,\n      ('contacts_update'::public.realtime_events)::TEXT,\n      CASE WHEN NEW.uid1 = auth.uid() THEN NEW.uid2 ELSE NEW.uid1 END || ':contacts',\n      TRUE\n    );    \n  ELSIF TG_OP = 'DELETE' THEN\n    PERFORM realtime.send(\t   \n      '{}'::jsonb,\n      ('contacts_update'::public.realtime_events)::TEXT,\n      CASE WHEN OLD.uid1 = auth.uid() THEN OLD.uid2 ELSE OLD.uid1 END || ':contacts',\n      TRUE\n    );  \n  END IF;\n  RETURN NULL;\nEND;$$","ALTER FUNCTION \\"public\\".\\"user_contacts_changes\\"() OWNER TO \\"postgres\\"","SET default_tablespace = ''","SET default_table_access_method = \\"heap\\"","CREATE TABLE IF NOT EXISTS \\"public\\".\\"chat_participants\\" (\n    \\"chat_id\\" \\"uuid\\" NOT NULL,\n    \\"participant_id\\" \\"uuid\\" NOT NULL,\n    \\"metadata\\" \\"jsonb\\" NOT NULL\n)","ALTER TABLE \\"public\\".\\"chat_participants\\" OWNER TO \\"postgres\\"","CREATE TABLE IF NOT EXISTS \\"public\\".\\"chats\\" (\n    \\"id\\" \\"uuid\\" DEFAULT \\"gen_random_uuid\\"() NOT NULL,\n    \\"chat_type\\" \\"public\\".\\"chat_type\\" NOT NULL,\n    \\"metadata\\" \\"jsonb\\"\n)","ALTER TABLE \\"public\\".\\"chats\\" OWNER TO \\"postgres\\"","CREATE TABLE IF NOT EXISTS \\"public\\".\\"user\\" (\n    \\"id\\" \\"uuid\\" NOT NULL,\n    \\"username\\" character varying(30) NOT NULL,\n    \\"email\\" character varying(254),\n    \\"phone_number\\" character varying(20),\n    \\"inserted_at\\" timestamp with time zone DEFAULT \\"timezone\\"('utc'::\\"text\\", \\"now\\"()) NOT NULL,\n    \\"updated_at\\" timestamp with time zone DEFAULT \\"timezone\\"('utc'::\\"text\\", \\"now\\"()) NOT NULL,\n    CONSTRAINT \\"email_or_phone_required\\" CHECK ((((\\"email\\" IS NOT NULL) AND ((\\"email\\")::\\"text\\" <> ''::\\"text\\")) OR ((\\"phone_number\\" IS NOT NULL) AND ((\\"phone_number\\")::\\"text\\" <> ''::\\"text\\"))))\n)","ALTER TABLE \\"public\\".\\"user\\" OWNER TO \\"postgres\\"","CREATE TABLE IF NOT EXISTS \\"public\\".\\"user_contacts\\" (\n    \\"uid1\\" \\"uuid\\" NOT NULL,\n    \\"uid2\\" \\"uuid\\" NOT NULL,\n    \\"status\\" \\"public\\".\\"user_friend_status\\" NOT NULL,\n    \\"id\\" \\"uuid\\" DEFAULT \\"gen_random_uuid\\"() NOT NULL,\n    CONSTRAINT \\"check_friend\\" CHECK ((\\"uid1\\" < \\"uid2\\"))\n)","ALTER TABLE \\"public\\".\\"user_contacts\\" OWNER TO \\"postgres\\"","ALTER TABLE ONLY \\"public\\".\\"chat_participants\\"\n    ADD CONSTRAINT \\"chat_participants_pkey\\" PRIMARY KEY (\\"chat_id\\", \\"participant_id\\")","ALTER TABLE ONLY \\"public\\".\\"chats\\"\n    ADD CONSTRAINT \\"chats_pkey\\" PRIMARY KEY (\\"id\\")","ALTER TABLE ONLY \\"public\\".\\"user_contacts\\"\n    ADD CONSTRAINT \\"user_contacts_id_key\\" UNIQUE (\\"id\\")","ALTER TABLE ONLY \\"public\\".\\"user_contacts\\"\n    ADD CONSTRAINT \\"user_contacts_pkey\\" PRIMARY KEY (\\"id\\")","ALTER TABLE ONLY \\"public\\".\\"user\\"\n    ADD CONSTRAINT \\"user_email_key\\" UNIQUE (\\"email\\")","ALTER TABLE ONLY \\"public\\".\\"user\\"\n    ADD CONSTRAINT \\"user_phone_number_key\\" UNIQUE (\\"phone_number\\")","ALTER TABLE ONLY \\"public\\".\\"user\\"\n    ADD CONSTRAINT \\"user_pkey\\" PRIMARY KEY (\\"id\\")","ALTER TABLE ONLY \\"public\\".\\"user\\"\n    ADD CONSTRAINT \\"user_username_key\\" UNIQUE (\\"username\\")","CREATE INDEX \\"idx_chat_participants_chat_count\\" ON \\"public\\".\\"chat_participants\\" USING \\"btree\\" (\\"chat_id\\", \\"participant_id\\")","CREATE INDEX \\"idx_chat_participants_metadata\\" ON \\"public\\".\\"chat_participants\\" USING \\"btree\\" (\\"metadata\\")","CREATE INDEX \\"idx_chat_participants_participant_chat\\" ON \\"public\\".\\"chat_participants\\" USING \\"btree\\" (\\"participant_id\\", \\"chat_id\\")","CREATE INDEX \\"idx_chat_participants_participant_id\\" ON \\"public\\".\\"chat_participants\\" USING \\"btree\\" (\\"participant_id\\")","CREATE OR REPLACE TRIGGER \\"broadcast_changes_for_user_contacts_trigger\\" AFTER INSERT OR DELETE OR UPDATE ON \\"public\\".\\"user_contacts\\" FOR EACH ROW EXECUTE FUNCTION \\"public\\".\\"user_contacts_changes\\"()","CREATE OR REPLACE TRIGGER \\"trigger_participant_limit\\" BEFORE INSERT ON \\"public\\".\\"chat_participants\\" FOR EACH ROW EXECUTE FUNCTION \\"public\\".\\"check_chat_participant_limit\\"()","ALTER TABLE ONLY \\"public\\".\\"chat_participants\\"\n    ADD CONSTRAINT \\"chat_participants_chat_id_fkey\\" FOREIGN KEY (\\"chat_id\\") REFERENCES \\"public\\".\\"chats\\"(\\"id\\") ON DELETE CASCADE","ALTER TABLE ONLY \\"public\\".\\"chat_participants\\"\n    ADD CONSTRAINT \\"chat_participants_participant_id_fkey\\" FOREIGN KEY (\\"participant_id\\") REFERENCES \\"public\\".\\"user\\"(\\"id\\") ON DELETE CASCADE","ALTER TABLE ONLY \\"public\\".\\"user_contacts\\"\n    ADD CONSTRAINT \\"user_contacts_uid1_fkey\\" FOREIGN KEY (\\"uid1\\") REFERENCES \\"public\\".\\"user\\"(\\"id\\") ON UPDATE CASCADE ON DELETE CASCADE","ALTER TABLE ONLY \\"public\\".\\"user_contacts\\"\n    ADD CONSTRAINT \\"user_contacts_uid2_fkey\\" FOREIGN KEY (\\"uid2\\") REFERENCES \\"public\\".\\"user\\"(\\"id\\") ON UPDATE CASCADE ON DELETE CASCADE","ALTER TABLE ONLY \\"public\\".\\"user\\"\n    ADD CONSTRAINT \\"user_id_fkey\\" FOREIGN KEY (\\"id\\") REFERENCES \\"auth\\".\\"users\\"(\\"id\\") ON UPDATE CASCADE ON DELETE CASCADE","CREATE POLICY \\"Enable delete for users based on user_id\\" ON \\"public\\".\\"user_contacts\\" FOR DELETE TO \\"authenticated\\" USING (((( SELECT \\"auth\\".\\"uid\\"() AS \\"uid\\") = \\"uid1\\") OR (( SELECT \\"auth\\".\\"uid\\"() AS \\"uid\\") = \\"uid2\\")))","CREATE POLICY \\"Enable insert for users based on user_id\\" ON \\"public\\".\\"user_contacts\\" FOR INSERT TO \\"authenticated\\" WITH CHECK ((((( SELECT \\"auth\\".\\"uid\\"() AS \\"uid\\") = \\"uid1\\") AND (\\"status\\" = 'REQ_UID1'::\\"public\\".\\"user_friend_status\\")) OR ((( SELECT \\"auth\\".\\"uid\\"() AS \\"uid\\") = \\"uid2\\") AND (\\"status\\" = 'REQ_UID2'::\\"public\\".\\"user_friend_status\\"))))","CREATE POLICY \\"Enable users to view their own data only\\" ON \\"public\\".\\"user_contacts\\" FOR SELECT TO \\"authenticated\\" USING (((( SELECT \\"auth\\".\\"uid\\"() AS \\"uid\\") = \\"uid1\\") OR (( SELECT \\"auth\\".\\"uid\\"() AS \\"uid\\") = \\"uid2\\")))","CREATE POLICY \\"Update Policy\\" ON \\"public\\".\\"user_contacts\\" FOR UPDATE TO \\"authenticated\\" USING (((( SELECT \\"auth\\".\\"uid\\"() AS \\"uid\\") = \\"uid1\\") OR (( SELECT \\"auth\\".\\"uid\\"() AS \\"uid\\") = \\"uid2\\")))","CREATE POLICY \\"Users can manage own profile\\" ON \\"public\\".\\"user\\" TO \\"authenticated\\" USING ((\\"auth\\".\\"uid\\"() = \\"id\\"))","CREATE POLICY \\"Users can view profiles\\" ON \\"public\\".\\"user\\" FOR SELECT USING (true)","CREATE POLICY \\"chat_insert\\" ON \\"public\\".\\"chats\\" TO \\"authenticated\\" USING (true)","ALTER TABLE \\"public\\".\\"chat_participants\\" ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"chat_participants_insert\\" ON \\"public\\".\\"chat_participants\\" TO \\"authenticated\\" USING (true)","CREATE POLICY \\"chat_participants_select\\" ON \\"public\\".\\"chat_participants\\" TO \\"authenticated\\" USING ((\\"participant_id\\" = \\"auth\\".\\"uid\\"()))","CREATE POLICY \\"chat_select\\" ON \\"public\\".\\"chats\\" TO \\"authenticated\\" USING ((\\"id\\" IN ( SELECT \\"cp\\".\\"chat_id\\"\n   FROM \\"public\\".\\"chat_participants\\" \\"cp\\"\n  WHERE (\\"cp\\".\\"participant_id\\" = \\"auth\\".\\"uid\\"()))))","ALTER TABLE \\"public\\".\\"chats\\" ENABLE ROW LEVEL SECURITY","CREATE POLICY \\"insert_new_user\\" ON \\"public\\".\\"user\\" FOR INSERT WITH CHECK (true)","ALTER TABLE \\"public\\".\\"user\\" ENABLE ROW LEVEL SECURITY","ALTER TABLE \\"public\\".\\"user_contacts\\" ENABLE ROW LEVEL SECURITY","ALTER PUBLICATION \\"supabase_realtime\\" OWNER TO \\"postgres\\"","ALTER PUBLICATION \\"supabase_realtime\\" ADD TABLE ONLY \\"public\\".\\"user_contacts\\"","GRANT USAGE ON SCHEMA \\"public\\" TO \\"postgres\\"","GRANT USAGE ON SCHEMA \\"public\\" TO \\"anon\\"","GRANT USAGE ON SCHEMA \\"public\\" TO \\"authenticated\\"","GRANT USAGE ON SCHEMA \\"public\\" TO \\"service_role\\"","GRANT ALL ON FUNCTION \\"public\\".\\"add_contact\\"(\\"target_username\\" \\"text\\") TO \\"anon\\"","GRANT ALL ON FUNCTION \\"public\\".\\"add_contact\\"(\\"target_username\\" \\"text\\") TO \\"authenticated\\"","GRANT ALL ON FUNCTION \\"public\\".\\"add_contact\\"(\\"target_username\\" \\"text\\") TO \\"service_role\\"","GRANT ALL ON FUNCTION \\"public\\".\\"approve_contact\\"(\\"target_user_id\\" \\"uuid\\") TO \\"anon\\"","GRANT ALL ON FUNCTION \\"public\\".\\"approve_contact\\"(\\"target_user_id\\" \\"uuid\\") TO \\"authenticated\\"","GRANT ALL ON FUNCTION \\"public\\".\\"approve_contact\\"(\\"target_user_id\\" \\"uuid\\") TO \\"service_role\\"","GRANT ALL ON FUNCTION \\"public\\".\\"check_chat_participant_limit\\"() TO \\"anon\\"","GRANT ALL ON FUNCTION \\"public\\".\\"check_chat_participant_limit\\"() TO \\"authenticated\\"","GRANT ALL ON FUNCTION \\"public\\".\\"check_chat_participant_limit\\"() TO \\"service_role\\"","GRANT ALL ON FUNCTION \\"public\\".\\"create_direct_chat\\"(\\"target_user_id\\" \\"uuid\\") TO \\"anon\\"","GRANT ALL ON FUNCTION \\"public\\".\\"create_direct_chat\\"(\\"target_user_id\\" \\"uuid\\") TO \\"authenticated\\"","GRANT ALL ON FUNCTION \\"public\\".\\"create_direct_chat\\"(\\"target_user_id\\" \\"uuid\\") TO \\"service_role\\"","GRANT ALL ON FUNCTION \\"public\\".\\"delete_contact\\"(\\"target_user_id\\" \\"uuid\\") TO \\"anon\\"","GRANT ALL ON FUNCTION \\"public\\".\\"delete_contact\\"(\\"target_user_id\\" \\"uuid\\") TO \\"authenticated\\"","GRANT ALL ON FUNCTION \\"public\\".\\"delete_contact\\"(\\"target_user_id\\" \\"uuid\\") TO \\"service_role\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_client_chats\\"() TO \\"anon\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_client_chats\\"() TO \\"authenticated\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_client_chats\\"() TO \\"service_role\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_contacts\\"(\\"detail_level\\" \\"text\\", \\"page_limit\\" integer, \\"page_offset\\" integer) TO \\"anon\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_contacts\\"(\\"detail_level\\" \\"text\\", \\"page_limit\\" integer, \\"page_offset\\" integer) TO \\"authenticated\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_contacts\\"(\\"detail_level\\" \\"text\\", \\"page_limit\\" integer, \\"page_offset\\" integer) TO \\"service_role\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_direct_chat_by_user_id\\"(\\"target_user_id\\" \\"uuid\\") TO \\"anon\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_direct_chat_by_user_id\\"(\\"target_user_id\\" \\"uuid\\") TO \\"authenticated\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_direct_chat_by_user_id\\"(\\"target_user_id\\" \\"uuid\\") TO \\"service_role\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_user_id_by_username\\"(\\"target_username\\" \\"text\\") TO \\"anon\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_user_id_by_username\\"(\\"target_username\\" \\"text\\") TO \\"authenticated\\"","GRANT ALL ON FUNCTION \\"public\\".\\"get_user_id_by_username\\"(\\"target_username\\" \\"text\\") TO \\"service_role\\"","GRANT ALL ON FUNCTION \\"public\\".\\"signup_user\\"() TO \\"anon\\"","GRANT ALL ON FUNCTION \\"public\\".\\"signup_user\\"() TO \\"authenticated\\"","GRANT ALL ON FUNCTION \\"public\\".\\"signup_user\\"() TO \\"service_role\\"","GRANT ALL ON FUNCTION \\"public\\".\\"user_contacts_changes\\"() TO \\"anon\\"","GRANT ALL ON FUNCTION \\"public\\".\\"user_contacts_changes\\"() TO \\"authenticated\\"","GRANT ALL ON FUNCTION \\"public\\".\\"user_contacts_changes\\"() TO \\"service_role\\"","GRANT ALL ON TABLE \\"public\\".\\"chat_participants\\" TO \\"anon\\"","GRANT ALL ON TABLE \\"public\\".\\"chat_participants\\" TO \\"authenticated\\"","GRANT ALL ON TABLE \\"public\\".\\"chat_participants\\" TO \\"service_role\\"","GRANT ALL ON TABLE \\"public\\".\\"chats\\" TO \\"anon\\"","GRANT ALL ON TABLE \\"public\\".\\"chats\\" TO \\"authenticated\\"","GRANT ALL ON TABLE \\"public\\".\\"chats\\" TO \\"service_role\\"","GRANT ALL ON TABLE \\"public\\".\\"user\\" TO \\"anon\\"","GRANT ALL ON TABLE \\"public\\".\\"user\\" TO \\"authenticated\\"","GRANT ALL ON TABLE \\"public\\".\\"user\\" TO \\"service_role\\"","GRANT ALL ON TABLE \\"public\\".\\"user_contacts\\" TO \\"anon\\"","GRANT ALL ON TABLE \\"public\\".\\"user_contacts\\" TO \\"authenticated\\"","GRANT ALL ON TABLE \\"public\\".\\"user_contacts\\" TO \\"service_role\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON SEQUENCES TO \\"postgres\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON SEQUENCES TO \\"anon\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON SEQUENCES TO \\"authenticated\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON SEQUENCES TO \\"service_role\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON FUNCTIONS TO \\"postgres\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON FUNCTIONS TO \\"anon\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON FUNCTIONS TO \\"authenticated\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON FUNCTIONS TO \\"service_role\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON TABLES TO \\"postgres\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON TABLES TO \\"anon\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON TABLES TO \\"authenticated\\"","ALTER DEFAULT PRIVILEGES FOR ROLE \\"postgres\\" IN SCHEMA \\"public\\" GRANT ALL ON TABLES TO \\"service_role\\"","RESET ALL","CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION signup_user()","drop trigger if exists \\"objects_delete_cleanup\\" on \\"storage\\".\\"objects\\"","drop trigger if exists \\"objects_update_cleanup\\" on \\"storage\\".\\"objects\\"","drop trigger if exists \\"prefixes_delete_cleanup\\" on \\"storage\\".\\"prefixes\\"","CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger()","CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger()","CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger()","create policy \\"authenticated_users_can_receive\\"\n  on \\"realtime\\".\\"messages\\"\n  as permissive\n  for select\n  to authenticated\nusing (true)","create policy \\"authenticated_users_can_send\\"\n  on \\"realtime\\".\\"messages\\"\n  as permissive\n  for insert\n  to authenticated\nwith check (true)"}	remote_schema
20251010155333	{"revoke delete on table \\"public\\".\\"chat_participants\\" from \\"anon\\"","revoke insert on table \\"public\\".\\"chat_participants\\" from \\"anon\\"","revoke references on table \\"public\\".\\"chat_participants\\" from \\"anon\\"","revoke select on table \\"public\\".\\"chat_participants\\" from \\"anon\\"","revoke trigger on table \\"public\\".\\"chat_participants\\" from \\"anon\\"","revoke truncate on table \\"public\\".\\"chat_participants\\" from \\"anon\\"","revoke update on table \\"public\\".\\"chat_participants\\" from \\"anon\\"","revoke delete on table \\"public\\".\\"chat_participants\\" from \\"authenticated\\"","revoke insert on table \\"public\\".\\"chat_participants\\" from \\"authenticated\\"","revoke references on table \\"public\\".\\"chat_participants\\" from \\"authenticated\\"","revoke select on table \\"public\\".\\"chat_participants\\" from \\"authenticated\\"","revoke trigger on table \\"public\\".\\"chat_participants\\" from \\"authenticated\\"","revoke truncate on table \\"public\\".\\"chat_participants\\" from \\"authenticated\\"","revoke update on table \\"public\\".\\"chat_participants\\" from \\"authenticated\\"","revoke delete on table \\"public\\".\\"chat_participants\\" from \\"service_role\\"","revoke insert on table \\"public\\".\\"chat_participants\\" from \\"service_role\\"","revoke references on table \\"public\\".\\"chat_participants\\" from \\"service_role\\"","revoke select on table \\"public\\".\\"chat_participants\\" from \\"service_role\\"","revoke trigger on table \\"public\\".\\"chat_participants\\" from \\"service_role\\"","revoke truncate on table \\"public\\".\\"chat_participants\\" from \\"service_role\\"","revoke update on table \\"public\\".\\"chat_participants\\" from \\"service_role\\"","revoke delete on table \\"public\\".\\"chats\\" from \\"anon\\"","revoke insert on table \\"public\\".\\"chats\\" from \\"anon\\"","revoke references on table \\"public\\".\\"chats\\" from \\"anon\\"","revoke select on table \\"public\\".\\"chats\\" from \\"anon\\"","revoke trigger on table \\"public\\".\\"chats\\" from \\"anon\\"","revoke truncate on table \\"public\\".\\"chats\\" from \\"anon\\"","revoke update on table \\"public\\".\\"chats\\" from \\"anon\\"","revoke delete on table \\"public\\".\\"chats\\" from \\"authenticated\\"","revoke insert on table \\"public\\".\\"chats\\" from \\"authenticated\\"","revoke references on table \\"public\\".\\"chats\\" from \\"authenticated\\"","revoke select on table \\"public\\".\\"chats\\" from \\"authenticated\\"","revoke trigger on table \\"public\\".\\"chats\\" from \\"authenticated\\"","revoke truncate on table \\"public\\".\\"chats\\" from \\"authenticated\\"","revoke update on table \\"public\\".\\"chats\\" from \\"authenticated\\"","revoke delete on table \\"public\\".\\"chats\\" from \\"service_role\\"","revoke insert on table \\"public\\".\\"chats\\" from \\"service_role\\"","revoke references on table \\"public\\".\\"chats\\" from \\"service_role\\"","revoke select on table \\"public\\".\\"chats\\" from \\"service_role\\"","revoke trigger on table \\"public\\".\\"chats\\" from \\"service_role\\"","revoke truncate on table \\"public\\".\\"chats\\" from \\"service_role\\"","revoke update on table \\"public\\".\\"chats\\" from \\"service_role\\"","revoke delete on table \\"public\\".\\"user\\" from \\"anon\\"","revoke insert on table \\"public\\".\\"user\\" from \\"anon\\"","revoke references on table \\"public\\".\\"user\\" from \\"anon\\"","revoke select on table \\"public\\".\\"user\\" from \\"anon\\"","revoke trigger on table \\"public\\".\\"user\\" from \\"anon\\"","revoke truncate on table \\"public\\".\\"user\\" from \\"anon\\"","revoke update on table \\"public\\".\\"user\\" from \\"anon\\"","revoke delete on table \\"public\\".\\"user\\" from \\"authenticated\\"","revoke insert on table \\"public\\".\\"user\\" from \\"authenticated\\"","revoke references on table \\"public\\".\\"user\\" from \\"authenticated\\"","revoke select on table \\"public\\".\\"user\\" from \\"authenticated\\"","revoke trigger on table \\"public\\".\\"user\\" from \\"authenticated\\"","revoke truncate on table \\"public\\".\\"user\\" from \\"authenticated\\"","revoke update on table \\"public\\".\\"user\\" from \\"authenticated\\"","revoke delete on table \\"public\\".\\"user\\" from \\"service_role\\"","revoke insert on table \\"public\\".\\"user\\" from \\"service_role\\"","revoke references on table \\"public\\".\\"user\\" from \\"service_role\\"","revoke select on table \\"public\\".\\"user\\" from \\"service_role\\"","revoke trigger on table \\"public\\".\\"user\\" from \\"service_role\\"","revoke truncate on table \\"public\\".\\"user\\" from \\"service_role\\"","revoke update on table \\"public\\".\\"user\\" from \\"service_role\\"","revoke delete on table \\"public\\".\\"user_contacts\\" from \\"anon\\"","revoke insert on table \\"public\\".\\"user_contacts\\" from \\"anon\\"","revoke references on table \\"public\\".\\"user_contacts\\" from \\"anon\\"","revoke select on table \\"public\\".\\"user_contacts\\" from \\"anon\\"","revoke trigger on table \\"public\\".\\"user_contacts\\" from \\"anon\\"","revoke truncate on table \\"public\\".\\"user_contacts\\" from \\"anon\\"","revoke update on table \\"public\\".\\"user_contacts\\" from \\"anon\\"","revoke delete on table \\"public\\".\\"user_contacts\\" from \\"authenticated\\"","revoke insert on table \\"public\\".\\"user_contacts\\" from \\"authenticated\\"","revoke references on table \\"public\\".\\"user_contacts\\" from \\"authenticated\\"","revoke select on table \\"public\\".\\"user_contacts\\" from \\"authenticated\\"","revoke trigger on table \\"public\\".\\"user_contacts\\" from \\"authenticated\\"","revoke truncate on table \\"public\\".\\"user_contacts\\" from \\"authenticated\\"","revoke update on table \\"public\\".\\"user_contacts\\" from \\"authenticated\\"","revoke delete on table \\"public\\".\\"user_contacts\\" from \\"service_role\\"","revoke insert on table \\"public\\".\\"user_contacts\\" from \\"service_role\\"","revoke references on table \\"public\\".\\"user_contacts\\" from \\"service_role\\"","revoke select on table \\"public\\".\\"user_contacts\\" from \\"service_role\\"","revoke trigger on table \\"public\\".\\"user_contacts\\" from \\"service_role\\"","revoke truncate on table \\"public\\".\\"user_contacts\\" from \\"service_role\\"","revoke update on table \\"public\\".\\"user_contacts\\" from \\"service_role\\"","set check_function_bodies = off","CREATE OR REPLACE FUNCTION public.add_contact(target_username text)\n RETURNS jsonb\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$DECLARE\n      target_user_id UUID := public.get_user_id_by_username(target_username);\n      client_user_id UUID := auth.uid();\n      uid1_val UUID;\n      uid2_val UUID;\n      status_val public.user_friend_status;\n    BEGIN\n      -- Check if user is authenticated\n      IF client_user_id IS NULL THEN\n        RAISE EXCEPTION 'Not authenticated';\n      END IF;\n\n      -- Check if user exists\n      IF target_user_id IS NULL THEN\n        RAISE EXCEPTION 'User not found';\n      END IF;\n\n      -- Check if trying to add yourself\n      IF target_user_id = client_user_id THEN\n        RAISE EXCEPTION 'Cannot add yourself as contact';\n      END IF;\n\n      -- Check if contact already exists\n      IF EXISTS (SELECT 1 FROM public.user_contacts WHERE uid1 = LEAST(client_user_id, target_user_id) AND uid2 =\n    GREATEST(client_user_id, target_user_id)) THEN\n        RAISE EXCEPTION 'Contact already exists';\n      END IF;\n\n      -- Determine values based on constraint uid1 < uid2\n      IF client_user_id < target_user_id THEN\n        uid1_val := client_user_id;\n        uid2_val := target_user_id;\n        status_val := 'REQ_UID1'::public.user_friend_status;\n      ELSE\n        uid1_val := target_user_id;\n        uid2_val := client_user_id;\n        status_val := 'REQ_UID2'::public.user_friend_status;\n      END IF;\n\n      -- Insert new contact relationship\n      INSERT INTO public.user_contacts (uid1, uid2, status)\n      VALUES (uid1_val, uid2_val, status_val);\n      -- Return JSON object\n      RETURN jsonb_build_object(\n        'user_id', id,\n        'username', username,\n        'status', status_val,\n        'requester_pos', CASE\n          WHEN uid1_val = client_user_id THEN 'REQ_UID1'\n          WHEN uid2_val = client_user_id THEN 'REQ_UID2'\n          ELSE NULL\n        END\n      ) FROM public.\\"user\\" where id = target_user_id;\n  END;$function$","CREATE OR REPLACE FUNCTION public.approve_contact(target_user_id uuid)\n RETURNS boolean\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$\n  DECLARE\n      client_user_id UUID;\n      current_status public.user_friend_status;\n      requester_position TEXT;\n      is_less BOOLEAN;\n      result_row RECORD;\n  BEGIN\n      -- Get authenticated user ID\n      client_user_id := auth.uid();\n      IF client_user_id IS NULL THEN\n          RAISE EXCEPTION 'Not authenticated';\n      END IF;\n\n      IF target_user_id IS NULL THEN\n          RAISE EXCEPTION 'User with id % not found', target_user_id;\n      END IF;\n\n      -- Get current friendship status and determine requester position\n      SELECT\n          uc.status,\n          CASE\n              WHEN uc.uid1 = client_user_id THEN 'UID1'\n              WHEN uc.uid2 = client_user_id THEN 'UID2'\n              ELSE NULL\n          END\n      INTO current_status, requester_position\n      FROM public.user_contacts uc\n      WHERE (uc.uid1 = client_user_id AND uc.uid2 = target_user_id)\n         OR (uc.uid1 = target_user_id AND uc.uid2 = client_user_id);\n\n      -- Check if friendship exists\n      IF current_status IS NULL THEN\n          RAISE EXCEPTION 'No friendship request found';\n      END IF;\n\n      -- Check if already approved\n      IF current_status = 'APPROVED' THEN\n          RAISE EXCEPTION 'Friendship already approved';\n      END IF;\n\n      -- Determine if user_id < target_id\n      is_less := client_user_id < target_user_id;\n\n      -- Apply approval logic\n      IF (current_status = 'REQ_UID1' AND is_less) OR (current_status = 'REQ_UID2' AND NOT is_less) THEN\n          RAISE EXCEPTION 'Cannot approve friendship without the target user''s permission';\n      ELSIF (current_status = 'REQ_UID2' AND is_less) OR (current_status = 'REQ_UID1' AND NOT is_less) THEN\n          -- Update status to APPROVED and return the updated row\n          UPDATE public.user_contacts\n          SET status = 'APPROVED'\n          WHERE (uid1 = client_user_id AND uid2 = target_user_id)\n             OR (uid1 = target_user_id AND uid2 = client_user_id);\n      \n\t  RETURN TRUE;\n      ELSE\n          RAISE EXCEPTION 'Invalid friendship state';\n      END IF;\n  END;\n  $function$","CREATE OR REPLACE FUNCTION public.check_chat_participant_limit()\n RETURNS trigger\n LANGUAGE plpgsql\nAS $function$BEGIN\r\n    IF (SELECT COUNT(*) FROM public.chat_participants WHERE chat_id = NEW.chat_id) > 100 THEN\r\n      RAISE EXCEPTION 'Chat cannot have more than 100 participants';\r\n    END IF;\r\n    RETURN NEW;\r\n  END;$function$","CREATE OR REPLACE FUNCTION public.create_direct_chat(target_user_id uuid)\n RETURNS jsonb\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$DECLARE\n    chat_row public.chats%ROWTYPE;\n    client_user_id UUID := auth.uid()::uuid;\nBEGIN\n    IF target_user_id IS NULL THEN\n        RAISE EXCEPTION 'User with id % does not exist', target_user_id;\n    END IF;\n\n    RAISE LOG 'client_user_id: %, target_user_id: %', client_user_id, target_user_id;\n\n    -- Try to find existing direct chat\n    SELECT c.*\n    INTO chat_row\n    FROM public.chats c\n    JOIN public.chat_participants cp1\n        ON cp1.chat_id = c.id AND cp1.participant_id = client_user_id\n    JOIN public.chat_participants cp2\n        ON cp2.chat_id = c.id AND cp2.participant_id = target_user_id\n    WHERE c.chat_type = 'DIRECT'::public.chat_type;\n    \n    IF FOUND THEN\n        RETURN jsonb_build_object(\n            'id', chat_row.id,\n            'chat_type', chat_row.chat_type,\n            'metadata', chat_row.metadata\n        );\n    END IF;\n\n    -- Create new chat\n    INSERT INTO public.chats (chat_type, metadata)\n    VALUES ('DIRECT'::public.chat_type, '{}'::json)\n    RETURNING * INTO chat_row;\n\n    INSERT INTO public.chat_participants (chat_id, participant_id, metadata)\n    VALUES\n        (chat_row.id, client_user_id, '{}'::json),\n        (chat_row.id, target_user_id, '{}'::json);\n\n    RETURN jsonb_build_object(\n        'id', chat_row.id,\n        'chat_type', chat_row.chat_type,\n        'metadata', chat_row.metadata\n    );\nEND;$function$","CREATE OR REPLACE FUNCTION public.delete_contact(target_user_id uuid)\n RETURNS boolean\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$\n  BEGIN\n      -- If user not found, return false\n      IF target_user_id IS NULL THEN\n          RETURN FALSE;\n      END IF;\n\n      -- Delete the contact (RLS will ensure user can only delete their own contacts)\n      DELETE FROM public.user_contacts WHERE uid1 = target_user_id OR uid2 = target_user_id;\n\n      -- Return true if contact was deleted, false if not found or not allowed\n      RETURN FOUND;\n  END;\n  \n  $function$","CREATE OR REPLACE FUNCTION public.get_client_chats()\n RETURNS jsonb\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$\nBEGIN\n  RETURN (\n      SELECT jsonb_agg(\n          jsonb_build_object(\n              'id', c.id,\n              'metadata', c.metadata\n          )\n      )\n      FROM public.chats c\n      JOIN public.chat_participants cp ON c.id = cp.chat_id\n      WHERE cp.participant_id = auth.uid()\n  );\nEND;\n$function$","CREATE OR REPLACE FUNCTION public.get_contacts(detail_level text DEFAULT 'list'::text, page_limit integer DEFAULT 20, page_offset integer DEFAULT 0)\n RETURNS jsonb\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$DECLARE\r\n    user_id UUID;\r\n    total_contacts BIGINT;\r\n    requester_position text;\r\nBEGIN\r\n    -- Get current authenticated user ID\r\n    user_id := auth.uid();\r\n\r\n    -- Check if user is authenticated\r\n    IF user_id IS NULL THEN\r\n      RAISE EXCEPTION 'Not authenticated';\r\n    END IF;\r\n\r\n    -- Get total count for pagination info\r\n    SELECT COUNT(*) INTO total_contacts\r\n    FROM public.user_contacts uc\r\n    WHERE uc.uid1 = user_id OR uc.uid2 = user_id;\r\n\r\n     RETURN jsonb_build_object(\r\n      'meta', jsonb_build_object(\r\n        'total_contacts', total_contacts,\r\n        'page_limit', page_limit,\r\n        'page_offset', page_offset\r\n      ),\r\n      'data', COALESCE(\r\n        (SELECT json_agg(contact_row)\r\n        FROM (\r\n          SELECT jsonb_strip_nulls(\r\n            jsonb_build_object(\r\n              'user_id', u.id,\r\n              'username', u.username,\r\n              'status', uc.status,\r\n                'requester_pos', CASE\r\n                    WHEN uc.status != 'APPROVED' THEN\r\n                        CASE\r\n                        WHEN uc.uid1 = user_id THEN 'REQ_UID1'\r\n                        WHEN uc.uid2 = user_id THEN 'REQ_UID2'\r\n                        ELSE NULL\r\n                        END\r\n                    END,\r\n                'email', CASE WHEN detail_level = 'full' THEN u.email END,\r\n              'phone_number', CASE WHEN detail_level = 'full' THEN u.phone_number END\r\n            )\r\n          ) AS contact_row\r\n          FROM public.user_contacts uc\r\n          JOIN public.\\"user\\" u ON (\r\n            CASE\r\n              WHEN uc.uid1 = user_id THEN u.id = uc.uid2\r\n              ELSE u.id = uc.uid1\r\n            END\r\n          )\r\n          WHERE uc.uid1 = user_id OR uc.uid2 = user_id\r\n          ORDER BY u.username ASC\r\n          LIMIT page_limit\r\n          OFFSET page_offset\r\n        ) contacts\r\n        ),\r\n        '[]'::json\r\n      )\r\n    );\r\n  END;$function$","CREATE OR REPLACE FUNCTION public.get_direct_chat_by_user_id(target_user_id uuid)\n RETURNS jsonb\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$DECLARE\n    client_user_id UUID := auth.uid()::uuid;\nBEGIN\n    IF target_user_id IS NULL THEN\n        RAISE EXCEPTION 'User with id % does not exist', target_user_id;\n    END IF;\n\n    RAISE LOG 'client_user_id: %, target_user_id: %', client_user_id, target_user_id;\n\n    -- Try to find existing direct chat\n    RETURN  (\n      SELECT jsonb_build_object(\n        'id', c.id,\n        'chat_type', c.chat_type,\n        'metadata', c.metadata\n      )\n      FROM public.chats c\n      JOIN public.chat_participants cp1\n        ON cp1.chat_id = c.id AND cp1.participant_id = client_user_id\n      JOIN public.chat_participants cp2\n        ON cp2.chat_id = c.id AND cp2.participant_id = target_user_id\n      WHERE c.chat_type = 'DIRECT'::public.chat_type\n    );\nEND;$function$","CREATE OR REPLACE FUNCTION public.get_user_id_by_username(target_username text)\n RETURNS uuid\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$\r\n\r\n   DECLARE\r\n      target_user_id UUID;\r\n    BEGIN\r\n      -- Find target user by username (qualify with table alias)\r\n      SELECT u.id INTO target_user_id\r\n      FROM public.user u\r\n      WHERE u.username = target_username;\r\n\r\n      -- Return JSON object\r\n      RETURN target_user_id;\r\n  END;\r\n$function$","CREATE OR REPLACE FUNCTION public.signup_user()\n RETURNS trigger\n LANGUAGE plpgsql\n SECURITY DEFINER\nAS $function$\r\n  BEGIN\r\n    INSERT INTO public.user (id, email, username)\r\n    VALUES (\r\n      NEW.id,\r\n      NEW.email,\r\n      NEW.raw_user_meta_data->>'username'\r\n    );\r\n\r\n    RETURN NEW;\r\n  EXCEPTION\r\n    WHEN OTHERS THEN\r\n      -- Fail the entire auth signup if profile creation fails\r\n      RAISE EXCEPTION 'Profile creation failed: %', SQLERRM;\r\n  END;\r\n  $function$","CREATE OR REPLACE FUNCTION public.user_contacts_changes()\n RETURNS trigger\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$BEGIN\n  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN                   \n    PERFORM realtime.send(\t   \n      '{}'::jsonb,\n      ('contacts_update'::public.realtime_events)::TEXT,\n      CASE WHEN NEW.uid1 = auth.uid() THEN NEW.uid2 ELSE NEW.uid1 END || ':contacts',\n      TRUE\n    );    \n  ELSIF TG_OP = 'DELETE' THEN\n    PERFORM realtime.send(\t   \n      '{}'::jsonb,\n      ('contacts_update'::public.realtime_events)::TEXT,\n      CASE WHEN OLD.uid1 = auth.uid() THEN OLD.uid2 ELSE OLD.uid1 END || ':contacts',\n      TRUE\n    );  \n  END IF;\n  RETURN NULL;\nEND;$function$","drop trigger if exists \\"objects_delete_cleanup\\" on \\"storage\\".\\"objects\\"","drop trigger if exists \\"objects_update_cleanup\\" on \\"storage\\".\\"objects\\"","drop trigger if exists \\"prefixes_delete_cleanup\\" on \\"storage\\".\\"prefixes\\"","CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger()","CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger()","CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger()"}	remote_schema
20251012171859	{"create table \\"public\\".\\"chat_messages\\" (\n    \\"id\\" uuid not null default gen_random_uuid(),\n    \\"sender_id\\" uuid not null,\n    \\"chat_id\\" uuid not null,\n    \\"contents\\" text not null,\n    \\"created_at\\" timestamp with time zone not null default now(),\n    \\"metadata\\" jsonb\n)","alter table \\"public\\".\\"chat_messages\\" enable row level security","CREATE UNIQUE INDEX chat_messages_pkey ON public.chat_messages USING btree (id)","CREATE INDEX idx_chat_messages_chat_id_timestamp ON public.chat_messages USING btree (chat_id, created_at DESC)","CREATE INDEX idx_chat_messages_sender_id ON public.chat_messages USING btree (sender_id)","alter table \\"public\\".\\"chat_messages\\" add constraint \\"chat_messages_pkey\\" PRIMARY KEY using index \\"chat_messages_pkey\\"","alter table \\"public\\".\\"chat_messages\\" add constraint \\"chat_messages_chat_id_fkey\\" FOREIGN KEY (chat_id) REFERENCES chats(id) ON DELETE CASCADE not valid","alter table \\"public\\".\\"chat_messages\\" validate constraint \\"chat_messages_chat_id_fkey\\"","alter table \\"public\\".\\"chat_messages\\" add constraint \\"chat_messages_sender_id_fkey\\" FOREIGN KEY (sender_id) REFERENCES \\"user\\"(id) not valid","alter table \\"public\\".\\"chat_messages\\" validate constraint \\"chat_messages_sender_id_fkey\\"","set check_function_bodies = off","CREATE OR REPLACE FUNCTION public.chat_messages_changes()\n RETURNS trigger\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$DECLARE\n  participant_record RECORD;\nBEGIN\n  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN\n    FOR participant_record IN\n      SELECT participant_id\n      FROM public.chat_participants\n      WHERE chat_id = NEW.chat_id\n    LOOP\n      PERFORM realtime.send(\n        to_jsonb(NEW),\n        ('chats_update'::public.realtime_events)::TEXT,  \n        'chats:' || participant_record.participant_id,\n        TRUE\n      );\n    END LOOP;\n  ELSIF TG_OP = 'DELETE' THEN\n    FOR participant_record IN\n      SELECT participant_id\n      FROM public.chat_participants\n      WHERE chat_id = OLD.chat_id\n    LOOP\n      PERFORM realtime.send(\n        to_jsonb(OLD),\n        ('chats_update'::public.realtime_events)::TEXT,\n        'chats:' || participant_record.participant_id,\n        TRUE\n      );\n    END LOOP;\n  END IF;\n  RETURN NULL;\n  END;$function$","CREATE OR REPLACE FUNCTION public.create_message(p_chat_id uuid, p_contents text)\n RETURNS jsonb\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$DECLARE\n  v_result jsonb;\nBEGIN\n  IF p_contents IS NULL OR p_contents = '' THEN \n    RAISE EXCEPTION 'Can''t create an empty message';\n  END IF;\n\n  INSERT INTO public.chat_messages (\n    sender_id,\n    chat_id,\n    contents\n  ) VALUES (\n    auth.uid(),\n    p_chat_id,\n    p_contents\n  ) RETURNING jsonb_build_object(\n    'id', id,\n    'sender_id', sender_id,\n    'chat_id', chat_id,\n    'contents', contents,\n    'created_at', created_at\n  ) INTO v_result;\n\n  RETURN v_result;\nEND;$function$","CREATE OR REPLACE FUNCTION public.delete_messages(msg_ids uuid[])\n RETURNS boolean\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$DECLARE\nBEGIN\n    DELETE FROM public.chat_messages\n    WHERE id = ANY(msg_ids);\n\n    RETURN TRUE;\nEND;$function$","CREATE OR REPLACE FUNCTION public.get_messages(p_chat_id uuid, p_cursor integer DEFAULT 0, p_limit integer DEFAULT 20)\n RETURNS jsonb\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$DECLARE\n    v_messages JSONB;\n    v_total_count INT;\n    v_next_cursor INT;\n  BEGIN\n    -- Get total count for determining if there's a next page\n    SELECT COUNT(*) INTO v_total_count\n    FROM public.chat_messages cm\n    WHERE cm.chat_id = p_chat_id;\n\n    -- Calculate next cursor\n    IF p_cursor + p_limit < v_total_count THEN\n      v_next_cursor := p_cursor + p_limit;\n    ELSE\n      v_next_cursor := NULL;\n    END IF;\n\n    -- Get messages\n    SELECT jsonb_build_object(\n      'messages', COALESCE(jsonb_agg(jsonb_build_object(\n        'id', m.id,\n        'sender_id', m.sender_id,\n        'chat_id', m.chat_id,\n        'contents', m.contents,\n        'created_at', m.created_at\n      ) ORDER BY m.created_at DESC), '[]'::jsonb),\n      'nextCursor', v_next_cursor\n    ) INTO v_messages\n    FROM (\n      SELECT cm.id, cm.sender_id, cm.chat_id, cm.contents, cm.created_at\n      FROM public.chat_messages cm\n      WHERE cm.chat_id = p_chat_id\n      ORDER BY cm.created_at DESC\n      OFFSET p_cursor\n      LIMIT p_limit\n    ) m;\n\n    RETURN v_messages;\n  END;$function$","CREATE OR REPLACE FUNCTION public.user_contacts_changes()\n RETURNS trigger\n LANGUAGE plpgsql\n SET search_path TO ''\nAS $function$BEGIN\n  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN                   \n    PERFORM realtime.send(\t   \n      '{}'::jsonb,\n      ('contacts_update'::public.realtime_events)::TEXT,\n      'contacts:' || CASE WHEN NEW.uid1 = auth.uid() THEN NEW.uid2 ELSE NEW.uid1 END,\n      TRUE\n    );    \n  ELSIF TG_OP = 'DELETE' THEN\n    PERFORM realtime.send(\t   \n      '{}'::jsonb,\n      ('contacts_update'::public.realtime_events)::TEXT,\n      'contacts:' || CASE WHEN OLD.uid1 = auth.uid() THEN OLD.uid2 ELSE OLD.uid1 END,\n      TRUE\n    );  \n  END IF;\n  RETURN NULL;\nEND;$function$","grant delete on table \\"public\\".\\"chat_messages\\" to \\"anon\\"","grant insert on table \\"public\\".\\"chat_messages\\" to \\"anon\\"","grant references on table \\"public\\".\\"chat_messages\\" to \\"anon\\"","grant select on table \\"public\\".\\"chat_messages\\" to \\"anon\\"","grant trigger on table \\"public\\".\\"chat_messages\\" to \\"anon\\"","grant truncate on table \\"public\\".\\"chat_messages\\" to \\"anon\\"","grant update on table \\"public\\".\\"chat_messages\\" to \\"anon\\"","grant delete on table \\"public\\".\\"chat_messages\\" to \\"authenticated\\"","grant insert on table \\"public\\".\\"chat_messages\\" to \\"authenticated\\"","grant references on table \\"public\\".\\"chat_messages\\" to \\"authenticated\\"","grant select on table \\"public\\".\\"chat_messages\\" to \\"authenticated\\"","grant trigger on table \\"public\\".\\"chat_messages\\" to \\"authenticated\\"","grant truncate on table \\"public\\".\\"chat_messages\\" to \\"authenticated\\"","grant update on table \\"public\\".\\"chat_messages\\" to \\"authenticated\\"","grant delete on table \\"public\\".\\"chat_messages\\" to \\"service_role\\"","grant insert on table \\"public\\".\\"chat_messages\\" to \\"service_role\\"","grant references on table \\"public\\".\\"chat_messages\\" to \\"service_role\\"","grant select on table \\"public\\".\\"chat_messages\\" to \\"service_role\\"","grant trigger on table \\"public\\".\\"chat_messages\\" to \\"service_role\\"","grant truncate on table \\"public\\".\\"chat_messages\\" to \\"service_role\\"","grant update on table \\"public\\".\\"chat_messages\\" to \\"service_role\\"","create policy \\"delete_message\\"\non \\"public\\".\\"chat_messages\\"\nas permissive\nfor delete\nto authenticated\nusing ((chat_id IN ( SELECT cp.chat_id\n   FROM chat_participants cp\n  WHERE (cp.participant_id = auth.uid()))))","create policy \\"get_messages\\"\non \\"public\\".\\"chat_messages\\"\nas permissive\nfor select\nto authenticated\nusing ((chat_id IN ( SELECT cp.chat_id\n   FROM chat_participants cp\n  WHERE (cp.participant_id = auth.uid()))))","create policy \\"insert_message\\"\non \\"public\\".\\"chat_messages\\"\nas permissive\nfor insert\nto authenticated\nwith check (((chat_id IN ( SELECT cp.chat_id\n   FROM chat_participants cp\n  WHERE (cp.participant_id = auth.uid()))) AND (sender_id = auth.uid())))","CREATE TRIGGER broadcast_changes_for_chat_messages_trigger AFTER INSERT OR DELETE OR UPDATE ON public.chat_messages FOR EACH ROW EXECUTE FUNCTION chat_messages_changes()"}	chat_messages_funcitonality_migration
\.


--
-- Data for Name: seed_files; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.seed_files (path, hash) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 456, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 9, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: chat_participants chat_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_participants
    ADD CONSTRAINT chat_participants_pkey PRIMARY KEY (chat_id, participant_id);


--
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- Name: user_contacts user_contacts_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_contacts
    ADD CONSTRAINT user_contacts_id_key UNIQUE (id);


--
-- Name: user_contacts user_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_contacts
    ADD CONSTRAINT user_contacts_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_number_key UNIQUE (phone_number);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_01 messages_2026_01_01_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_01
    ADD CONSTRAINT messages_2026_01_01_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_02 messages_2026_01_02_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_02
    ADD CONSTRAINT messages_2026_01_02_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_03 messages_2026_01_03_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_03
    ADD CONSTRAINT messages_2026_01_03_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_04 messages_2026_01_04_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_04
    ADD CONSTRAINT messages_2026_01_04_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_05 messages_2026_01_05_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_05
    ADD CONSTRAINT messages_2026_01_05_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: seed_files seed_files_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.seed_files
    ADD CONSTRAINT seed_files_pkey PRIMARY KEY (path);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: idx_chat_messages_chat_id_timestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chat_messages_chat_id_timestamp ON public.chat_messages USING btree (chat_id, created_at DESC);


--
-- Name: idx_chat_messages_sender_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chat_messages_sender_id ON public.chat_messages USING btree (sender_id);


--
-- Name: idx_chat_participants_chat_count; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chat_participants_chat_count ON public.chat_participants USING btree (chat_id, participant_id);


--
-- Name: idx_chat_participants_metadata; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chat_participants_metadata ON public.chat_participants USING btree (metadata);


--
-- Name: idx_chat_participants_participant_chat; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chat_participants_participant_chat ON public.chat_participants USING btree (participant_id, chat_id);


--
-- Name: idx_chat_participants_participant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_chat_participants_participant_id ON public.chat_participants USING btree (participant_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_01_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_01_inserted_at_topic_idx ON realtime.messages_2026_01_01 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_02_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_02_inserted_at_topic_idx ON realtime.messages_2026_01_02 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_03_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_03_inserted_at_topic_idx ON realtime.messages_2026_01_03 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_04_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_04_inserted_at_topic_idx ON realtime.messages_2026_01_04 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_05_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_05_inserted_at_topic_idx ON realtime.messages_2026_01_05 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: messages_2026_01_01_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_01_inserted_at_topic_idx;


--
-- Name: messages_2026_01_01_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_01_pkey;


--
-- Name: messages_2026_01_02_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_02_inserted_at_topic_idx;


--
-- Name: messages_2026_01_02_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_02_pkey;


--
-- Name: messages_2026_01_03_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_03_inserted_at_topic_idx;


--
-- Name: messages_2026_01_03_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_03_pkey;


--
-- Name: messages_2026_01_04_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_04_inserted_at_topic_idx;


--
-- Name: messages_2026_01_04_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_04_pkey;


--
-- Name: messages_2026_01_05_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_05_inserted_at_topic_idx;


--
-- Name: messages_2026_01_05_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_05_pkey;


--
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.signup_user();


--
-- Name: chat_messages broadcast_changes_for_chat_messages_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER broadcast_changes_for_chat_messages_trigger AFTER INSERT OR DELETE OR UPDATE ON public.chat_messages FOR EACH ROW EXECUTE FUNCTION public.chat_messages_changes();


--
-- Name: user_contacts broadcast_changes_for_user_contacts_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER broadcast_changes_for_user_contacts_trigger AFTER INSERT OR DELETE OR UPDATE ON public.user_contacts FOR EACH ROW EXECUTE FUNCTION public.user_contacts_changes();


--
-- Name: chat_participants trigger_participant_limit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_participant_limit BEFORE INSERT ON public.chat_participants FOR EACH ROW EXECUTE FUNCTION public.check_chat_participant_limit();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: chat_messages chat_messages_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: chat_messages chat_messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public."user"(id);


--
-- Name: chat_participants chat_participants_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_participants
    ADD CONSTRAINT chat_participants_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id) ON DELETE CASCADE;


--
-- Name: chat_participants chat_participants_participant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_participants
    ADD CONSTRAINT chat_participants_participant_id_fkey FOREIGN KEY (participant_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: user_contacts user_contacts_uid1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_contacts
    ADD CONSTRAINT user_contacts_uid1_fkey FOREIGN KEY (uid1) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_contacts user_contacts_uid2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_contacts
    ADD CONSTRAINT user_contacts_uid2_fkey FOREIGN KEY (uid2) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: user_contacts Enable delete for users based on user_id; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable delete for users based on user_id" ON public.user_contacts FOR DELETE TO authenticated USING (((( SELECT auth.uid() AS uid) = uid1) OR (( SELECT auth.uid() AS uid) = uid2)));


--
-- Name: user_contacts Enable insert for users based on user_id; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable insert for users based on user_id" ON public.user_contacts FOR INSERT TO authenticated WITH CHECK ((((( SELECT auth.uid() AS uid) = uid1) AND (status = 'REQ_UID1'::public.user_friend_status)) OR ((( SELECT auth.uid() AS uid) = uid2) AND (status = 'REQ_UID2'::public.user_friend_status))));


--
-- Name: user_contacts Enable users to view their own data only; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable users to view their own data only" ON public.user_contacts FOR SELECT TO authenticated USING (((( SELECT auth.uid() AS uid) = uid1) OR (( SELECT auth.uid() AS uid) = uid2)));


--
-- Name: user_contacts Update Policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Update Policy" ON public.user_contacts FOR UPDATE TO authenticated USING (((( SELECT auth.uid() AS uid) = uid1) OR (( SELECT auth.uid() AS uid) = uid2)));


--
-- Name: user Users can manage own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage own profile" ON public."user" TO authenticated USING ((auth.uid() = id));


--
-- Name: user Users can view profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view profiles" ON public."user" FOR SELECT USING (true);


--
-- Name: chats chat_insert; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY chat_insert ON public.chats TO authenticated USING (true);


--
-- Name: chat_messages; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.chat_messages ENABLE ROW LEVEL SECURITY;

--
-- Name: chat_participants; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.chat_participants ENABLE ROW LEVEL SECURITY;

--
-- Name: chat_participants chat_participants_insert; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY chat_participants_insert ON public.chat_participants TO authenticated USING (true);


--
-- Name: chat_participants chat_participants_select; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY chat_participants_select ON public.chat_participants TO authenticated USING ((participant_id = auth.uid()));


--
-- Name: chats chat_select; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY chat_select ON public.chats TO authenticated USING ((id IN ( SELECT cp.chat_id
   FROM public.chat_participants cp
  WHERE (cp.participant_id = auth.uid()))));


--
-- Name: chats; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.chats ENABLE ROW LEVEL SECURITY;

--
-- Name: chat_messages delete_message; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY delete_message ON public.chat_messages FOR DELETE TO authenticated USING ((chat_id IN ( SELECT cp.chat_id
   FROM public.chat_participants cp
  WHERE (cp.participant_id = auth.uid()))));


--
-- Name: chat_messages get_messages; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY get_messages ON public.chat_messages FOR SELECT TO authenticated USING ((chat_id IN ( SELECT cp.chat_id
   FROM public.chat_participants cp
  WHERE (cp.participant_id = auth.uid()))));


--
-- Name: chat_messages insert_message; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY insert_message ON public.chat_messages FOR INSERT TO authenticated WITH CHECK (((chat_id IN ( SELECT cp.chat_id
   FROM public.chat_participants cp
  WHERE (cp.participant_id = auth.uid()))) AND (sender_id = auth.uid())));


--
-- Name: user insert_new_user; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY insert_new_user ON public."user" FOR INSERT WITH CHECK (true);


--
-- Name: user; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ENABLE ROW LEVEL SECURITY;

--
-- Name: user_contacts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_contacts ENABLE ROW LEVEL SECURITY;

--
-- Name: messages authenticated_users_can_receive; Type: POLICY; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE POLICY authenticated_users_can_receive ON realtime.messages FOR SELECT TO authenticated USING (true);


--
-- Name: messages authenticated_users_can_send; Type: POLICY; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE POLICY authenticated_users_can_send ON realtime.messages FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime_messages_publication OWNER TO supabase_admin;

--
-- Name: supabase_realtime user_contacts; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.user_contacts;


--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: supabase_admin
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA net; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO postgres;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA supabase_functions; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION _add(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._add(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _add(text, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._add(text, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _alike(boolean, anyelement, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._alike(boolean, anyelement, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _ancestor_of(name, name, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._ancestor_of(name, name, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _ancestor_of(name, name, name, name, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._ancestor_of(name, name, name, name, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _are(text, name[], name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._are(text, name[], name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _areni(text, text[], text[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._areni(text, text[], text[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _array_to_sorted_string(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._array_to_sorted_string(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _assets_are(text, text[], text[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._assets_are(text, text[], text[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _cast_exists(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._cast_exists(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _cast_exists(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._cast_exists(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _cast_exists(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._cast_exists(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _cdi(name, name, anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._cdi(name, name, anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _cdi(name, name, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._cdi(name, name, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _cdi(name, name, name, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._cdi(name, name, name, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _cexists(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._cexists(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _cexists(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._cexists(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _ckeys(name, character); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._ckeys(name, character) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _ckeys(name, name, character); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._ckeys(name, name, character) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _cleanup(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._cleanup() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _cmp_types(oid, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._cmp_types(oid, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _col_is_null(name, name, text, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._col_is_null(name, name, text, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _col_is_null(name, name, name, text, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._col_is_null(name, name, name, text, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _constraint(name, character, name[], text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._constraint(name, character, name[], text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _constraint(name, name, character, name[], text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._constraint(name, name, character, name[], text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _contract_on(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._contract_on(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _currtest(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._currtest() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _db_privs(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._db_privs() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _def_is(text, text, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._def_is(text, text, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _definer(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._definer(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _definer(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._definer(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _definer(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._definer(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _definer(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._definer(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _dexists(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._dexists(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _dexists(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._dexists(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _do_ne(text, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._do_ne(text, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _docomp(text, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._docomp(text, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _error_diag(text, text, text, text, text, text, text, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._error_diag(text, text, text, text, text, text, text, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _expand_context(character); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._expand_context(character) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _expand_on(character); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._expand_on(character) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _expand_vol(character); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._expand_vol(character) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _ext_exists(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._ext_exists(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _ext_exists(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._ext_exists(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _extensions(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._extensions() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _extensions(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._extensions(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _extras(character[], name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._extras(character[], name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _extras(character, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._extras(character, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _extras(character[], name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._extras(character[], name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _extras(character, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._extras(character, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _finish(integer, integer, integer, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._finish(integer, integer, integer, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _fkexists(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._fkexists(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _fkexists(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._fkexists(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _fprivs_are(text, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._fprivs_are(text, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _func_compare(name, name, boolean, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._func_compare(name, name, boolean, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _func_compare(name, name, name[], boolean, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._func_compare(name, name, name[], boolean, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _func_compare(name, name, anyelement, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._func_compare(name, name, anyelement, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _func_compare(name, name, name[], anyelement, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._func_compare(name, name, name[], anyelement, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _funkargs(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._funkargs(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_ac_privs(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_ac_privs(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_col_ns_type(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_col_ns_type(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_col_privs(name, text, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_col_privs(name, text, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_col_type(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_col_type(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_col_type(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_col_type(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_context(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_context(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_db_owner(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_db_owner(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_db_privs(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_db_privs(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_dtype(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_dtype(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_dtype(name, text, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_dtype(name, text, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_fdw_privs(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_fdw_privs(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_func_owner(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_func_owner(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_func_owner(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_func_owner(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_func_privs(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_func_privs(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_index_owner(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_index_owner(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_index_owner(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_index_owner(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_lang_privs(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_lang_privs(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_language_owner(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_language_owner(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_latest(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_latest(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_latest(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_latest(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_note(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_note(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_note(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_note(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_opclass_owner(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_opclass_owner(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_opclass_owner(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_opclass_owner(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_rel_owner(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_rel_owner(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_rel_owner(character[], name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_rel_owner(character[], name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_rel_owner(character, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_rel_owner(character, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_rel_owner(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_rel_owner(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_rel_owner(character[], name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_rel_owner(character[], name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_rel_owner(character, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_rel_owner(character, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_schema_owner(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_schema_owner(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_schema_privs(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_schema_privs(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_sequence_privs(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_sequence_privs(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_server_privs(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_server_privs(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_table_privs(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_table_privs(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_tablespace_owner(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_tablespace_owner(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_tablespaceprivs(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_tablespaceprivs(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_type_owner(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_type_owner(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _get_type_owner(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._get_type_owner(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _got_func(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._got_func(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _got_func(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._got_func(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _got_func(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._got_func(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _got_func(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._got_func(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _grolist(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._grolist(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _has_def(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._has_def(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _has_def(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._has_def(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _has_group(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._has_group(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _has_role(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._has_role(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _has_type(name, character[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._has_type(name, character[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _has_type(name, name, character[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._has_type(name, name, character[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _has_user(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._has_user(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _hasc(name, character); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._hasc(name, character) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _hasc(name, name, character); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._hasc(name, name, character) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _have_index(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._have_index(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _have_index(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._have_index(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _ident_array_to_sorted_string(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._ident_array_to_sorted_string(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _ident_array_to_string(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._ident_array_to_string(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _ikeys(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._ikeys(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _ikeys(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._ikeys(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _inherited(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._inherited(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _inherited(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._inherited(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _is_indexed(name, name, text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._is_indexed(name, name, text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _is_instead(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._is_instead(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _is_instead(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._is_instead(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _is_schema(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._is_schema(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _is_super(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._is_super(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _is_trusted(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._is_trusted(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _is_verbose(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._is_verbose() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _keys(name, character); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._keys(name, character) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _keys(name, name, character); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._keys(name, name, character) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _lang(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._lang(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _lang(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._lang(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _lang(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._lang(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _lang(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._lang(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _missing(character[], name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._missing(character[], name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _missing(character, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._missing(character, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _missing(character[], name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._missing(character[], name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _missing(character, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._missing(character, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _nosuch(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._nosuch(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _op_exists(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._op_exists(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _op_exists(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._op_exists(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _op_exists(name, name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._op_exists(name, name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _opc_exists(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._opc_exists(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _opc_exists(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._opc_exists(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _partof(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._partof(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _partof(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._partof(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _parts(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._parts(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _parts(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._parts(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _pg_sv_column_array(oid, smallint[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._pg_sv_column_array(oid, smallint[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _pg_sv_table_accessible(oid, oid); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._pg_sv_table_accessible(oid, oid) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _pg_sv_type_array(oid[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._pg_sv_type_array(oid[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _prokind(p_oid oid); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._prokind(p_oid oid) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _query(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._query(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _quote_ident_like(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._quote_ident_like(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _refine_vol(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._refine_vol(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _relcomp(text, anyarray, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._relcomp(text, anyarray, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _relcomp(text, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._relcomp(text, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _relcomp(text, text, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._relcomp(text, text, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _relexists(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._relexists(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _relexists(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._relexists(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _relne(text, anyarray, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._relne(text, anyarray, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _relne(text, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._relne(text, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _returns(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._returns(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _returns(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._returns(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _returns(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._returns(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _returns(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._returns(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _rexists(character[], name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._rexists(character[], name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _rexists(character, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._rexists(character, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _rexists(character[], name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._rexists(character[], name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _rexists(character, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._rexists(character, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _rule_on(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._rule_on(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _rule_on(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._rule_on(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _runem(text[], boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._runem(text[], boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _runner(text[], text[], text[], text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._runner(text[], text[], text[], text[], text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _set(integer, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._set(integer, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _set(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._set(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _set(text, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._set(text, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _strict(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._strict(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _strict(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._strict(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _strict(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._strict(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _strict(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._strict(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _table_privs(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._table_privs() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _temptable(anyarray, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._temptable(anyarray, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _temptable(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._temptable(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _temptypes(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._temptypes(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _time_trials(text, integer, numeric); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._time_trials(text, integer, numeric) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _tlike(boolean, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._tlike(boolean, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _todo(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._todo() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _trig(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._trig(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _trig(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._trig(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _type_func("char", name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._type_func("char", name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _type_func("char", name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._type_func("char", name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _type_func("char", name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._type_func("char", name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _type_func("char", name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._type_func("char", name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _types_are(name[], text, character[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._types_are(name[], text, character[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _types_are(name, name[], text, character[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._types_are(name, name[], text, character[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _unalike(boolean, anyelement, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._unalike(boolean, anyelement, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _vol(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._vol(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _vol(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._vol(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _vol(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._vol(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION _vol(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions._vol(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION add_result(boolean, boolean, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.add_result(boolean, boolean, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION alike(anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.alike(anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION alike(anyelement, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.alike(anyelement, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION any_column_privs_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.any_column_privs_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION any_column_privs_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.any_column_privs_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION any_column_privs_are(name, name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.any_column_privs_are(name, name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION any_column_privs_are(name, name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.any_column_privs_are(name, name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION bag_eq(text, anyarray); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_eq(text, anyarray) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bag_eq(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_eq(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bag_eq(text, anyarray, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_eq(text, anyarray, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bag_eq(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_eq(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bag_has(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_has(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bag_has(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_has(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bag_hasnt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_hasnt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bag_hasnt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_hasnt(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bag_ne(text, anyarray); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_ne(text, anyarray) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bag_ne(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_ne(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bag_ne(text, anyarray, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_ne(text, anyarray, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION bag_ne(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.bag_ne(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION can(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.can(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION can(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.can(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION can(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.can(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION can(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.can(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION cast_context_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.cast_context_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION cast_context_is(name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.cast_context_is(name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION casts_are(text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.casts_are(text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION casts_are(text[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.casts_are(text[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION check_test(text, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.check_test(text, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION check_test(text, boolean, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.check_test(text, boolean, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION check_test(text, boolean, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.check_test(text, boolean, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION check_test(text, boolean, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.check_test(text, boolean, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION check_test(text, boolean, text, text, text, boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.check_test(text, boolean, text, text, text, boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION cmp_ok(anyelement, text, anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.cmp_ok(anyelement, text, anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION cmp_ok(anyelement, text, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.cmp_ok(anyelement, text, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_default_is(name, name, anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_default_is(name, name, anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_default_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_default_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_default_is(name, name, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_default_is(name, name, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_default_is(name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_default_is(name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_default_is(name, name, name, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_default_is(name, name, name, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_default_is(name, name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_default_is(name, name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_has_check(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_has_check(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_has_check(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_has_check(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_has_check(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_has_check(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_has_check(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_has_check(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_has_check(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_has_check(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_has_check(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_has_check(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_has_default(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_has_default(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_has_default(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_has_default(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_has_default(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_has_default(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_hasnt_default(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_hasnt_default(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_hasnt_default(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_hasnt_default(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_hasnt_default(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_hasnt_default(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_fk(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_fk(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_fk(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_fk(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_fk(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_fk(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_fk(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_fk(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_fk(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_fk(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_fk(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_fk(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_null(table_name name, column_name name, description text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_null(table_name name, column_name name, description text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_null(schema_name name, table_name name, column_name name, description text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_null(schema_name name, table_name name, column_name name, description text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_pk(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_pk(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_pk(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_pk(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_pk(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_pk(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_pk(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_pk(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_pk(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_pk(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_pk(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_pk(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_unique(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_unique(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_unique(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_unique(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_unique(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_unique(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_unique(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_unique(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_unique(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_unique(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_unique(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_unique(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_unique(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_unique(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_is_unique(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_is_unique(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_fk(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_fk(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_fk(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_fk(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_fk(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_fk(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_fk(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_fk(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_fk(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_fk(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_fk(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_fk(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_pk(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_pk(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_pk(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_pk(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_pk(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_pk(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_pk(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_pk(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_pk(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_pk(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_isnt_pk(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_isnt_pk(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_not_null(table_name name, column_name name, description text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_not_null(table_name name, column_name name, description text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_not_null(schema_name name, table_name name, column_name name, description text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_not_null(schema_name name, table_name name, column_name name, description text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_type_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_type_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_type_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_type_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_type_is(name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_type_is(name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_type_is(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_type_is(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_type_is(name, name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_type_is(name, name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION col_type_is(name, name, name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.col_type_is(name, name, name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION collect_tap(VARIADIC text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.collect_tap(VARIADIC text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION collect_tap(character varying[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.collect_tap(character varying[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION column_privs_are(name, name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.column_privs_are(name, name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION column_privs_are(name, name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.column_privs_are(name, name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION column_privs_are(name, name, name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.column_privs_are(name, name, name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION column_privs_are(name, name, name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.column_privs_are(name, name, name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION columns_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.columns_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION columns_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.columns_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION columns_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.columns_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION columns_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.columns_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION composite_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.composite_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION composite_owner_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.composite_owner_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION composite_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.composite_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION composite_owner_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.composite_owner_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION database_privs_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.database_privs_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION database_privs_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.database_privs_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION db_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.db_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION db_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.db_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION diag(VARIADIC text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.diag(VARIADIC text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION diag(VARIADIC anyarray); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.diag(VARIADIC anyarray) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION diag(msg anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.diag(msg anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION diag(msg text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.diag(msg text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION diag_test_name(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.diag_test_name(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION display_oper(name, oid); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.display_oper(name, oid) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION do_tap(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.do_tap() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION do_tap(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.do_tap(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION do_tap(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.do_tap(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION do_tap(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.do_tap(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION doesnt_imatch(anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.doesnt_imatch(anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION doesnt_imatch(anyelement, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.doesnt_imatch(anyelement, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION doesnt_match(anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.doesnt_match(anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION doesnt_match(anyelement, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.doesnt_match(anyelement, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_is(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_is(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_is(name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_is(name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_is(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_is(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_is(name, text, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_is(name, text, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_is(name, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_is(name, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_is(name, text, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_is(name, text, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_isnt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_isnt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_isnt(name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_isnt(name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_isnt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_isnt(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_isnt(name, text, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_isnt(name, text, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_isnt(name, text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_isnt(name, text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domain_type_isnt(name, text, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domain_type_isnt(name, text, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domains_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domains_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domains_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domains_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domains_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domains_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION domains_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.domains_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION enum_has_labels(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.enum_has_labels(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION enum_has_labels(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.enum_has_labels(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION enum_has_labels(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.enum_has_labels(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION enum_has_labels(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.enum_has_labels(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION enums_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.enums_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION enums_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.enums_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION enums_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.enums_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION enums_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.enums_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION extensions_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.extensions_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION extensions_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.extensions_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION extensions_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.extensions_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION extensions_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.extensions_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fail(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fail() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fail(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fail(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fdw_privs_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fdw_privs_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fdw_privs_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fdw_privs_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION findfuncs(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.findfuncs(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION findfuncs(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.findfuncs(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION findfuncs(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.findfuncs(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION findfuncs(name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.findfuncs(name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION finish(exception_on_failure boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.finish(exception_on_failure boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fk_ok(name, name[], name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fk_ok(name, name[], name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fk_ok(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fk_ok(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fk_ok(name, name[], name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fk_ok(name, name[], name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fk_ok(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fk_ok(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fk_ok(name, name, name[], name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fk_ok(name, name, name[], name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fk_ok(name, name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fk_ok(name, name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fk_ok(name, name, name[], name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fk_ok(name, name, name[], name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION fk_ok(name, name, name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.fk_ok(name, name, name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION foreign_table_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.foreign_table_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION foreign_table_owner_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.foreign_table_owner_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION foreign_table_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.foreign_table_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION foreign_table_owner_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.foreign_table_owner_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION foreign_tables_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.foreign_tables_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION foreign_tables_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.foreign_tables_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION foreign_tables_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.foreign_tables_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION foreign_tables_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.foreign_tables_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_lang_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_lang_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_lang_is(name, name[], name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_lang_is(name, name[], name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_lang_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_lang_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_lang_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_lang_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_lang_is(name, name[], name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_lang_is(name, name[], name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_lang_is(name, name, name[], name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_lang_is(name, name, name[], name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_lang_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_lang_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_lang_is(name, name, name[], name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_lang_is(name, name, name[], name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_owner_is(name, name[], name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_owner_is(name, name[], name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_owner_is(name, name[], name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_owner_is(name, name[], name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_owner_is(name, name, name[], name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_owner_is(name, name, name[], name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_owner_is(name, name, name[], name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_owner_is(name, name, name[], name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_privs_are(name, name[], name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_privs_are(name, name[], name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_privs_are(name, name[], name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_privs_are(name, name[], name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_privs_are(name, name, name[], name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_privs_are(name, name, name[], name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_privs_are(name, name, name[], name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_privs_are(name, name, name[], name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_returns(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_returns(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_returns(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_returns(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_returns(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_returns(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_returns(name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_returns(name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_returns(name, name[], text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_returns(name, name[], text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_returns(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_returns(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_returns(name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_returns(name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION function_returns(name, name, name[], text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.function_returns(name, name, name[], text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION functions_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.functions_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION functions_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.functions_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION functions_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.functions_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION functions_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.functions_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION groups_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.groups_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION groups_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.groups_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_cast(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_cast(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_cast(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_cast(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_cast(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_cast(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_cast(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_cast(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_cast(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_cast(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_cast(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_cast(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_check(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_check(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_check(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_check(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_check(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_check(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_column(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_column(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_column(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_column(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_column(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_column(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_composite(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_composite(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_composite(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_composite(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_composite(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_composite(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_domain(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_domain(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_domain(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_domain(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_domain(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_domain(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_domain(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_domain(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_enum(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_enum(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_enum(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_enum(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_enum(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_enum(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_enum(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_enum(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_extension(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_extension(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_extension(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_extension(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_extension(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_extension(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_extension(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_extension(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_fk(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_fk(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_fk(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_fk(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_fk(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_fk(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_foreign_table(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_foreign_table(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_foreign_table(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_foreign_table(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_foreign_table(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_foreign_table(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_foreign_table(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_foreign_table(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_function(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_function(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_function(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_function(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_function(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_function(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_function(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_function(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_function(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_function(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_function(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_function(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_function(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_function(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_function(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_function(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_group(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_group(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_group(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_group(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_index(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_index(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_index(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_index(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_index(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_index(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_index(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_index(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_index(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_index(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_index(name, name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_index(name, name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_index(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_index(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_index(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_index(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_index(name, name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_index(name, name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_index(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_index(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_inherited_tables(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_inherited_tables(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_inherited_tables(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_inherited_tables(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_inherited_tables(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_inherited_tables(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_inherited_tables(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_inherited_tables(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_language(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_language(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_language(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_language(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_leftop(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_leftop(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_leftop(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_leftop(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_leftop(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_leftop(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_leftop(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_leftop(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_leftop(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_leftop(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_leftop(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_leftop(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_materialized_view(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_materialized_view(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_materialized_view(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_materialized_view(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_materialized_view(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_materialized_view(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_opclass(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_opclass(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_opclass(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_opclass(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_opclass(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_opclass(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_opclass(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_opclass(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_operator(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_operator(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_operator(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_operator(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_operator(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_operator(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_operator(name, name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_operator(name, name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_operator(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_operator(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_operator(name, name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_operator(name, name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_pk(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_pk(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_pk(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_pk(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_pk(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_pk(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_relation(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_relation(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_relation(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_relation(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_relation(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_relation(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_rightop(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_rightop(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_rightop(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_rightop(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_rightop(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_rightop(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_rightop(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_rightop(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_rightop(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_rightop(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_rightop(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_rightop(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_role(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_role(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_role(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_role(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_rule(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_rule(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_rule(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_rule(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_rule(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_rule(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_rule(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_rule(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_schema(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_schema(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_schema(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_schema(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_sequence(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_sequence(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_sequence(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_sequence(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_sequence(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_sequence(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_sequence(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_sequence(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_table(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_table(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_table(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_table(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_table(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_table(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_table(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_table(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_tablespace(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_tablespace(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_tablespace(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_tablespace(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_tablespace(name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_tablespace(name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_trigger(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_trigger(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_trigger(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_trigger(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_trigger(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_trigger(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_trigger(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_trigger(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_type(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_type(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_type(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_type(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_type(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_type(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_type(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_type(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_unique(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_unique(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_unique(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_unique(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_unique(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_unique(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_user(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_user(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_user(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_user(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_view(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_view(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_view(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_view(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_view(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_view(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION has_view(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.has_view(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_cast(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_cast(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_cast(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_cast(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_cast(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_cast(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_cast(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_cast(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_cast(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_cast(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_cast(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_cast(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_column(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_column(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_column(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_column(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_column(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_column(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_composite(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_composite(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_composite(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_composite(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_composite(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_composite(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_domain(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_domain(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_domain(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_domain(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_domain(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_domain(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_domain(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_domain(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_enum(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_enum(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_enum(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_enum(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_enum(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_enum(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_enum(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_enum(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_extension(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_extension(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_extension(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_extension(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_extension(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_extension(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_extension(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_extension(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_fk(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_fk(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_fk(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_fk(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_fk(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_fk(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_foreign_table(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_foreign_table(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_foreign_table(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_foreign_table(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_foreign_table(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_foreign_table(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_foreign_table(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_foreign_table(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_function(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_function(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_function(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_function(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_function(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_function(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_function(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_function(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_function(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_function(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_function(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_function(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_function(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_function(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_function(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_function(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_group(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_group(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_group(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_group(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_index(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_index(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_index(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_index(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_index(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_index(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_index(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_index(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_inherited_tables(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_inherited_tables(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_inherited_tables(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_inherited_tables(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_inherited_tables(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_inherited_tables(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_inherited_tables(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_inherited_tables(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_language(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_language(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_language(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_language(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_leftop(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_leftop(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_leftop(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_leftop(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_leftop(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_leftop(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_leftop(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_leftop(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_leftop(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_leftop(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_leftop(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_leftop(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_materialized_view(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_materialized_view(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_materialized_view(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_materialized_view(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_materialized_view(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_materialized_view(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_opclass(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_opclass(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_opclass(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_opclass(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_opclass(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_opclass(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_opclass(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_opclass(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_operator(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_operator(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_operator(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_operator(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_operator(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_operator(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_operator(name, name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_operator(name, name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_operator(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_operator(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_operator(name, name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_operator(name, name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_pk(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_pk(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_pk(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_pk(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_pk(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_pk(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_relation(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_relation(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_relation(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_relation(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_relation(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_relation(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_rightop(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_rightop(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_rightop(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_rightop(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_rightop(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_rightop(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_rightop(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_rightop(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_rightop(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_rightop(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_rightop(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_rightop(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_role(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_role(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_role(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_role(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_rule(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_rule(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_rule(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_rule(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_rule(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_rule(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_rule(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_rule(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_schema(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_schema(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_schema(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_schema(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_sequence(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_sequence(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_sequence(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_sequence(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_sequence(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_sequence(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_table(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_table(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_table(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_table(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_table(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_table(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_table(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_table(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_tablespace(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_tablespace(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_tablespace(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_tablespace(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_trigger(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_trigger(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_trigger(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_trigger(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_trigger(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_trigger(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_trigger(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_trigger(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_type(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_type(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_type(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_type(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_type(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_type(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_type(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_type(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_user(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_user(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_user(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_user(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_view(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_view(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_view(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_view(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_view(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_view(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hasnt_view(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hasnt_view(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION ialike(anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.ialike(anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION ialike(anyelement, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.ialike(anyelement, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION imatches(anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.imatches(anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION imatches(anyelement, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.imatches(anyelement, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION in_todo(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.in_todo() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_primary(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_primary(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_primary(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_primary(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_primary(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_primary(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_primary(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_primary(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_type(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_type(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_type(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_type(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_type(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_type(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_type(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_type(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_unique(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_unique(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_unique(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_unique(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_unique(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_unique(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_is_unique(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_is_unique(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_owner_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_owner_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_owner_is(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_owner_is(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_owner_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_owner_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION index_owner_is(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.index_owner_is(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION indexes_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.indexes_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION indexes_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.indexes_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION indexes_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.indexes_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION indexes_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.indexes_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION "is"(anyelement, anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions."is"(anyelement, anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION "is"(anyelement, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions."is"(anyelement, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_aggregate(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_aggregate(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_aggregate(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_aggregate(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_aggregate(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_aggregate(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_aggregate(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_aggregate(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_aggregate(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_aggregate(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_aggregate(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_aggregate(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_aggregate(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_aggregate(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_aggregate(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_aggregate(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_ancestor_of(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_ancestor_of(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_ancestor_of(name, name, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_ancestor_of(name, name, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_ancestor_of(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_ancestor_of(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_ancestor_of(name, name, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_ancestor_of(name, name, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_ancestor_of(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_ancestor_of(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_ancestor_of(name, name, name, name, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_ancestor_of(name, name, name, name, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_ancestor_of(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_ancestor_of(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_ancestor_of(name, name, name, name, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_ancestor_of(name, name, name, name, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_clustered(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_clustered(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_clustered(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_clustered(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_clustered(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_clustered(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_clustered(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_clustered(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_definer(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_definer(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_definer(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_definer(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_definer(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_definer(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_definer(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_definer(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_definer(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_definer(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_definer(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_definer(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_definer(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_definer(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_definer(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_definer(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_descendent_of(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_descendent_of(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_descendent_of(name, name, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_descendent_of(name, name, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_descendent_of(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_descendent_of(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_descendent_of(name, name, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_descendent_of(name, name, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_descendent_of(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_descendent_of(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_descendent_of(name, name, name, name, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_descendent_of(name, name, name, name, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_descendent_of(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_descendent_of(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_descendent_of(name, name, name, name, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_descendent_of(name, name, name, name, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_empty(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_empty(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_empty(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_empty(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_indexed(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_indexed(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_indexed(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_indexed(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_indexed(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_indexed(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_indexed(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_indexed(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_indexed(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_indexed(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_indexed(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_indexed(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_indexed(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_indexed(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_member_of(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_member_of(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_member_of(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_member_of(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_member_of(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_member_of(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_member_of(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_member_of(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_normal_function(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_normal_function(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_normal_function(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_normal_function(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_normal_function(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_normal_function(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_normal_function(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_normal_function(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_normal_function(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_normal_function(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_normal_function(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_normal_function(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_normal_function(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_normal_function(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_normal_function(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_normal_function(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_partition_of(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_partition_of(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_partition_of(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_partition_of(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_partition_of(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_partition_of(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_partition_of(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_partition_of(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_partitioned(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_partitioned(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_partitioned(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_partitioned(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_partitioned(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_partitioned(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_partitioned(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_partitioned(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_procedure(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_procedure(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_procedure(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_procedure(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_procedure(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_procedure(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_procedure(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_procedure(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_procedure(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_procedure(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_procedure(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_procedure(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_procedure(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_procedure(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_procedure(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_procedure(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_strict(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_strict(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_strict(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_strict(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_strict(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_strict(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_strict(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_strict(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_strict(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_strict(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_strict(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_strict(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_strict(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_strict(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_strict(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_strict(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_superuser(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_superuser(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_superuser(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_superuser(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_window(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_window(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_window(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_window(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_window(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_window(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_window(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_window(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_window(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_window(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_window(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_window(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_window(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_window(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION is_window(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.is_window(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isa_ok(anyelement, regtype); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isa_ok(anyelement, regtype) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isa_ok(anyelement, regtype, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isa_ok(anyelement, regtype, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt(anyelement, anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt(anyelement, anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt(anyelement, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt(anyelement, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_aggregate(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_aggregate(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_aggregate(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_aggregate(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_aggregate(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_aggregate(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_aggregate(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_aggregate(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_aggregate(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_aggregate(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_aggregate(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_aggregate(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_aggregate(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_aggregate(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_aggregate(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_aggregate(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_ancestor_of(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_ancestor_of(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_ancestor_of(name, name, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_ancestor_of(name, name, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_ancestor_of(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_ancestor_of(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_ancestor_of(name, name, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_ancestor_of(name, name, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_ancestor_of(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_ancestor_of(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_ancestor_of(name, name, name, name, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_ancestor_of(name, name, name, name, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_ancestor_of(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_ancestor_of(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_ancestor_of(name, name, name, name, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_ancestor_of(name, name, name, name, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_definer(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_definer(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_definer(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_definer(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_definer(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_definer(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_definer(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_definer(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_definer(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_definer(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_definer(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_definer(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_definer(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_definer(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_definer(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_definer(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_descendent_of(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_descendent_of(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_descendent_of(name, name, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_descendent_of(name, name, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_descendent_of(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_descendent_of(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_descendent_of(name, name, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_descendent_of(name, name, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_descendent_of(name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_descendent_of(name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_descendent_of(name, name, name, name, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_descendent_of(name, name, name, name, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_descendent_of(name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_descendent_of(name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_descendent_of(name, name, name, name, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_descendent_of(name, name, name, name, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_empty(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_empty(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_empty(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_empty(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_member_of(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_member_of(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_member_of(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_member_of(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_member_of(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_member_of(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_member_of(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_member_of(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_normal_function(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_normal_function(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_normal_function(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_normal_function(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_normal_function(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_normal_function(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_normal_function(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_normal_function(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_normal_function(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_normal_function(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_normal_function(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_normal_function(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_normal_function(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_normal_function(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_normal_function(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_normal_function(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_partitioned(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_partitioned(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_partitioned(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_partitioned(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_partitioned(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_partitioned(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_partitioned(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_partitioned(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_procedure(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_procedure(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_procedure(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_procedure(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_procedure(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_procedure(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_procedure(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_procedure(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_procedure(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_procedure(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_procedure(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_procedure(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_procedure(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_procedure(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_procedure(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_procedure(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_strict(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_strict(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_strict(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_strict(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_strict(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_strict(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_strict(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_strict(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_strict(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_strict(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_strict(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_strict(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_strict(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_strict(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_strict(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_strict(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_superuser(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_superuser(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_superuser(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_superuser(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_window(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_window(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_window(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_window(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_window(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_window(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_window(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_window(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_window(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_window(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_window(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_window(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_window(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_window(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION isnt_window(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.isnt_window(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION language_is_trusted(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.language_is_trusted(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION language_is_trusted(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.language_is_trusted(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION language_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.language_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION language_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.language_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION language_privs_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.language_privs_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION language_privs_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.language_privs_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION languages_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.languages_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION languages_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.languages_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION lives_ok(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.lives_ok(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION lives_ok(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.lives_ok(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION matches(anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.matches(anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION matches(anyelement, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.matches(anyelement, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION materialized_view_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.materialized_view_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION materialized_view_owner_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.materialized_view_owner_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION materialized_view_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.materialized_view_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION materialized_view_owner_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.materialized_view_owner_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION materialized_views_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.materialized_views_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION materialized_views_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.materialized_views_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION materialized_views_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.materialized_views_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION materialized_views_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.materialized_views_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION no_plan(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.no_plan() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION num_failed(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.num_failed() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION ok(boolean); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.ok(boolean) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION ok(boolean, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.ok(boolean, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION opclass_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.opclass_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION opclass_owner_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.opclass_owner_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION opclass_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.opclass_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION opclass_owner_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.opclass_owner_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION opclasses_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.opclasses_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION opclasses_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.opclasses_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION opclasses_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.opclasses_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION opclasses_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.opclasses_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION operators_are(text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.operators_are(text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION operators_are(text[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.operators_are(text[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION operators_are(name, text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.operators_are(name, text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION operators_are(name, text[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.operators_are(name, text[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION os_name(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.os_name() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION partitions_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.partitions_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION partitions_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.partitions_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION partitions_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.partitions_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION partitions_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.partitions_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pass(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pass() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pass(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pass(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION performs_ok(text, numeric); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.performs_ok(text, numeric) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION performs_ok(text, numeric, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.performs_ok(text, numeric, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION performs_within(text, numeric, numeric); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.performs_within(text, numeric, numeric) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION performs_within(text, numeric, numeric, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.performs_within(text, numeric, numeric, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION performs_within(text, numeric, numeric, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.performs_within(text, numeric, numeric, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION performs_within(text, numeric, numeric, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.performs_within(text, numeric, numeric, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pg_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_version_num(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_version_num() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgtap_version(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgtap_version() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION plan(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.plan(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policies_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policies_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policies_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policies_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policies_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policies_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policies_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policies_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policy_cmd_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policy_cmd_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policy_cmd_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policy_cmd_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policy_cmd_is(name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policy_cmd_is(name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policy_cmd_is(name, name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policy_cmd_is(name, name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policy_roles_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policy_roles_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policy_roles_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policy_roles_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policy_roles_are(name, name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policy_roles_are(name, name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION policy_roles_are(name, name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.policy_roles_are(name, name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION relation_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.relation_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION relation_owner_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.relation_owner_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION relation_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.relation_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION relation_owner_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.relation_owner_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(refcursor, anyarray); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(refcursor, anyarray) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(refcursor, refcursor); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(refcursor, refcursor) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(refcursor, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(refcursor, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(text, anyarray); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(text, anyarray) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(text, refcursor); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(text, refcursor) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(refcursor, anyarray, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(refcursor, anyarray, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(refcursor, refcursor, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(refcursor, refcursor, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(refcursor, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(refcursor, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(text, anyarray, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(text, anyarray, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(text, refcursor, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(text, refcursor, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_eq(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_eq(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(refcursor, anyarray); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(refcursor, anyarray) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(refcursor, refcursor); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(refcursor, refcursor) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(refcursor, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(refcursor, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(text, anyarray); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(text, anyarray) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(text, refcursor); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(text, refcursor) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(refcursor, anyarray, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(refcursor, anyarray, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(refcursor, refcursor, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(refcursor, refcursor, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(refcursor, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(refcursor, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(text, anyarray, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(text, anyarray, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(text, refcursor, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(text, refcursor, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION results_ne(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.results_ne(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION roles_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.roles_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION roles_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.roles_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION row_eq(text, anyelement); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.row_eq(text, anyelement) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION row_eq(text, anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.row_eq(text, anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rule_is_instead(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rule_is_instead(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rule_is_instead(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rule_is_instead(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rule_is_instead(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rule_is_instead(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rule_is_instead(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rule_is_instead(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rule_is_on(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rule_is_on(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rule_is_on(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rule_is_on(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rule_is_on(name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rule_is_on(name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rule_is_on(name, name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rule_is_on(name, name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rules_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rules_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rules_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rules_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rules_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rules_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION rules_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.rules_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION runtests(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.runtests() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION runtests(name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.runtests(name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION runtests(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.runtests(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION runtests(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.runtests(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schema_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.schema_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schema_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.schema_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schema_privs_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.schema_privs_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schema_privs_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.schema_privs_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schemas_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.schemas_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION schemas_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.schemas_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequence_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequence_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequence_owner_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequence_owner_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequence_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequence_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequence_owner_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequence_owner_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequence_privs_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequence_privs_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequence_privs_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequence_privs_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequence_privs_are(name, name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequence_privs_are(name, name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequence_privs_are(name, name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequence_privs_are(name, name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequences_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequences_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequences_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequences_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequences_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequences_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sequences_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sequences_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION server_privs_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.server_privs_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION server_privs_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.server_privs_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_eq(text, anyarray); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_eq(text, anyarray) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_eq(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_eq(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_eq(text, anyarray, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_eq(text, anyarray, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_eq(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_eq(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_has(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_has(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_has(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_has(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_hasnt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_hasnt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_hasnt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_hasnt(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_ne(text, anyarray); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_ne(text, anyarray) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_ne(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_ne(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_ne(text, anyarray, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_ne(text, anyarray, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_ne(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_ne(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION skip(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.skip(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION skip(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.skip(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION skip(integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.skip(integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION skip(why text, how_many integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.skip(why text, how_many integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION table_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.table_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION table_owner_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.table_owner_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION table_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.table_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION table_owner_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.table_owner_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION table_privs_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.table_privs_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION table_privs_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.table_privs_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION table_privs_are(name, name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.table_privs_are(name, name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION table_privs_are(name, name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.table_privs_are(name, name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION tables_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.tables_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION tables_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.tables_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION tables_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.tables_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION tables_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.tables_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION tablespace_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.tablespace_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION tablespace_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.tablespace_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION tablespace_privs_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.tablespace_privs_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION tablespace_privs_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.tablespace_privs_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION tablespaces_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.tablespaces_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION tablespaces_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.tablespaces_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_ilike(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_ilike(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_ilike(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_ilike(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_imatching(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_imatching(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_imatching(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_imatching(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_like(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_like(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_like(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_like(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_matching(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_matching(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_matching(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_matching(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_ok(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_ok(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_ok(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_ok(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_ok(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_ok(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_ok(text, integer, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_ok(text, integer, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_ok(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_ok(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_ok(text, character, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_ok(text, character, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION throws_ok(text, integer, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.throws_ok(text, integer, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION todo(how_many integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.todo(how_many integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION todo(why text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.todo(why text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION todo(how_many integer, why text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.todo(how_many integer, why text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION todo(why text, how_many integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.todo(why text, how_many integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION todo_end(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.todo_end() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION todo_start(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.todo_start() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION todo_start(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.todo_start(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION trigger_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.trigger_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION trigger_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.trigger_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION trigger_is(name, name, name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.trigger_is(name, name, name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION trigger_is(name, name, name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.trigger_is(name, name, name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION triggers_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.triggers_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION triggers_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.triggers_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION triggers_are(name, name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.triggers_are(name, name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION triggers_are(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.triggers_are(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION type_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.type_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION type_owner_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.type_owner_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION type_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.type_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION type_owner_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.type_owner_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION types_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.types_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION types_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.types_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION types_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.types_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION types_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.types_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION unalike(anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.unalike(anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION unalike(anyelement, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.unalike(anyelement, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION unialike(anyelement, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.unialike(anyelement, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION unialike(anyelement, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.unialike(anyelement, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION users_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.users_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION users_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.users_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION view_owner_is(name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.view_owner_is(name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION view_owner_is(name, name, name); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.view_owner_is(name, name, name) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION view_owner_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.view_owner_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION view_owner_is(name, name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.view_owner_is(name, name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION views_are(name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.views_are(name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION views_are(name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.views_are(name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION views_are(name, name[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.views_are(name, name[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION views_are(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.views_are(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION volatility_is(name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.volatility_is(name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION volatility_is(name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.volatility_is(name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION volatility_is(name, name, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.volatility_is(name, name, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION volatility_is(name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.volatility_is(name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION volatility_is(name, name[], text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.volatility_is(name, name[], text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION volatility_is(name, name, name[], text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.volatility_is(name, name, name[], text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION volatility_is(name, name, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.volatility_is(name, name, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION volatility_is(name, name, name[], text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.volatility_is(name, name, name[], text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- Name: FUNCTION add_contact(target_username text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.add_contact(target_username text) TO anon;
GRANT ALL ON FUNCTION public.add_contact(target_username text) TO authenticated;
GRANT ALL ON FUNCTION public.add_contact(target_username text) TO service_role;


--
-- Name: FUNCTION approve_contact(target_user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.approve_contact(target_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.approve_contact(target_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.approve_contact(target_user_id uuid) TO service_role;


--
-- Name: FUNCTION chat_messages_changes(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.chat_messages_changes() TO anon;
GRANT ALL ON FUNCTION public.chat_messages_changes() TO authenticated;
GRANT ALL ON FUNCTION public.chat_messages_changes() TO service_role;


--
-- Name: FUNCTION check_chat_participant_limit(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.check_chat_participant_limit() TO anon;
GRANT ALL ON FUNCTION public.check_chat_participant_limit() TO authenticated;
GRANT ALL ON FUNCTION public.check_chat_participant_limit() TO service_role;


--
-- Name: FUNCTION create_direct_chat(target_user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.create_direct_chat(target_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.create_direct_chat(target_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.create_direct_chat(target_user_id uuid) TO service_role;


--
-- Name: FUNCTION create_message(p_chat_id uuid, p_contents text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.create_message(p_chat_id uuid, p_contents text) TO anon;
GRANT ALL ON FUNCTION public.create_message(p_chat_id uuid, p_contents text) TO authenticated;
GRANT ALL ON FUNCTION public.create_message(p_chat_id uuid, p_contents text) TO service_role;


--
-- Name: FUNCTION delete_contact(target_user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_contact(target_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.delete_contact(target_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.delete_contact(target_user_id uuid) TO service_role;


--
-- Name: FUNCTION delete_messages(msg_ids uuid[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.delete_messages(msg_ids uuid[]) TO anon;
GRANT ALL ON FUNCTION public.delete_messages(msg_ids uuid[]) TO authenticated;
GRANT ALL ON FUNCTION public.delete_messages(msg_ids uuid[]) TO service_role;


--
-- Name: FUNCTION get_client_chats(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_client_chats() TO anon;
GRANT ALL ON FUNCTION public.get_client_chats() TO authenticated;
GRANT ALL ON FUNCTION public.get_client_chats() TO service_role;


--
-- Name: FUNCTION get_contacts(detail_level text, page_limit integer, page_offset integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_contacts(detail_level text, page_limit integer, page_offset integer) TO anon;
GRANT ALL ON FUNCTION public.get_contacts(detail_level text, page_limit integer, page_offset integer) TO authenticated;
GRANT ALL ON FUNCTION public.get_contacts(detail_level text, page_limit integer, page_offset integer) TO service_role;


--
-- Name: FUNCTION get_direct_chat_by_user_id(target_user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_direct_chat_by_user_id(target_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.get_direct_chat_by_user_id(target_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_direct_chat_by_user_id(target_user_id uuid) TO service_role;


--
-- Name: FUNCTION get_messages(p_chat_id uuid, p_cursor integer, p_limit integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_messages(p_chat_id uuid, p_cursor integer, p_limit integer) TO anon;
GRANT ALL ON FUNCTION public.get_messages(p_chat_id uuid, p_cursor integer, p_limit integer) TO authenticated;
GRANT ALL ON FUNCTION public.get_messages(p_chat_id uuid, p_cursor integer, p_limit integer) TO service_role;


--
-- Name: FUNCTION get_user_id_by_username(target_username text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_user_id_by_username(target_username text) TO anon;
GRANT ALL ON FUNCTION public.get_user_id_by_username(target_username text) TO authenticated;
GRANT ALL ON FUNCTION public.get_user_id_by_username(target_username text) TO service_role;


--
-- Name: FUNCTION signup_user(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.signup_user() TO anon;
GRANT ALL ON FUNCTION public.signup_user() TO authenticated;
GRANT ALL ON FUNCTION public.signup_user() TO service_role;


--
-- Name: FUNCTION user_contacts_changes(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.user_contacts_changes() TO anon;
GRANT ALL ON FUNCTION public.user_contacts_changes() TO authenticated;
GRANT ALL ON FUNCTION public.user_contacts_changes() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION http_request(); Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE chat_messages; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.chat_messages TO anon;
GRANT ALL ON TABLE public.chat_messages TO authenticated;
GRANT ALL ON TABLE public.chat_messages TO service_role;


--
-- Name: TABLE chat_participants; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.chat_participants TO anon;
GRANT ALL ON TABLE public.chat_participants TO authenticated;
GRANT ALL ON TABLE public.chat_participants TO service_role;


--
-- Name: TABLE chats; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.chats TO anon;
GRANT ALL ON TABLE public.chats TO authenticated;
GRANT ALL ON TABLE public.chats TO service_role;


--
-- Name: TABLE "user"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."user" TO anon;
GRANT ALL ON TABLE public."user" TO authenticated;
GRANT ALL ON TABLE public."user" TO service_role;


--
-- Name: TABLE user_contacts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_contacts TO anon;
GRANT ALL ON TABLE public.user_contacts TO authenticated;
GRANT ALL ON TABLE public.user_contacts TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE messages_2026_01_01; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_01 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_01 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_02; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_02 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_02 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_03; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_03 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_03 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_04; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_04 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_04 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_05; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_05 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_05 TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE hooks; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.hooks TO postgres;
GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;


--
-- Name: SEQUENCE hooks_id_seq; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO postgres;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;


--
-- Name: TABLE migrations; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.migrations TO postgres;
GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict 8uVw2fka55zKRJXSCH2ScUz48Re2GBCzpMavILcOmp5pz9zshaeHCB3EPUzgtrz

