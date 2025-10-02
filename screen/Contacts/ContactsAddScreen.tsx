import { useAddContact } from "@/hooks/useContacts";
import { useError, useErrorActions } from "@/states_store/errorStore";
import log from "@/utils/logger";
import supabase from "@/utils/supabase";
import { use, useEffect, useState } from "react";
import { Button, StyleSheet, Text, TextInput, View } from "react-native";

export default function ContactsAddScreen() {
  const [username, setUsername] = useState("");
  const [isSubmitted, setIsSubmitted] = useState(false);

  const error = useError();
  const { setError } = useErrorActions();
  const addContactMutation = useAddContact();

  const handleUsernameChange = (username: string) => {
    setUsername(username);
    if (error) {
      setError(null);
    }
  };

  const handleSubmit = async () => {
    addContactMutation.mutate(username);
    setUsername("");
    setIsSubmitted(true);
  };

  useEffect(() => {
    setIsSubmitted(false);
    setError(null);
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.label}>Username</Text>
      <TextInput
        value={username}
        onChangeText={handleUsernameChange}
        style={styles.textInput}
      />
      <Button onPress={async () => await handleSubmit()} title="Add Contact" />
      {error ? (
        <>
          <Text style={styles.error}>{error}</Text>
          <Text style={styles.error}>Plese try again.</Text>
        </>
      ) : isSubmitted ? (
        <>
          <Text style={styles.label}>Success</Text>
        </>
      ) : null}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    height: "100%",
    width: "100%",
    flexDirection: "column",
    borderColor: "red",
  },
  label: {
    fontSize: 16,
    lineHeight: 24,
    color: "white",
  },
  textInput: {
    fontSize: 16,
    lineHeight: 24,
    color: "white",
    borderColor: "white",
  },
  error: {
    fontSize: 16,
    lineHeight: 24,
    color: "red",
    textAlign: "center",
    marginTop: 8,
  },
});
