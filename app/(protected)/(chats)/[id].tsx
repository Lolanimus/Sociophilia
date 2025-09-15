import { router, useLocalSearchParams } from 'expo-router';
import { Text, TouchableOpacity, View } from 'react-native';
export default function ChatScreen(){
  const {id, userName} = useLocalSearchParams();

  return (
    <View style={{ flex: 1, backgroundColor: 'white', padding: 20 }}>
      <TouchableOpacity onPress={() => router.back()}>
        <Text>Back</Text>
      </TouchableOpacity>
      <Text>Chat with: {userName || 'No userName received'}</Text>
      <Text>ID: {id || 'No id received'}</Text>
    </View>
  )
}
