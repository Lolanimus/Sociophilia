import { useThemeColor } from "@/hooks/useThemeColor";
import { StyleSheet } from "react-native";

export const useStyles = () => {
  const textColor = useThemeColor('text');
  const backgroundColor = useThemeColor('background');
  
  return StyleSheet.create({
    container: {
      flex: 1,
      padding: 20,
      height: "100%",
      width: "100%",
      flexDirection: "column",
      justifyContent: "flex-start",
      borderColor: "red",
    },
    containerInner: {
      paddingBottom: 10,
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
      color: textColor,
    },
    linkText: {
      color: textColor,
      fontSize: 16,
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
      backgroundColor: textColor,
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
    textInput: {
      fontSize: 16,
      color: textColor,
      borderColor: backgroundColor,
      borderWidth: 1,
      borderRadius: 15,
      padding: 10,
    },
    successLabel: {
      fontSize: 16,
      lineHeight: 24,
      color: "white",
      textAlign: "center",
      marginTop: 12,
    },
    button: {
      margin: 8,
      color: textColor,
      backgroundColor: backgroundColor,
    },
    item: {
      paddingHorizontal: 10,
      paddingVertical: 4,
      marginVertical: 8,
      backgroundColor: backgroundColor,
      borderRadius: 8,
      flexDirection: "row",
      justifyContent: "space-between",
      alignItems: "center",
    },
  });
};