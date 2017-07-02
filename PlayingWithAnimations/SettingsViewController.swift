//
//  SettingsViewController.swift
//  PlayingWithAnimations
//
//  Created by Derek on 7/1/17.
//  Copyright © 2017 DboTheGoat. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.logo.image = UIImage(named: "goat-icon")?.withRenderingMode(.alwaysTemplate)
        self.logo.tintColor = UIColor.white
    }
    
    @IBAction func onExit(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        let attributedString = NSAttributedString(string: "Test Name", attributes: [NSForegroundColorAttributeName : UIColor.white])
//        
//        return attributedString
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.font = UIFont(name: "Avenir Next", size: 30)
        pickerLabel.text = "Test"
        pickerLabel.textColor = UIColor.white
        pickerLabel.textAlignment = .center
        return pickerLabel
    }
}
