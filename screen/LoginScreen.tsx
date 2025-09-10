import { AuthContext } from "@/contexts/AuthContext";
import { use, useState } from "react";
import { Button, StyleSheet, Text, TextInput, View } from "react-native";


export default function LoginScreen() {
    const [loading, setLoading] = useState(true);
    const [password, setPassword] = useState("");
    const [email, setEmail] = useState("");

    const { login } = use(AuthContext);

    return (
        <View style={styles.container}>
            <View>
                <Text>Login</Text>
                <Text style={styles.label}>Email</Text>
                <TextInput value={email} onChangeText={setEmail} style={styles.label} />
                <Text style={styles.label}>Password</Text>
                <TextInput value={password} onChangeText={setPassword} style={styles.label} />
                <Button title="Submit" onPress={() => login(email, password)} />
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
});