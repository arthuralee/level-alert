import React, { useRef } from "react";
import { StyleSheet, View, Dimensions, Animated, Text } from "react-native";
import Bubble from "./Bubble";
import useFilteredBetaAngle from "./useFilteredBetaAngle";

export default function Level() {
  const beta = useFilteredBetaAngle();
  const animPos = useRef(new Animated.Value(0)).current;
  const h = Math.round(Dimensions.get("window").height / 2 - 50);
  animPos.setValue(beta);

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
                  outputRange: [-h, h],
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
