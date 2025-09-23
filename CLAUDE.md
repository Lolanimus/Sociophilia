# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Sociophilia is a React Native mobile application messenger built with Expo and Supabase.

## Architecture

### Technology Stack
- Frontend: React Native 0.79.6 with React 19.0.0
- Framework: Expo SDK 53
- Navigation: Expo Router 5.1.5 with file-based routing
- Backend: Supabase (authentication and database)
- Security: Custom encrypted storage using AES encryption
- UI: React Navigation with tab-based navigation

### Directory Structure
- app/ - Expo Router file-based routing with layout components
  - (tabs)/ - Tab-based navigation screens (login, signup)
  - _layout.tsx - Root layout with theme provider
- components/ - Reusable UI components with themed components
- lib/ - Core utilities and external service configurations
  - supabase.ts - Supabase client with encrypted storage
- hooks/ - React hooks for theming and color schemes
- constants/ - App constants including color definitions
- assets/ - Static assets (images, icons)

### Key Architecture Decisions

File-based Routing: Uses Expo Router with typed routes enabled for navigation. Screens are organized under app/(tabs)/ for tab navigation.

Secure Storage: Implements a custom LargeSecureStore class that combines Expo SecureStore (for encryption keys) with AsyncStorage (for encrypted data) to handle storage limitations.

Theme System: Built-in dark/light theme support using React Navigation themes with custom color scheme detection.

Authentication: Supabase integration with persistent sessions and automatic token refresh.

## Development Commands

### Core Commands
# Start development server
npm start
# or
expo start

# Platform-specific development
npm run android    # Android development
npm run ios        # iOS development  
npm run web        # Web development

# Code quality
npm run lint       # Run ESLint

### Build Commands
The project uses Expo for building. Refer to Expo documentation for build commands specific to your deployment target.

## Environment Setup

### Required Environment Variables
Create a .env file with:
EXPO_PUBLIC_SUPABASE_URL=your_supabase_url
EXPO_PUBLIC_SUPABASE_KEY=your_supabase_anon_key

### TypeScript Configuration
- Extends Expo's base TypeScript configuration
- Strict mode enabled
- Path mapping configured for @/* imports pointing to root directory

## Security Implementation

Encrypted Storage: The app uses a sophisticated storage system where:
- AES-256 encryption keys are stored in Expo SecureStore (limited to 2KB)
- Large encrypted data is stored in AsyncStorage
- Automatic encryption/decryption for Supabase session management

Authentication Flow: Supabase handles authentication with:
- Automatic token refresh
- Persistent sessions with encrypted storage
- Process lock for concurrent access protection

## Development Notes

### Code Style
- Uses ESLint with Expo configuration
- TypeScript strict mode enabled
- React 19 concurrent features available

### Component Architecture
- Themed components in components/ directory
- Platform-specific implementations (.ios.tsx files)
- Haptic feedback integration for enhanced UX

### Navigation
- Tab-based navigation as primary navigation pattern
- Safe area handling with react-native-safe-area-context
- Platform-specific styling for iOS blur effects

## Key Dependencies
- @supabase/supabase-js - Backend integration
- expo-secure-store - Secure key storage
- @react-native-async-storage/async-storage - Large data storage
- aes-js - Client-side encryption
- expo-router - File-based navigation
- react-native-reanimated - Animations and gestures

## Database notes

- always put set_search=''.
- always use schemas before every table.

## Checking the code I send to you

- please don't add anything addtitionally to the code. just fix and correct stuff, add comments, but do not add a new field or anything like that.

## Types

### Postgres DB Types

- public.chats.metadata = {
  type: Enums<'chat_type'>
}

- public.chat_participants (
  chat_id uuid NOT NULL,
  participant_id uuid NOT NULL,
  metadata jsonb NOT NULL,
  CONSTRAINT chat_participants_pkey PRIMARY KEY (chat_id, participant_id),
  CONSTRAINT chat_participants_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chats(id),
  CONSTRAINT chat_participants_participant_id_fkey FOREIGN KEY (participant_id) REFERENCES public.user(id)
);

- public.chats (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  metadata jsonb NOT NULL,
  CONSTRAINT chats_pkey PRIMARY KEY (id)
);

- public.user (
  id uuid NOT NULL,
  username character varying NOT NULL UNIQUE,
  email character varying UNIQUE,
  phone_number character varying UNIQUE,
  inserted_at timestamp with time zone NOT NULL DEFAULT timezone('utc'::text, now()),
  updated_at timestamp with time zone NOT NULL DEFAULT timezone('utc'::text, now()),
  CONSTRAINT user_pkey PRIMARY KEY (id),
  CONSTRAINT user_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id)
);

- public.user_contacts (
  uid1 uuid NOT NULL,
  uid2 uuid NOT NULL,
  status USER-DEFINED NOT NULL,
  id uuid NOT NULL DEFAULT gen_random_uuid() UNIQUE,
  CONSTRAINT user_contacts_pkey PRIMARY KEY (id),
  CONSTRAINT user_contacts_uid1_fkey FOREIGN KEY (uid1) REFERENCES public.user(id),
  CONSTRAINT user_contacts_uid2_fkey FOREIGN KEY (uid2) REFERENCES public.user(id)
);

### API Types

- interface ContactsMeta {
  total_contacts: number;
  page_limit: number;
  page_offset: number;
}

- interface ContactsData {
  username: string;
  status: Enums<'user_friend_status'>;
  requester_pos?: Exclude<Enums<'user_friend_status'>, 'APPROVED'>;
  email?: string;
  phone_number?: string;
}

- interface ContactsResponse {
  meta: ContactsMeta;
  data: ContactsData[];
}

## Chat System Notes

- There is no direct chat type, instead chats are always though of as a group chat, that is a group chat can be a chat with
yourself, a chat with another person, or a group chat itself.