import log from '@/utils/logger';
import { supabase } from '@/utils/supabase';
import { AuthError } from '@supabase/supabase-js';
import { createContext, PropsWithChildren, useCallback, useRef, useState } from 'react';

export type ContactShort = {
  username: string,
  status: string,
}

type ContactsContextValue = {
  contacts: ContactShort[] | null;
  loading: boolean;
  error: string | null;
  fetchContacts: () => Promise<number>;
  addContact: (username: string) => Promise<number>;
  // updateContact: (id: number, username: string) => Promise<number>;
  approveContact: (username: string) => Promise<number>;
  deleteContact: (username: string) => Promise<number>;
  clearError: () => void;
}

export const ContactsContext = createContext<ContactsContextValue>({
  contacts: [],
  loading: false,
  error: null,
  fetchContacts: async () => { return 0; },
  addContact: async () => { return 0; },
  // updateContact: async () => { return 0; },
  approveContact: async () => { return 0; },
  deleteContact: async () => { return 0; },
  clearError: () => {}
});

export function ContactsProvider({children}: PropsWithChildren) {
  const [contacts, setContacts] = useState<ContactShort[] | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const hasFetchedRef = useRef(false);

  const clearError = () => setError(null);

  const fetchContacts = useCallback(async () => {
    setLoading(true);

    try {
      // TODO: for some reason this returns the full list of a contact instead of the short one
      const { data, error } = await supabase.rpc('get_user_contacts') as { data: ContactShort[]; error: AuthError | null };
      log.info("fetchContacts() was called");

      if(error) {
        log.error("Fetch Contacts Error", error)
        setError(error.message);
      }

      log.debug("fetchContacts() Data", data);

      setContacts(data);
      hasFetchedRef.current = true;

      return 1;
    } catch (err) {
      log.error('Error fetching contacts:', err);
      setError(err as string);
      return -1;
    } finally {
      setLoading(false);
    }
  }, []);

  // Contacts are fetched manually when needed

  const addContact = useCallback(async (username: string) => {
    setLoading(true);

    try {
      const { data, error } = await supabase.rpc('add_user_contact', {
        target_username: username
      });
      log.info("addContact() was called");

      if (error) {
        log.error('Error adding contact:', error);
        setError(error.message);
        return -1;
      }

      log.debug("addContact() Data", data);

      setContacts(prev => {
        return prev ? [...prev, data] : data;
      });
      return 1;
    } catch (err) {
      log.error('Error adding contact:', err);
      setError(err as string);
      return -1;
    } finally {
      setLoading(false);
    }
  }, []);

  // const updateContact = async (id: number, username: string) => {
  //   setLoading(true);
  //   setError(null);

  //   try {
  //     const { data, error } = await supabase
  //       .from('user_contacts')
  //       .update({ username })
  //       .eq('id', id)
  //       .select()
  //       .single();

  //     if (error) {
  //       console.log('Error updating contact:', error);
  //       setError('Failed to update contact');
  //       return -1;
  //     }

  //     setContacts(prev => prev.map(contact => 
  //       contact.id === id ? data : contact
  //     ));
  //     return 1;
  //   } catch (err) {
  //     console.log('Error updating contact:', err);
  //     setError('Failed to update contact');
  //     return -1;
  //   } finally {
  //     setLoading(false);
  //   }
  // };

  const approveContact = async (username: string) => {
    return 0;    
  };

  const deleteContact = async (username: string) => {
    setLoading(true);

    try {
      const { error } = await supabase
        .rpc("delete_contact", {
          contact_username: username
        });

      log.info("deleteContact() was called");

      if (error) {
        log.error('Error deleting contact:', error);
        setError(error.message);
        return -1;
      }

      setContacts(prev => prev!.filter(contact => contact.username !== username));
      return 1;
    } catch (err) {
      log.error('Error deleting contact:', err);
      setError(err as string);
      return -1;
    } finally {
      setLoading(false);
    }
  };

  return (
    <ContactsContext value={{
      contacts,
      loading,
      error,
      fetchContacts,
      addContact,
      // updateContact,
      approveContact,
      deleteContact,
      clearError
    }}>
      {children}
    </ContactsContext>
  );
}