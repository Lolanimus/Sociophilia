import { login } from "@/api/auth";
import { useError, useErrorActions } from "@/states_store/errorStore";
import { useStyles } from "@/utils/styles";
import { Button } from "@react-navigation/elements";
import { useQueryClient } from "@tanstack/react-query";
import { useRouter } from "expo-router";
import { useEffect, useState } from "react";
import { Text, TextInput, View } from "react-native";

export default function LoginScreen() {
  const [password, setPassword] = useState(
    process.env.EXPO_PUBLIC_LOGIN_PASSWORD || ""
  );
  const [email, setEmail] = useState(process.env.EXPO_PUBLIC_LOGIN_EMAIL || "");
  const error = useError();
  const { setError } = useErrorActions();
  const router = useRouter();
  const queryClient = useQueryClient();
  const styles = useStyles();

  const submitEvent = async () => {
    await login({ email, password });
    queryClient.invalidateQueries();
    if (!error) router.navigate("/(protected)/(contacts)/list");
  };

  useEffect(() => {
    setError(null);
  }, [email, password]);

  return (
    <View style={styles.container}>
      <View style={styles.containerInner}>
        <Text style={styles.label}>Email</Text>
        <TextInput value={email} onChangeText={setEmail} style={styles.textInput} />
      </View>
      <View style={styles.containerInner}>
        <Text style={styles.label}>Password</Text>
        <TextInput
          value={password}
          onChangeText={setPassword}
          style={styles.textInput}
        />
      </View>
      <Button onPress={submitEvent} style={styles.button}>Submit</Button>
      {error ? (
        <>
          <Text style={styles.error}>{error}</Text>
          <Text style={styles.error}>Plese try again.</Text>
        </>
      ) : null}
    </View>
  );
}
