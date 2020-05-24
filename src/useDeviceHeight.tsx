import { useMemo } from "react";
import { Dimensions } from "react-native";

export default function useDeviceHeight() {
  return useMemo(() => Dimensions.get("window").height, []);
}
