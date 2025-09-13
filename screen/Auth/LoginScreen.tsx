import { AuthContext } from "@/contexts/AuthContext";
import { use, useEffect, useState } from "react";
import { Button, StyleSheet, Text, TextInput, View } from "react-native";


export default function LoginScreen() {
    const [loading, setLoading] = useState(true);
    const [password, setPassword] = useState("sukablya");
    const [email, setEmail] = useState("antox.qscwdv@gmail.com");

    const { login, error, setError } = use(AuthContext);

    useEffect(() => {
        setError(null);
    }, [email, password])

    return (
        <View style={styles.container}>
            <View>
                <Text>Login</Text>
                <Text style={styles.label}>Email</Text>
                <TextInput value={email} onChangeText={setEmail} style={styles.label} />
                <Text style={styles.label}>Password</Text>
                <TextInput value={password} onChangeText={setPassword} style={styles.label} />
                <Button title="Submit" onPress={async () => 
                    await login(email, password)
                } />
                { 
                    error ?
                    <>
                        <Text style={styles.error}>{error}</Text>
                        <Text style={styles.error}>Plese try again.</Text>
                    </>
                    : null
                }
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        padding: 20,
        justifyContent: 'center',
    },
    label: {
        fontSize: 16,
        lineHeight: 24,
        color: 'white',
    },
    error: {
        fontSize: 16,
        lineHeight: 24,
        color: 'red',
        textAlign: 'center',
        marginTop: 8,
    }
});