import useDeviceMotion from "./useDeviceMotion";
import { useMemo } from "react";
import LPF from "./LPF";

export default function useFilteredBetaAngle() {
  const data = useDeviceMotion();
  const lpf = useMemo(() => {
    return new LPF(0.7);
  }, []);

  return data ? lpf.next(-data.rotation.beta) : 0;
}
