import React from "react";
import { StyleSheet, View } from "react-native";
import Level from "./Level";

export default function App() {
  return (
    <View style={styles.container}>
      <Level />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
});
