import { useBroadcastChatsSubscription } from "@/frontend/hooks/realtime_broadcast/useRealtimeSuscriptionsFactory";
import { useAddContact } from "@/frontend/hooks/useContacts";
import { useError, useErrorActions } from "@/frontend/states_store/errorStore";
import { styles } from "@/utils/styles";
import { useEffect, useState } from "react";
import { Button, Text, TextInput, View } from "react-native";

export default function ContactsAddScreen() {
  const [username, setUsername] = useState("");
  const [isSubmitted, setIsSubmitted] = useState(false);

  const error = useError();
  const { setError } = useErrorActions();
  const addContactMutation = useAddContact();

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
