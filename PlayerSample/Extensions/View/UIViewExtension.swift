//
//  UIViewExtension.swift
//  PlayerSample
//
//  Created by Fabrício Masiero on 23/06/20.
//  Copyright © 2020 Fabrício Masiero. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = .zero
        layer.shadowRadius = 8.0
        layer.cornerRadius = 6.0
    }
    
    public func addParallax(size: CGFloat) {
        let motionEffectHorizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        motionEffectHorizontal.minimumRelativeValue = -size
        motionEffectHorizontal.maximumRelativeValue = size
        
        let motionEffectVertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        motionEffectVertical.minimumRelativeValue = -size
        motionEffectVertical.maximumRelativeValue = size
        
        let groupMotionEffects = UIMotionEffectGroup()
        groupMotionEffects.motionEffects = [motionEffectHorizontal, motionEffectVertical]
        addMotionEffect(groupMotionEffects)
    }
    public func pulse() {
        
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")

        animation.values = [0.9, 0.95, 0.9]
        animation.keyTimes = [0, 0.5, 1]
        animation.duration = 2
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: "pulse")
    }
    
    func redimensione(to size: CGFloat) {
        layer.removeAllAnimations()
        UIView.animate(withDuration: 0.5, delay: 0.25, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(scaleX: size, y: size)
        }, completion: nil)
    }
}

