import { useDeleteMessage } from "@/hooks/useMessages";
import { Message } from "@/types/api.types";
import { useStyles } from "@/utils/styles";
import { Text } from "@react-navigation/elements";
import { TouchableOpacity, View } from "react-native";

export default function MessageComponent(props: { msg: Message }) {
  const msg = props.msg;
  const deleteMsgMutation = useDeleteMessage();
  const styles = useStyles();
  
  const deleteMsgEvent = () => {
    deleteMsgMutation.mutate(msg.id);
  };

  return (
    <View style={styles.item}>
      <Text style={styles.label}>{msg.contents}</Text>
      <TouchableOpacity style={styles.deleteButton} onPress={deleteMsgEvent}>
        <Text style={styles.deleteText}>X</Text>
      </TouchableOpacity>
    </View>
  );
}