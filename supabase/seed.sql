SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '04710c85-cdfa-4b6b-a50b-6bce632d1836', 'authenticated', 'authenticated', 'dragonscripter03@gmail.com', '$2a$10$HPy33FNKJjxJBQMg97ZqGeILoVKHqb/r/yQYJwp75wymKhynKM2KS', '2025-09-14 03:24:09.954024+00', NULL, '', '2025-09-14 03:23:21.083566+00', '', NULL, '', '', NULL, '2025-09-21 04:20:36.079607+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "04710c85-cdfa-4b6b-a50b-6bce632d1836", "email": "dragonscripter03@gmail.com", "username": "Drago", "email_verified": true, "phone_verified": false}', NULL, '2025-09-14 02:52:10.647725+00', '2025-09-21 04:20:36.081934+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '0747f033-3d78-4c01-b853-4281f0df0b92', 'authenticated', 'authenticated', 'antox.qscwdv@gmail.com', '$2a$10$oREW87SJcTF0jAmLu8dS0eCyTndxGNDqyZqrsfs7Nkt6Z8GBj6Zh2', '2025-09-13 16:51:28.039893+00', NULL, '', '2025-09-13 16:51:16.475642+00', '', NULL, '', '', NULL, '2025-09-24 17:00:31.723199+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "0747f033-3d78-4c01-b853-4281f0df0b92", "email": "antox.qscwdv@gmail.com", "username": "suka", "email_verified": true, "phone_verified": false}', NULL, '2025-09-13 16:51:16.444381+00', '2025-09-24 17:00:31.738302+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'fd5bb50a-01b5-4397-a060-3775a53f4336', 'authenticated', 'authenticated', 'jost12.qsc12@gmail.com', '$2a$10$ZJGgbNt2p4r4syvuhRTLuuEZMMmYUQcU0dLCG5WyOGXz56R9OGmku', '2025-09-13 16:52:01.701866+00', NULL, '', '2025-09-13 16:51:45.751584+00', '', NULL, '', '', NULL, '2025-09-24 17:00:45.010056+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "fd5bb50a-01b5-4397-a060-3775a53f4336", "email": "jost12.qsc12@gmail.com", "username": "blya", "email_verified": true, "phone_verified": false}', NULL, '2025-09-13 16:51:45.742254+00', '2025-09-24 17:00:45.015606+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('0747f033-3d78-4c01-b853-4281f0df0b92', '0747f033-3d78-4c01-b853-4281f0df0b92', '{"sub": "0747f033-3d78-4c01-b853-4281f0df0b92", "email": "antox.qscwdv@gmail.com", "username": "suka", "email_verified": true, "phone_verified": false}', 'email', '2025-09-13 16:51:16.45779+00', '2025-09-13 16:51:16.457843+00', '2025-09-13 16:51:16.457843+00', '5532ca8b-4115-4b24-b3f6-54272806cc31'),
	('fd5bb50a-01b5-4397-a060-3775a53f4336', 'fd5bb50a-01b5-4397-a060-3775a53f4336', '{"sub": "fd5bb50a-01b5-4397-a060-3775a53f4336", "email": "jost12.qsc12@gmail.com", "username": "blya", "email_verified": true, "phone_verified": false}', 'email', '2025-09-13 16:51:45.747533+00', '2025-09-13 16:51:45.747589+00', '2025-09-13 16:51:45.747589+00', 'af7c74d5-59cf-4629-9466-4a31c2fd0593'),
	('04710c85-cdfa-4b6b-a50b-6bce632d1836', '04710c85-cdfa-4b6b-a50b-6bce632d1836', '{"sub": "04710c85-cdfa-4b6b-a50b-6bce632d1836", "email": "dragonscripter03@gmail.com", "username": "Drago", "email_verified": true, "phone_verified": false}', 'email', '2025-09-14 02:52:10.745328+00', '2025-09-14 02:52:10.745386+00', '2025-09-14 02:52:10.745386+00', '6f43cdd7-cd04-4ac1-8568-6c6666475797');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('7d98f8c3-6f8e-426e-8165-eff15cbefb7c', 'fd5bb50a-01b5-4397-a060-3775a53f4336', '2025-09-24 17:00:45.010136+00', '2025-09-24 17:00:45.010136+00', NULL, 'aal1', NULL, NULL, 'okhttp/4.12.0', '38.49.168.246', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('7d98f8c3-6f8e-426e-8165-eff15cbefb7c', '2025-09-24 17:00:45.015982+00', '2025-09-24 17:00:45.015982+00', 'password', '3549e807-14c5-4065-a96f-e4756c11eff5');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 361, '4lwwybtb523j', 'fd5bb50a-01b5-4397-a060-3775a53f4336', false, '2025-09-24 17:00:45.012763+00', '2025-09-24 17:00:45.012763+00', NULL, '7d98f8c3-6f8e-426e-8165-eff15cbefb7c');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."chats" ("id", "chat_type", "metadata") VALUES
	('d20389ce-d726-41b0-b618-e5912addb036', 'DIRECT', '{}'),
	('1d16d237-8e80-4fd1-94f6-b94754b72c49', 'DIRECT', '{}');


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user" ("id", "username", "email", "phone_number", "inserted_at", "updated_at") VALUES
	('0747f033-3d78-4c01-b853-4281f0df0b92', 'suka', 'antox.qscwdv@gmail.com', NULL, '2025-09-13 16:51:16.44404+00', '2025-09-13 16:51:16.44404+00'),
	('fd5bb50a-01b5-4397-a060-3775a53f4336', 'blya', 'jost12.qsc12@gmail.com', NULL, '2025-09-13 16:51:45.741069+00', '2025-09-13 16:51:45.741069+00'),
	('04710c85-cdfa-4b6b-a50b-6bce632d1836', 'Drago', 'dragonscripter03@gmail.com', NULL, '2025-09-14 02:52:10.646752+00', '2025-09-14 02:52:10.646752+00');


--
-- Data for Name: chat_participants; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."chat_participants" ("chat_id", "participant_id", "metadata") VALUES
	('d20389ce-d726-41b0-b618-e5912addb036', '0747f033-3d78-4c01-b853-4281f0df0b92', '{}'),
	('d20389ce-d726-41b0-b618-e5912addb036', 'fd5bb50a-01b5-4397-a060-3775a53f4336', '{}'),
	('1d16d237-8e80-4fd1-94f6-b94754b72c49', '0747f033-3d78-4c01-b853-4281f0df0b92', '{}'),
	('1d16d237-8e80-4fd1-94f6-b94754b72c49', '04710c85-cdfa-4b6b-a50b-6bce632d1836', '{}');


--
-- Data for Name: user_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user_contacts" ("uid1", "uid2", "status", "id") VALUES
	('04710c85-cdfa-4b6b-a50b-6bce632d1836', '0747f033-3d78-4c01-b853-4281f0df0b92', 'APPROVED', '6e8cea93-4c12-441f-bdae-d85c45bc284c'),
	('0747f033-3d78-4c01-b853-4281f0df0b92', 'fd5bb50a-01b5-4397-a060-3775a53f4336', 'APPROVED', '581d2db9-884d-478c-8bf1-8dedcc182af5');


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 361, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
