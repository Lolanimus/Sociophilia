import { ContactsData, ContactsMeta, ContactsResponse } from '@/types/api.types';
import log from '@/utils/logger';
import { supabase } from '@/utils/supabase';
import { createContext, PropsWithChildren, useCallback, useRef, useState } from 'react';

type ContactsContextValue = {
  meta: ContactsMeta | null;
  data: ContactsData[] | null;
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
  meta: null,
  data: null,
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
  const [meta, setMeta] = useState<ContactsMeta | null>(null);
  const [data, setData] = useState<ContactsData[] | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const hasFetchedRef = useRef(false);

  const clearError = () => setError(null);

  const fetchContacts = useCallback(async () => {
    setLoading(true);

    try {
      const { data, error } = await supabase.rpc('get_user_contacts').single().overrideTypes<ContactsResponse>();
      log.info("fetchContacts() was called");

      if(error) {
        log.error("Fetch Contacts Error", error)
        setError(error.message);
      }

      log.debug("fetchContacts() Data", data);

      setData(data!.data);
      setMeta(data!.meta);

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

  const addContact = useCallback(async (username: string) => {
    setLoading(true);

    try {
      const { data, error } = await supabase.rpc('add_user_contact', {
        target_username: username
      }).single().overrideTypes<ContactsData>();

      log.info("addContact() was called");

      if (error) {
        log.error('Error adding contact:', error);
        setError(error.message);
        return -1;
      }

      log.debug("addContact() Data", data);

      setData(prev => prev ? [...prev, data!] : [data!]);
      setMeta(prev => ({
        total_contacts: (prev?.total_contacts || 0) + 1,
        page_limit: prev?.page_limit || 20,
        page_offset: prev?.page_offset || 0
      }));

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
    setLoading(true);

    try {
      const cur_user_id = (await supabase.auth.getUser()).data.user?.id;
      const target_id = (await supabase.from('user').select('id').eq('username', username)).data![0].id;

      log.debug("cur_user_id", cur_user_id);
      log.debug("target_id", target_id);
      log.debug("cur_user_id < target_id ? ", cur_user_id! < target_id);

      const { error } = await supabase
        .rpc("approve_friendship", {
          target_username: username
        });

      log.info("approve_friendship() was called");

      if (error) {
        log.error('Error approving a contact:', error);
        setError(error.message);
        return -1;
      }

      setData(prev => {
        return prev!.map(contact => {
          if (contact.username === username) {
            return { ...contact, status: 'APPROVED' };
          }
          return contact;
        });
      });

      return 1;
    } catch (err) {
      log.error('Error approving a contact:', err);
      setError(err as string);
      return -1;
    } finally {
      setLoading(false);
    }
  };

  const deleteContact = async (username: string) => {
    setLoading(true);

    try {
      const { error } = await supabase
        .rpc("delete_contact", {
          target_username: username
        });

      log.info("deleteContact() was called");

      if (error) {
        log.error('Error deleting contact:', error);
        setError(error.message);
        return -1;
      }

      setData(prev => prev!.filter(contact => contact.username !== username));
      setMeta(prev => prev ? {
        ...prev,
        total_contacts: prev.total_contacts - 1
      } : null);

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
      data,
      meta,
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