import { AuthContext } from "@/contexts/AuthContext";
import { use, useState } from "react";
import { Button, StyleSheet, Text, TextInput, View } from "react-native";

export default function SignupScreen() {
    const [username, setUsername] = useState("suka");
    const [email, setEmail] = useState("antox.qscwdv@gmail.com");
    const [password, setPassword] = useState("sukablya");
    const { signup } = use(AuthContext);
        
    return (
        <View style={styles.container}>
            <Text>Signup</Text>
            <Text style={styles.label}>Username</Text>
            <TextInput style={styles.label} value={username} onChangeText={setUsername}/>
            <Text style={styles.label}>Email</Text>
            <TextInput style={styles.label} value={email} onChangeText={setEmail}/>
            <Text style={styles.label}>Password</Text>
            <TextInput style={styles.label} value={password} onChangeText={setPassword}/>
            <Button title="Submit" onPress={() => signup(email, username, password)} />
        </View>
    )
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