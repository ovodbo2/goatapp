//
//  DesignableButton.swift
//  PlayingWithAnimations
//
//  Created by Derek on 7/1/17.
//  Copyright © 2017 DboTheGoat. All rights reserved.
//

import UIKit

@IBDesignable class DesignableButton: BounceButton {
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth;
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
