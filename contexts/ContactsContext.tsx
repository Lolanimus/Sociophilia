import { supabase } from '@/utils/supabase';
import { createContext, PropsWithChildren, useState } from 'react';

const UserFriendStatus = {
    REQ_UID1: 'REQ_UID1',
    REQ_UID2: 'REQ_UID2',
    FRIEND: 'FRIEND'
}

export type Contact = {
  id: number;
  username: string;
  email?: string;
  created_at: string;
  user_id: string;
}

type ContactsContextValue = {
  contacts: Contact[];
  loading: boolean;
  error: string | null;
  fetchContacts: () => Promise<number>;
  addContact: (username: string) => Promise<number>;
  updateContact: (id: number, username: string) => Promise<number>;
  deleteContact: (id: number) => Promise<number>;
  clearError: () => void;
}

export const ContactsContext = createContext<ContactsContextValue>({
  contacts: [],
  loading: false,
  error: null,
  fetchContacts: async () => { return 0; },
  addContact: async () => { return 0; },
  updateContact: async () => { return 0; },
  deleteContact: async () => { return 0; },
  clearError: () => {}
});

export function ContactsProvider({children}: PropsWithChildren) {
  const [contacts, setContacts] = useState<Contact[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const clearError = () => setError(null);

  const fetchContacts = async () => {
    setLoading(true);
    setError(null);
    const objUserId = (await supabase.auth.getUser()).data.user?.id!;
    
    try {
      const { data: contact_data, error: contact_error } = await supabase
        .from('user_contacts')
        .select('*')
        .or(`uid1.eq.${objUserId}, uid2.eq.${objUserId}`);

      if (contact_error) {
        console.log('Error fetching contacts:', contact_error);
        setError('Failed to fetch contacts');
        return -1;
      }

      const subjUserIds: number[] = [];

      contact_data.forEach(c => {
        if(c.uid1 === objUserId)
          subjUserIds.push(c.uid2)
        else
          subjUserIds.push(c.uid1)
      })

      const { data: user_data, error: user_error } = await supabase
        .from('user')
        .select('*')
        .filter('id', 'in', subjUserIds);

      if (user_error) {
        console.log('Error fetching contacts:', user_error);
        setError('Failed to fetch contacts');
        return -1;
      }

      setContacts(user_data || []);
      return 1;
    } catch (err) {
      console.log('Error fetching contacts:', err);
      setError('Failed to fetch contacts');
      return -1;
    } finally {
      setLoading(false);
    }
  };

  const addContact = async (username: string) => {
    setLoading(true);
    setError(null);

    try {
      const { data: userData, error: userError } = await supabase
        .from('user')
        .select('id')
        .eq('username', username);

      if (userError) {
        console.log('Error adding contact:', userError);
        setError('Failed to add contact');
        return -1;
      }

      const subjUserId = userData[0].id;
      const objUserId = (await supabase.auth.getUser()).data.user?.id!;

      console.log("Object User Id: ");
      console.log(objUserId);
      console.log("Subject User Id: ");
      console.log(subjUserId);

      const isLess = objUserId < subjUserId;

      console.log(UserFriendStatus.REQ_UID1);

      const { data: contactData, error: contactError } = await supabase
        .from('user_contacts')
        .insert([{ 
          uid1: isLess ? objUserId : subjUserId, 
          uid2: isLess ? subjUserId : objUserId,
          status: isLess ? UserFriendStatus.REQ_UID1 : UserFriendStatus.REQ_UID2
        }])
        .select()
        .single();

      if (contactError) {
        console.log('Error adding contact:', contactError);
        setError('Failed to add contact');
        return -1;
      }

      setContacts(prev => [contactData, ...prev]);
      return 1;
    } catch (err) {
      console.log('Error adding contact:', err);
      setError('Failed to add contact');
      return -1;
    } finally {
      setLoading(false);
    }
  };

  const updateContact = async (id: number, username: string) => {
    setLoading(true);
    setError(null);

    try {
      const { data, error } = await supabase
        .from('user_contacts')
        .update({ username })
        .eq('id', id)
        .select()
        .single();

      if (error) {
        console.log('Error updating contact:', error);
        setError('Failed to update contact');
        return -1;
      }

      setContacts(prev => prev.map(contact => 
        contact.id === id ? data : contact
      ));
      return 1;
    } catch (err) {
      console.log('Error updating contact:', err);
      setError('Failed to update contact');
      return -1;
    } finally {
      setLoading(false);
    }
  };

  const deleteContact = async (id: number) => {
    setLoading(true);
    setError(null);

    try {
      const { error } = await supabase
        .from('user_contacts')
        .delete()
        .eq('id', id);

      if (error) {
        console.log('Error deleting contact:', error);
        setError('Failed to delete contact');
        return -1;
      }

      setContacts(prev => prev.filter(contact => contact.id !== id));
      return 1;
    } catch (err) {
      console.log('Error deleting contact:', err);
      setError('Failed to delete contact');
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
      updateContact,
      deleteContact,
      clearError
    }}>
      {children}
    </ContactsContext>
  );
}