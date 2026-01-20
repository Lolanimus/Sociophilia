import { login } from "@/api/auth";
import { MaterialCommunityIcons } from '@expo/vector-icons';
import { useError, useErrorActions } from "@/states_store/errorStore";
import { useStyles } from "@/utils/styles";
import { Button } from "@react-navigation/elements";
import { useQueryClient } from "@tanstack/react-query";
import { Link, useRouter } from "expo-router";
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
  // State variable to track password visibility
  const [showPassword, setShowPassword] = useState(false);

  // Function to toggle the password visibility state
  const toggleShowPassword = () => {
      setShowPassword(!showPassword);
  };

  const submitEvent = async () => {
    // Clear any previous error before attempting login
    setError(null);

    const user = await login({ email, password });
    await queryClient.invalidateQueries();

    // Navigate only if login returned a user (ignore stale error state)
    if (user) {
      router.replace("/(protected)/(contacts)/list");
    }
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
            secureTextEntry={!showPassword}
          value={password}
          onChangeText={setPassword}
          style={styles.textInput}
        />
        <MaterialCommunityIcons
            name={showPassword ? "eye-off-outline" : "eye-outline"}
            size={24}
            color="gray"
            onPress={toggleShowPassword}
            style={{ position: 'absolute', right: 10, top: 35 }}
        />
      </View>
      <View style={styles.containerInner}>
        {error ? (
          <>
            <Text style={styles.error}>{error}</Text>
            <Text style={styles.error}>Plese try again.</Text>
          </>
        ) : null}
        <Button onPress={submitEvent} style={styles.button}>Submit</Button>
      </View>
      <View style={[styles.containerInner, { alignItems: 'center' }]}>
        <Link href="https://artemmelnikov.com/sociophilia-privacy-policy/" style={styles.linkText}>Privacy Policy</Link>
      </View>

    </View>
  );
}
