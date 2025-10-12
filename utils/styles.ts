import { StyleSheet } from "react-native";

export const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    paddingTop: 50,
    height: "100%",
    width: "100%",
    flexDirection: "column",
    justifyContent: "flex-start",
    borderColor: "red",
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
  textInput: {
    fontSize: 16,
    lineHeight: 24,
    color: "white",
    borderColor: "white",
  },
  successLabel: {
    fontSize: 16,
    lineHeight: 24,
    color: "white",
    textAlign: "center",
    marginTop: 12,
  },
});
