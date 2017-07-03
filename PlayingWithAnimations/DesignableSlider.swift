//
//  DesignableSlider.swift
//  PlayingWithAnimations
//
//  Created by Derek on 7/3/17.
//  Copyright © 2017 DboTheGoat. All rights reserved.
//

import UIKit

@IBDesignable class DesignableSlider: UISlider {
    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setThumbImage(thumbImage, for: .normal)
        }
    }
    
    @IBInspectable var highlightedThumbImage: UIImage? {
        didSet {
            setThumbImage(highlightedThumbImage, for: .highlighted)
        }
    }
}
