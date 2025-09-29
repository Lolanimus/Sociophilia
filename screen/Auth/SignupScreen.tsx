import { signup } from "@/api/auth";
import { useError, useErrorActions } from "@/states_store/errorStore";
import { use, useEffect, useState } from "react";
import { Button, StyleSheet, Text, TextInput, View } from "react-native";

export default function SignupScreen() {
  const [password, setPassword] = useState(
    process.env.EXPO_PUBLIC_LOGIN_PASSWORD || ""
  );
  const [email, setEmail] = useState(process.env.EXPO_PUBLIC_LOGIN_EMAIL || "");
  const [username, setUsername] = useState(
    process.env.EXPO_PUBLIC_LOGIN_USERNAME || ""
  );
  const [submitted, setSubmitted] = useState(false);

  const error = useError();
  const { setError } = useErrorActions();

  useEffect(() => {
    setError(null);
    setSubmitted(false);
  }, [username, email, password, setError, setSubmitted]);

  return (
    <View style={styles.container}>
      <Text>Signup</Text>
      <Text style={styles.label}>Username</Text>
      <TextInput
        style={styles.label}
        value={username}
        onChangeText={setUsername}
      />
      <Text style={styles.label}>Email</Text>
      <TextInput style={styles.label} value={email} onChangeText={setEmail} />
      <Text style={styles.label}>Password</Text>
      <TextInput
        style={styles.label}
        value={password}
        onChangeText={setPassword}
      />
      <Button
        title="Submit"
        onPress={async () => {
          await signup({ email, username, password });
          if (!error) setSubmitted(true);
        }}
      />
      {error ? (
        <>
          <Text style={styles.error}>{error}</Text>
          <Text style={styles.error}>Plese try again.</Text>
        </>
      ) : null}
      {submitted ? (
        <>
          <Text style={styles.successLabel}>Successfully Signed Up!</Text>
          <Text style={styles.successLabel}>Confirm you email</Text>
          <Text style={styles.successLabel}>
            Then go to Login tab to Log In
          </Text>
        </>
      ) : null}
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
  successLabel: {
    fontSize: 16,
    lineHeight: 24,
    color: "white",
    textAlign: "center",
    marginTop: 12,
  },
});
