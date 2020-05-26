//
//  LPF.swift
//  LevelAlert
//
//  Created by Arthur Lee on 5/24/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import Foundation

class LPF {
    private var alpha: Double = 0.5
    private var buffer: [Double] = []
    private var bufferSize: Int = 10

    init(alpha: Double?) {
        if let setAlpha = alpha {
            self.alpha = setAlpha
        }
    }
    
    private func appendToBuffer(_ value: Double) {
        buffer.append(value)
        if (buffer.count > self.bufferSize) {
            buffer.removeFirst()
        }
    }
    
    func next(_ nextValue: Double) -> Double {
        var result = nextValue
        
        if (self.buffer.count > 0) {
            let avg = self.buffer.reduce(0) { (acc, curr) -> Double in acc + curr } / Double(self.buffer.count)
            result = self.alpha * avg + (1 - self.alpha) * nextValue
        }
        self.appendToBuffer(result)
        
        return result
    }
}
