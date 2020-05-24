import React from "react";
import { StyleSheet, View } from "react-native";
import Level from "./Level";
import useFilteredBetaAngle from "./useFilteredBetaAngle";
import AngleLabel from "./AngleLabel";

export default function LevelAlert() {
  const angle = useFilteredBetaAngle();

  return (
    <View style={styles.container}>
      <View style={[styles.label, { transform: [{ rotateZ: "90deg" }] }]}>
        <AngleLabel angle={angle} />
      </View>
      <Level angle={angle} />
      <View style={[styles.label, { transform: [{ rotateZ: "-90deg" }] }]}>
        <AngleLabel angle={angle} />
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
  label: {
    flexGrow: 1,
    zIndex: 10,
    alignItems: "center",
    width: 50,
  },
});
