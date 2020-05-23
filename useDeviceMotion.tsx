import { useState, useEffect } from "react";
import { DeviceMotionMeasurement, DeviceMotion } from "expo-sensors";

export default function useDeviceMotion() {
  const [data, setData] = useState<DeviceMotionMeasurement>();

  DeviceMotion.setUpdateInterval(16);

  useEffect(() => {
    const sub = DeviceMotion.addListener(setData);
    return () => {
      sub.remove();
    };
  }, []);

  return data;
}
