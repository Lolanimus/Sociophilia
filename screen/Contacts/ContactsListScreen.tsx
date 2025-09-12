import { AuthContext } from "@/contexts/AuthContext";
import { ContactsContext } from "@/contexts/ContactsContext";
import { Link } from "expo-router";
import { use, useEffect } from "react";
import { Button, FlatList, StyleSheet, Text, View } from "react-native";

export default function ContactsListScreen() {
    const { logout } = use(AuthContext);
    const { fetchContacts, contacts } = use(ContactsContext);

    useEffect(() => {
        fetchContacts();
    }, []);

  return (
    <View style={styles.container}>
        <View>
        {
            contacts.length > 0 ? (
                <FlatList
                    data={contacts}
                    keyExtractor={(item) => item.id.toString()} 
                    renderItem={({ item }) => (                                                                       
                        <View style={styles.container}>                                                              
                            <Text style={styles.label}>{item.username}</Text>                                    
                            <Text style={styles.label}>{item.email}</Text>                                      
                        </View>                                                                                        
                    )}
                />
            ) : (
                <Text>No contacts yet</Text>
            )
        }

            <Button
                onPress={async () => await logout()}
                title="Sign Out"
            />

            <Link
                href={"/(protected)/(contacts)/add"} 
                style={styles.linkText}
            >
                Add a new contact
            </Link>
        </View>
    </View>
  );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        padding: 20,
        height: '100%',
        width: '100%',
        flexDirection: 'column',
        justifyContent: 'space-evenly',
        borderColor: 'red',
    },
    label: {
        fontSize: 16,
        lineHeight: 24,
        color: 'white',
    },
    linkText: {
      color: 'blue',
      fontSize: 16,
      textDecorationLine: 'underline',
    }
});