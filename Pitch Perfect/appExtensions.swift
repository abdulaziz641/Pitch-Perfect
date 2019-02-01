//
//  App Extensions.swift
//  Pitch Perfect
//
//  Created by Abdulaziz Alsaloum on 09/11/2018.
//  Copyright © 2018 Abdulaziz. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    // simple animation for the button
    // this simple animation was found in the below URL:
    //
    func startAnimation() {
        self.isUserInteractionEnabled = true
        self.isEnabled = true
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 1.0
        pulse.toValue = 1.12
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 0.1
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 2.7
        animationGroup.repeatCount = 1000
        animationGroup.animations = [pulse]
        
        self.layer.add(animationGroup, forKey: "pulse")
    }
}
