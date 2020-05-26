//
//  AngleLabel.swift
//  LevelAlert
//
//  Created by Arthur Lee on 5/25/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import UIKit

class AngleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        self.font = UIFont.systemFont(ofSize: 40, weight: .light)
        self.textColor = UIColor.init(white: 0.6, alpha: 1)
    }
    
    private func roundDouble(_ val: Double, precisionDp: Int) -> Double {
        let exp = pow(10, Double(precisionDp))
        return round(val * exp) / exp
    }
    
    private func formatAngle(_ angle: Double) -> String {
        let deg = (abs(angle) / .pi) * 180
        return deg < 10 ? String(roundDouble(deg, precisionDp: 1)) : String(Int(round(deg)))
    }
    
    func setAngle(_ angle: Double) {
        self.text = formatAngle(angle) + "º"
    }
        
}
