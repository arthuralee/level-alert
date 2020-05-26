//
//  MainViewController.swift
//  LevelAlert
//
//  Created by Arthur Lee on 5/24/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

import UIKit
import CoreMotion

class MainViewController: UIViewController {
    
    let angleLabelMargin: CGFloat = 20.0
    
    private var mCircleView: UIView!
    private var mBigCircleView: UIView!
    private var mAngleLabel: UILabel!
    private var mMotionProvider: MotionProvider!
    private var mHeight: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        mBigCircleView = MainViewController.configureCircleView(size: 90)
        mBigCircleView.backgroundColor = UIColor.init(white: 0.8, alpha: 1)
        mBigCircleView.center = self.view.center
        self.view.addSubview(mBigCircleView)
        
        mCircleView = MainViewController.configureCircleView(size: 70)
        mCircleView.backgroundColor = UIColor.black
        mCircleView.center = self.view.center
        self.view.addSubview(mCircleView)
        
        mAngleLabel = UILabel(frame: CGRect(x:100, y: 100, width:0, height: 0))
        mAngleLabel.font = mAngleLabel.font.withSize(45)
        mAngleLabel.textColor = UIColor.init(white: 0.3, alpha: 1)
        self.view.addSubview(mAngleLabel)
    }
    
    static func configureCircleView(size: CGFloat) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        view.layer.cornerRadius = size / 2
        view.clipsToBounds = true
        return view
    }
    
    override func viewWillLayoutSubviews() {
        mAngleLabel.sizeToFit()
        mAngleLabel.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let pxFromCenter = mBigCircleView.frame.size.width / 2 + angleLabelMargin
        mAngleLabel.frame.origin = CGPoint(x: self.view.frame.midX + pxFromCenter, y: self.view.center.y - mAngleLabel.frame.height / 2)
//        let centerPoint = CGPointMake(mAngleLabel.frame.midX, mAngleLabel.frame.midY)
        mAngleLabel.transform = CGAffineTransform(rotationAngle: -1 * .pi / 2.0)
        
        mHeight = self.view.frame.size.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        mMotionProvider = MotionProvider(didUpdate: { x in
            if let angle = x {
                OperationQueue.main.addOperation {
                    self.updateAngle(angle)
                }
            }
        })
        
    }
    
    func updateAngle(_ angle: Double) {
        let grad = -1 * angle / .pi
        self.mCircleView.transform = CGAffineTransform(translationX: 0, y: CGFloat.init(grad) * mHeight)
        self.mAngleLabel.text = String(abs(Int(round(grad * 180)))) + "º"
    }
}
