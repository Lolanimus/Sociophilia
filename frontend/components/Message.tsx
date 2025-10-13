import { useDeleteMessage } from "@/frontend/hooks/useMessages";
import { Message } from "@/backend/types/api.types";
import { Text } from "@react-navigation/elements";
import { StyleSheet, TouchableOpacity, View } from "react-native";

export default function MessageComponent(props: { msg: Message }) {
  const msg = props.msg;
  const deleteMsgMutation = useDeleteMessage();

  const deleteMsgEvent = () => {
    deleteMsgMutation.mutate(msg.id);
  };

  return (
    <View style={styles.message}>
      <Text style={styles.label}>{msg.contents}</Text>
      <TouchableOpacity style={styles.deleteButton} onPress={deleteMsgEvent}>
        <Text style={styles.deleteText}>X</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 10,
    marginVertical: 5,
    backgroundColor: "#2a2a2a",
    borderRadius: 8,
    maxWidth: "80%",
  },
  message: {
    paddingHorizontal: 10,
    marginVertical: 8,
    backgroundColor: "#2a2a2a",
    borderRadius: 8,
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },
  border: {
    padding: 20,
    borderBottomWidth: 1,
    borderBottomColor: "#ccc",
  },
  header: {
    fontSize: 24,
    fontWeight: "bold",
    textAlign: "center",
    marginBottom: 20,
    marginTop: 10,
    color: "white",
  },
  label: {
    fontSize: 16,
    lineHeight: 24,
    color: "white",
  },
  linkText: {
    color: "blue",
    fontSize: 16,
    textDecorationLine: "underline",
  },
  deleteButton: {
    padding: 8,
    marginLeft: 10,
  },
  deleteText: {
    color: "#ff4444",
    fontSize: 18,
    fontWeight: "bold",
  },
  acceptText: {
    color: "#44ff63ff",
    fontSize: 18,
    fontWeight: "bold",
  },
  contactItem: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    padding: 10,
  },
  error: {
    fontSize: 16,
    lineHeight: 24,
    color: "red",
    textAlign: "center",
    marginTop: 8,
  },
});
