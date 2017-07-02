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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.logo.image = UIImage(named: "goat-icon")?.withRenderingMode(.alwaysTemplate)
        self.logo.tintColor = UIColor.white
        
        //make textfield editable
        self.textField.becomeFirstResponder()
    }
    
    @IBAction func dismissPopup(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSave(_ sender: Any) {
        
    }
}
