import { useAddContact } from "@/hooks/useContacts";
import { useError, useErrorActions } from "@/states_store/errorStore";
import { useStyles } from "@/utils/styles";
import { Button } from "@react-navigation/elements";
import { useEffect, useState } from "react";
import { Text, TextInput, View } from "react-native";

export default function ContactsAddScreen() {
  const [username, setUsername] = useState("");
  const [isSubmitted, setIsSubmitted] = useState(false);

  const error = useError();
  const { setError } = useErrorActions();
  const addContactMutation = useAddContact();
  const styles = useStyles();
  
  const handleUsernameChange = (username: string) => {
    setUsername(username);
    setIsSubmitted(false);
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
    <View style={[styles.container, {display: 'flex', flexDirection: 'column', justifyContent: 'space-between', height: '100%'}]}>
      <View style={styles.containerInner}>
        <Text style={styles.label}>Username</Text>
        <TextInput
          value={username}
          onChangeText={handleUsernameChange}
          style={styles.textInput}
        />
      </View>
      <View style={styles.containerInner}>
        <Button onPress={async () => await handleSubmit()} style={styles.button}>Add Contact</Button>
      </View>
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
