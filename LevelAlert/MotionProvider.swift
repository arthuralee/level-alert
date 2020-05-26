//
//  Motion.swift
//  LevelAlert
//
//  Created by Arthur Lee on 5/24/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import Foundation
import CoreMotion

class MotionProvider {
    private var motion = CMMotionManager()
    var didUpdate: ((Double?) -> Void)?
    private var lpf = LPF(alpha: 0.8)
    private var timer: Timer!
    
    init(didUpdate: @escaping ((Double?) -> Void)) {
        self.didUpdate = didUpdate
        self.startSensor()
    }
    
    func startSensor() {
        guard motion.isDeviceMotionAvailable else {
            return
        }

        motion.deviceMotionUpdateInterval = 1 / 60.0
        motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
        
        self.timer = Timer(fire: Date(), interval: 1 / 60.0, repeats: true,
                           block: { (timer) in
                            if let data = self.motion.deviceMotion {
                                if let callback = self.didUpdate {
                                    callback(self.lpf.next(data.attitude.pitch));
                                }
                            }
        })
        RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
    }
    
}
