import { AuthContext } from "@/contexts/AuthContext";
import { ContactsContext } from "@/contexts/ContactsContext";
import { Link, router } from "expo-router";
import { use, useEffect } from "react";
import { Button, FlatList, StyleSheet, Text, TouchableOpacity, View } from "react-native";


export default function ContactsListScreen() {
    const { logout } = use(AuthContext);
    const { fetchContacts, data, meta, deleteContact, approveContact } = use(ContactsContext);

    // Only fetch contacts once when this screen first loads
    useEffect(() => {
        fetchContacts();
    }, []);


    // TODO: 
    // All the functionality logic should be separated from the Screen Component into a ContactsContext.
    // ---------------------
    // Also never use any, only the defined types in /types folder.
    // ---------------------
    // Also instead of using user's id for the chat, instead use chat's id
    // (You can omit this for now, as we don't have chat tables yet.)
    // (Instead use a username. We don't expose user's Ids).
    // ---------------------
    // params: {
    //  username: contact.username
    // }

    const pressContact = (contact: any) =>{
        router.push({
             pathname: '/(protected)/(chats)/[id]',
             params: {
                id: contact.id,
                userName: contact.username,
             }
        });
    };

  return (
    <View style={styles.container}>
        <View>
        {
            data ? (
                <>
                    <Text style={styles.label}>Total Contacts: {meta!.total_contacts}</Text>
                    <FlatList
                        data={data}
                        keyExtractor={(item) => item.username} 
                        renderItem={({ item }) => (                                                                       
                            <View style={styles.contactItem}>
                                <TouchableOpacity onPress={()=> pressContact(item)}>
                                    <Text style={styles.label}>{item.username}</Text> 
                                </TouchableOpacity>                                   
                                <Text style={styles.label}>{item.status}</Text>       
                                {
                                    (item.status !== item.requester_pos && item.status !== "APPROVED") ? (
                                        <TouchableOpacity style={styles.deleteButton} onPress={
                                            async () => await approveContact(item.username)
                                        }>   
                                            <Text style={styles.acceptText}>✓</Text>
                                        </TouchableOpacity>
                                    ) : null
                                }
                                <TouchableOpacity style={styles.deleteButton} onPress={
                                    async () => await deleteContact(item.username)
                                }>
                                    <Text style={styles.deleteText}>X</Text>
                                </TouchableOpacity>
                            </View>                                                                                        
                        )}
                    />
                </>
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
    },
    deleteButton: {
        padding: 8,
        marginLeft: 10,
    },
    deleteText: {
        color: '#ff4444',
        fontSize: 18,
        fontWeight: 'bold',
    },
    acceptText: {
        color: '#44ff63ff',
        fontSize: 18,
        fontWeight: 'bold',
    },
    contactItem: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        padding: 10,
    },
    error: {
        fontSize: 16,
        lineHeight: 24,
        color: 'red',
        textAlign: 'center',
        marginTop: 8,
    }
});