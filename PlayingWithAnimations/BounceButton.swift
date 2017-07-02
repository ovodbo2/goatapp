//
//  BounceButton.swift
//  PlayingWithAnimations
//
//  Created by Derek on 7/1/17.
//  Copyright © 2017 DboTheGoat. All rights reserved.
//

import UIKit

class BounceButton: UIButton {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.transform = .identity
        }, completion: nil)
        
        
        //set back to default since were overriding touches begin event
        super.touchesBegan(touches, with: event)
    }
}
