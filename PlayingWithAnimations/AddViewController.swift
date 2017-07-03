//
//  AddViewController.swift
//  PlayingWithAnimations
//
//  Created by Derek on 7/1/17.
//  Copyright © 2017 DboTheGoat. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    weak var customDelegate: ReloadAnimationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logo.image = UIImage(named: "goat-icon")?.withRenderingMode(.alwaysTemplate)
        self.logo.tintColor = UIColor.white
        
        //make textfield editable
        self.textField.becomeFirstResponder()
    }
    
    @IBAction func dismissPopup(_ sender: UIButton) {
        if let del = customDelegate {
            del.reloadAnimation()
        } else {
            print("Delegate not set")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSave(_ sender: Any) {
        SharedInstance.share.save(itemToSave: textField.text!.description)
    
        if let del = customDelegate {
            del.reloadAnimation()
        } else {
            print("Delegate not set")
        }
        
        dismiss(animated: true, completion: nil)
    }
}

protocol ReloadAnimationDelegate: class {
    func reloadAnimation()
}
