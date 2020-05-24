import React from "react";
import { View } from "react-native";

export default function Bubble({
  size,
  color,
}: {
  size: number;
  color: string;
}) {
  return (
    <View
      style={{
        backgroundColor: color,
        width: size,
        height: size,
        borderRadius: size / 2,
      }}
    />
  );
}
