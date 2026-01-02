import { useError } from "@/states_store/errorStore";
import { useStyles } from "@/utils/styles";
import { Text } from "@react-navigation/elements";

export default function ErrorOnSubmit(props: { isSubmitted: boolean }) {
  const error = useError();
  const styles = useStyles();
  
  if (error) {
    return (
      <>
        <Text style={styles.error}>{error}</Text>
        <Text style={styles.error}>Plese try again.</Text>
      </>
    );
  } else if (props.isSubmitted) {
    return (
      <>
        <Text style={styles.label}>Success</Text>
      </>
    );
  }
}
