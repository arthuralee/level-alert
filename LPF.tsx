export default class LPF {
  alpha: number = 0.5;
  buffer: number[] = [];
  bufferSize: number = 10;

  constructor(alpha?: number) {
    if (alpha) {
      this.alpha = alpha;
    }
  }

  _appendToBuffer(value: number) {
    this.buffer.push(value);
    if (this.buffer.length > this.bufferSize) {
      this.buffer.shift();
    }
  }

  next(nextValue: number) {
    let result = nextValue;

    if (this.buffer.length > 0) {
      const avg =
        this.buffer.reduce((acc, curr) => acc + curr, 0) / this.buffer.length;
      result = this.alpha * avg + (1 - this.alpha) * nextValue;
    }
    this._appendToBuffer(result);
    return result;
  }
}
