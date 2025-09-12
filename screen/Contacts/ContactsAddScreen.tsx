import { ContactsContext } from "@/contexts/ContactsContext";
import { use, useState } from "react";
import { Button, StyleSheet, Text, TextInput, View } from "react-native";

export default function ContactsAddScreen() {
    const [username, setUsername] = useState('');
    const [error, setError] = useState(false);

    const { addContact } = use(ContactsContext);

    console.log("error is: " + error);

  return (
    <View style={styles.container}>
        <Text style={styles.label}>Username</Text>
        <TextInput value={username} onChangeText={setUsername} style={styles.textInput} />
        <Button 
            onPress = {
                async () => (await addContact(username) === -1) ? setError(true) : setError(false) 
            } 
            title = "Add Contact"
        />
        { 
            error ?
            <>
                <Text style={styles.error}>Error occured when validating the login credentials.</Text>
                <Text style={styles.error}>Plese try again.</Text>
            </>
            : null
        }
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
        borderColor: 'red',
    },
    label: {
        fontSize: 16,
        lineHeight: 24,
        color: 'white',
    },
    textInput: {
        fontSize: 16,
        lineHeight: 24,
        color: 'white',
        borderColor: 'white',
    },
    error: {
        fontSize: 16,
        lineHeight: 24,
        color: 'red',
        textAlign: 'center',
        marginTop: 8,
    }
});