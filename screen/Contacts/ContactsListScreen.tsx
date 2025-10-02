import { signout } from "@/api/auth";
import { useChats } from "@/hooks/useChats";
import {
  useApproveContact,
  useContacts,
  useDeleteContact,
} from "@/hooks/useContacts";
import { useQueryClient } from "@tanstack/react-query";
import { Link, useRouter } from "expo-router";
import {
  Button,
  FlatList,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from "react-native";

export default function ContactsListScreen() {
  const router = useRouter();
  const queryClient = useQueryClient();
  const { data: contacts } = useContacts();
  useChats();
  const approveContactMutation = useApproveContact();
  const deleteContactMutation = useDeleteContact();

  const signOutEvent = async () => {
    await signout();
    queryClient.clear();
    router.navigate("/(authentication)/login");
  };

  const redirectToChat = (user_id: string) => {
    router.navigate({
      pathname: "/(protected)/(chats)/[id]",
      params: { id: user_id },
    });
  };

  return (
    <View style={styles.container}>
      <View>
        {contacts?.data ? (
          <>
            <Text style={styles.label}>
              Total Contacts: {contacts?.meta!.total_contacts}
            </Text>
            <FlatList
              data={contacts.data}
              keyExtractor={(item) => item.username}
              renderItem={({ item }) => (
                <View style={styles.contactItem}>
                  <TouchableOpacity
                    onPress={() => redirectToChat(item.user_id)}
                  >
                    <Text style={styles.label}>{item.username}</Text>
                  </TouchableOpacity>
                  <Text style={styles.label}>{item.status}</Text>
                  {item.status !== item.requester_pos &&
                  item.status !== "APPROVED" ? (
                    <TouchableOpacity
                      style={styles.deleteButton}
                      onPress={async () =>
                        approveContactMutation.mutate(item.user_id)
                      }
                    >
                      <Text style={styles.acceptText}>✓</Text>
                    </TouchableOpacity>
                  ) : null}
                  <TouchableOpacity
                    style={styles.deleteButton}
                    onPress={async () =>
                      deleteContactMutation.mutate(item.user_id)
                    }
                  >
                    <Text style={styles.deleteText}>X</Text>
                  </TouchableOpacity>
                </View>
              )}
            />
          </>
        ) : (
          <Text>No contacts yet</Text>
        )}

        <Button onPress={signOutEvent} title="Sign Out" />

        <Link href={"/(protected)/(contacts)/add"} style={styles.linkText}>
          Add a new contact
        </Link>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    height: "100%",
    width: "100%",
    flexDirection: "column",
    justifyContent: "space-evenly",
    borderColor: "red",
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
