import React, { useRef } from "react";
import { StyleSheet, View, Animated } from "react-native";
import Bubble from "./Bubble";
import useDeviceHeight from "./useDeviceHeight";

export default function Level({ angle }: { angle: number }) {
  const deviceHeight = useDeviceHeight();
  const animPos = useRef(new Animated.Value(0)).current;
  const animBounds = Math.round(deviceHeight / 2 - 50);
  animPos.setValue(angle);

  return (
    <View style={styles.container}>
      <Animated.View
        style={[
          styles.bubble,
          {
            zIndex: 1,
            opacity: animPos.interpolate({
              inputRange: [-0.1, 0, 0.1],
              outputRange: [1, 0, 1],
            }),
            transform: [
              {
                translateY: animPos.interpolate({
                  inputRange: [-Math.PI / 2, Math.PI / 2],
                  outputRange: [-animBounds, animBounds],
                }),
              },
            ],
          },
        ]}
      >
        <Bubble size={70} color="black" />
      </Animated.View>
      <View style={styles.bubble}>
        <Bubble size={90} color="#ccc" />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  bubble: {
    position: "absolute",
  },
});
