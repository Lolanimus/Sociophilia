import { useThemeColor } from "@/hooks/useThemeColor";
import { StyleSheet } from "react-native";

export const useMdStyles = () => {
  const textColor = useThemeColor('text');
  
  return StyleSheet.create({
    body: {
      color: textColor,
    },
    heading1: {
      fontSize: 32,
      fontWeight: 'bold',
      color: textColor,
      marginTop: 20,
      marginBottom: 10,
    },
    heading2: {
      fontSize: 24,
      fontWeight: 'bold',
      color: textColor,
      marginTop: 20,
      marginBottom: 10,
    },
    heading3: {
      fontSize: 20,
      fontWeight: 'bold',
      color: textColor,
      marginTop: 15,
      marginBottom: 8,
    },
    paragraph: {
      color: textColor,
      fontSize: 16,
      lineHeight: 24,
      marginBottom: 10,
    },
    strong: {
      fontWeight: 'bold',
      color: textColor,
    },
    listItem: {
      color: textColor,
      fontSize: 16,
      lineHeight: 24,
      marginBottom: 5,
    },
    link: {
      color: '#007AFF',
      textDecorationLine: 'underline',
    },
    hr: {
      backgroundColor: textColor,
      height: 1,
      marginVertical: 20,
    },
  });
};