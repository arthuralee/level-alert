import React from "react";
import { StyleSheet, Text } from "react-native";

function round(val: number, dp: number) {
  const exp = Math.pow(10, dp);
  return Math.round(val * exp) / exp;
}

export default function AngleLabel({ angle }: { angle: number }) {
  angle = (Math.abs(angle) / Math.PI) * 180;
  angle = angle < 10 ? round(angle, 1) : Math.round(angle);
  return <Text style={styles.angleLabel}>{angle}º</Text>;
}

const styles = StyleSheet.create({
  angleLabel: {
    fontSize: 50,
    fontWeight: "300",
    color: "#555",
  },
});
