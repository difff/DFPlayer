//
//  Extensions.swift
//  DFPlayer
//
//  Created by Difff on 16/10/21.
//  Copyright © 2016年 Difff. All rights reserved.
//

import UIKit

extension UIView {
    func df_addSubviews(subviews: [UIView]) {
        for view in subviews {
            self.addSubview(view)
        }
    }
    
    func df_addSubViewEquirotal(subview: UIView) {
        self.addSubview(subview)
        subview.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    // increase width/height of hot spot to 80 pixel
    func df_containsPoint(bounds: CGRect, point: CGPoint) -> Bool {
        let widthDelta = fmax(80 - bounds.width, 0)
        let heightDelta = fmax(80 - bounds.height, 0)
        return CGRectContainsPoint(CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta), point)
    }
}

extension Int {
    func df_toHourFormat() -> String {
        let hour = self/3600
        let minute = self%3600/60
        let second = self%3600%60
        
        if (hour > 0) {
            return String(format: "%02d:%02d:%02d", hour, minute, second)
        } else {
            return String(format: "%02d:%02d", minute, second)
        }
    }
}

extension UIDevice {
    
    class func df_isLandscape() -> Bool {
        return UIDevice.currentDevice().orientation == .LandscapeLeft
            || UIDevice.currentDevice().orientation == .LandscapeRight
    }
    
    class func df_isPortrait() -> Bool {
        return UIDevice.currentDevice().orientation == .Portrait
            || UIDevice.currentDevice().orientation == .PortraitUpsideDown
    }
    
    
    class func df_toLandscape() {
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeRight.rawValue, forKey: "orientation")
        if let rootCtrl = UIApplication.sharedApplication().keyWindow?.rootViewController {
            RootCtrlSettings.prefersStatusBarHidden = true
            rootCtrl.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    class func df_toPortrait() {
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.Portrait.rawValue, forKey: "orientation")
        if let rootCtrl = UIApplication.sharedApplication().keyWindow?.rootViewController {
            RootCtrlSettings.prefersStatusBarHidden = false
            rootCtrl.setNeedsStatusBarAppearanceUpdate()
        }
    }
}




