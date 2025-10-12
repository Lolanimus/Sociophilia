import { signout } from "@/api/auth";
import { useBroadcastContactsSubscription } from "@/hooks/realtime_broadcast/useRealtimeSuscriptionsFactory";
import { useChats } from "@/hooks/useChats";
import {
  useApproveContact,
  useContacts,
  useDeleteContact,
} from "@/hooks/useContacts";
import { styles } from "@/utils/styles";
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
  const approveContactMutation = useApproveContact();
  const deleteContactMutation = useDeleteContact();
  useChats();
  useBroadcastContactsSubscription();

  const signOutEvent = async () => {
    await signout();
    queryClient.clear();
    router.replace("/login");
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
