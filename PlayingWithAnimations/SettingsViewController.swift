//
//  SettingsViewController.swift
//  PlayingWithAnimations
//
//  Created by Derek on 7/1/17.
//  Copyright © 2017 DboTheGoat. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onExit(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
