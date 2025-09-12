import { AuthContext } from "@/contexts/AuthContext";
import { use, useState } from "react";
import { Button, StyleSheet, Text, TextInput, View } from "react-native";


export default function LoginScreen() {
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(false);
    const [password, setPassword] = useState("sukablya");
    const [email, setEmail] = useState("antox.qscwdv@gmail.com");

    const { login } = use(AuthContext);

    return (
        <View style={styles.container}>
            <View>
                <Text>Login</Text>
                <Text style={styles.label}>Email</Text>
                <TextInput value={email} onChangeText={setEmail} style={styles.label} />
                <Text style={styles.label}>Password</Text>
                <TextInput value={password} onChangeText={setPassword} style={styles.label} />
                <Button title="Submit" onPress={async () => 
                    (await login(email, password) === -1) ? setError(true) : setError(false)
                } />
                { 
                    error ?
                    <>
                        <Text style={styles.error}>Error occured when validating the login credentials.</Text>
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