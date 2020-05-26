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
    
    let angleLabelMargin: CGFloat = 25.0
    
    private var mCircleView: UIView!
    private var mBigCircleView: UIView!
    private var mAngleLabelRight: AngleLabel!
    private var mAngleLabelLeft: AngleLabel!
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
        
        mAngleLabelRight = AngleLabel(frame: CGRect.zero)
        mAngleLabelRight.transform = CGAffineTransform(rotationAngle: -1 * .pi / 2.0)
        self.view.addSubview(mAngleLabelRight)
        
        mAngleLabelLeft = AngleLabel(frame: CGRect.zero)
        mAngleLabelLeft.transform = CGAffineTransform(rotationAngle: .pi / 2.0)
        self.view.addSubview(mAngleLabelLeft)
    }
    
    static func configureCircleView(size: CGFloat) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        view.layer.cornerRadius = size / 2
        view.clipsToBounds = true
        return view
    }
    
    override func viewWillLayoutSubviews() {
        mAngleLabelRight.sizeToFit()
        mAngleLabelLeft.sizeToFit()
        
        let pxFromCenter = mBigCircleView.frame.size.width / 2 + angleLabelMargin
        
        mAngleLabelRight.frame.origin = CGPoint(x: self.view.frame.midX + pxFromCenter, y: self.view.center.y - mAngleLabelRight.frame.height / 2)
        mAngleLabelLeft.frame.origin = CGPoint(x: self.view.frame.midX - pxFromCenter - mAngleLabelLeft.frame.width, y: self.view.center.y - mAngleLabelLeft.frame.height / 2)
        
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
        self.mCircleView.alpha = CGFloat(min(1.0, abs(angle) / 0.1))
        
        self.mAngleLabelRight.setAngle(angle)
        self.mAngleLabelLeft.setAngle(angle)
    }
}
