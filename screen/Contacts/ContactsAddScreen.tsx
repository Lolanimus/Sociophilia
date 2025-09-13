import { ContactsContext } from "@/contexts/ContactsContext";
import { use, useState } from "react";
import { Button, StyleSheet, Text, TextInput, View } from "react-native";

export default function ContactsAddScreen() {
    const [username, setUsername] = useState('');
    const { addContact, error, clearError } = use(ContactsContext);

    const handleUsernameChange = (text: string) => {
      setUsername(text);
      if (error) {
        clearError();
      }
    };

    const handleSubmit = async () => {
      const result = await addContact(username);
      if (result === 1) {
        setUsername('');
      }
    };

  return (
    <View style={styles.container}>
        <Text style={styles.label}>Username</Text>
        <TextInput value={username} onChangeText={handleUsernameChange} style={styles.textInput} />
        <Button 
            onPress = {
                async () => await handleSubmit()
            } 
            title = "Add Contact"
        />
        { 
            error ?
            <>
                <Text style={styles.error}>{error}</Text>
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