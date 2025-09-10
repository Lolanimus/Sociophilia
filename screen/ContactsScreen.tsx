import { AuthContext } from "@/contexts/AuthContext";
import { supabase } from "@/utils/supabase";
import { use, useState } from "react";
import { StyleSheet, Text, TouchableOpacity, View } from "react-native";

export default function ContactsScreen() {
    const [contacts, setContacts] = useState(supabase.from("user_contacts"));
    const { logout } = use(AuthContext);

  return (
    <View style={styles.container}>
        <View>
        {
            !contacts ?
            <Text style={styles.label}>Contacts...</Text>
            : 
            <Text style={styles.label}>No contacts yet...</Text>
        }

        <TouchableOpacity
            onPress={logout}
        >
            <Text style={styles.label}>Sign Out</Text>
        </TouchableOpacity>
        </View>
    </View>
  );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        padding: 20,
        justifyContent: 'center',
    },
    label: {
        fontSize: 16,
        lineHeight: 24,
        color: 'white',
    },
});