import { useChatByUserId } from "@/hooks/useChats";
import {
  useInfiniteMessages,
  useMessages,
  useSendMessage,
} from "@/hooks/useMessages";
import MessageComponent from "../../components/Message";
import { useLocalSearchParams } from "expo-router";
import { Text, Button, View, TextInput, FlatList } from "react-native";
import { useEffect, useState } from "react";
import { useErrorActions } from "@/states_store/errorStore";
import { styles } from "@/utils/styles";
import ErrorOnSubmit from "@/components/ErrorOnSubmit";
import { useBroadcastChatsSubscription } from "@/hooks/realtime_broadcast/useRealtimeSuscriptionsFactory";

export default function ChatScreen() {
  const cursorLimit = 10;

  const [message, setMessage] = useState("");
  const [isSubmitted, setIsSubmitted] = useState(false);
  const { id }: { id: string } = useLocalSearchParams();
  const sendMsgMutation = useSendMessage();
  const setError = useErrorActions().setError;
  const { data: chat } = useChatByUserId(id);
  const {
    data: messages,
    fetchNextPage,
    hasNextPage,
  } = useInfiniteMessages(chat?.id, cursorLimit);
  useBroadcastChatsSubscription();

  const submitMsg = () => {
    sendMsgMutation.mutate({
      contents: message,
      opts: {
        chatId: chat?.id,
        targetId: id,
      },
    });

    setMessage("");
  };

  useEffect(() => {
    setIsSubmitted(false);
    setError(null);
  }, [message]);

  return (
    <View style={styles.container}>
      <FlatList
        data={messages?.pages?.flatMap((page) => page.messages)}
        renderItem={({ item }) => <MessageComponent msg={item} key={item.id} />}
        keyExtractor={(item) => item.id}
        inverted
        contentContainerStyle={{ flexGrow: 1 }}
        ListEmptyComponent={
          <Text style={styles.label}>Nothing in the chat yet...</Text>
        }
        onEndReached={() => hasNextPage && fetchNextPage()}
        onEndReachedThreshold={0.5}
      />
      <View>
        <TextInput
          style={styles.label}
          onChangeText={setMessage}
          value={message}
        />
        <Button title="send" onPress={submitMsg} />
      </View>
      <ErrorOnSubmit isSubmitted={isSubmitted} />
    </View>
  );
}
