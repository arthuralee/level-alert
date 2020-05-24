import React from "react";
import { StyleSheet, View, Text } from "react-native";
import Level from "./Level";

export default function LevelAlert() {
  return (
    <View style={styles.container}>
      <View style={styles.side}>
        <Text>Test</Text>
      </View>
      <Level />
      <View style={styles.side}>
        <Text>Test</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  side: {
    flexGrow: 1,
    backgroundColor: "red",
    zIndex: 10,
    alignItems: "center",
  },
});
