import ErrorOnSubmit from "@/components/ErrorOnSubmit";
import { useBroadcastChatsSubscription } from "@/hooks/realtime_broadcast/useRealtimeSuscriptionsFactory";
import { useChatByUserId } from "@/hooks/useChats";
import {
  useInfiniteMessages,
  useSendMessage
} from "@/hooks/useMessages";
import { useErrorActions } from "@/states_store/errorStore";
import { useStyles } from "@/utils/styles";
import { Button } from "@react-navigation/elements";
import { useLocalSearchParams } from "expo-router";
import { useEffect, useState } from "react";
import { FlatList, Text, TextInput, View } from "react-native";
import MessageComponent from "../../components/Message";

export default function ChatScreen() {
  const cursorLimit = 10;
  const styles = useStyles();
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
          style={[styles.textInput, {marginBottom: 8, marginTop: 8 }]}
          onChangeText={setMessage}
          value={message}
        />
        <Button onPress={submitMsg} style={styles.button}>Send</Button>
      </View>
      <ErrorOnSubmit isSubmitted={isSubmitted} />
    </View>
  );
}
