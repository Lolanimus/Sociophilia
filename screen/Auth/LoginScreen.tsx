import { login } from "@/api/auth";
import { useError, useErrorActions } from "@/states_store/errorStore";
import { useQueryClient } from "@tanstack/react-query";
import { useRouter } from "expo-router";
import { useEffect, useState } from "react";
import { Button, StyleSheet, Text, TextInput, View } from "react-native";

export default function LoginScreen() {
  const [password, setPassword] = useState(
    process.env.EXPO_PUBLIC_LOGIN_PASSWORD || ""
  );
  const [email, setEmail] = useState(process.env.EXPO_PUBLIC_LOGIN_EMAIL || "");
  const error = useError();
  const { setError } = useErrorActions();
  const router = useRouter();
  const queryClient = useQueryClient();

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
      <View>
        <Text>Login</Text>
        <Text style={styles.label}>Email</Text>
        <TextInput value={email} onChangeText={setEmail} style={styles.label} />
        <Text style={styles.label}>Password</Text>
        <TextInput
          value={password}
          onChangeText={setPassword}
          style={styles.label}
        />
        <Button title="Submit" onPress={submitEvent} />
        {error ? (
          <>
            <Text style={styles.error}>{error}</Text>
            <Text style={styles.error}>Plese try again.</Text>
          </>
        ) : null}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    justifyContent: "center",
  },
  label: {
    fontSize: 16,
    lineHeight: 24,
    color: "white",
  },
  error: {
    fontSize: 16,
    lineHeight: 24,
    color: "red",
    textAlign: "center",
    marginTop: 8,
  },
});
