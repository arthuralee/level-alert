import React, { useRef, useMemo } from "react";
import { StyleSheet, Text, View, Dimensions, Animated } from "react-native";
import LPF from "./LPF";
import useDeviceMotion from "./useDeviceMotion";

function Bubble() {
  return (
    <View
      style={{
        backgroundColor: "black",
        width: 50,
        height: 50,
        borderRadius: 25,
      }}
    />
  );
}

export default function Level() {
  const data = useDeviceMotion();
  const animPos = useRef(new Animated.Value(0)).current;
  const lpf = useMemo(() => {
    return new LPF(0.7);
  }, []);

  const h = Math.round(Dimensions.get("window").height / 2 - 50);

  if (data) {
    const translateY = h * lpf.next(-data.rotation.beta);
    animPos.setValue(translateY);
  }

  return (
    <View style={styles.container}>
      <Animated.View
        style={{
          transform: [
            {
              translateY: animPos,
            },
          ],
        }}
      >
        <Bubble />
      </Animated.View>
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
