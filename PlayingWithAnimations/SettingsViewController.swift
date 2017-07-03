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
    @IBOutlet weak var rateSlider: UISlider!
    @IBOutlet weak var pitchSlider: UISlider!
    
    weak var customDelegate2: ReloadAnimationDelegate2?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
//        self.logo.image = UIImage(named: "goat-icon")?.withRenderingMode(.alwaysTemplate)
//        self.logo.tintColor = UIColor.white
    }
    
    @IBAction func onExit(_ sender: UIButton) {
        if let del = customDelegate2 {
            del.reloadAnimation()
        } else {
            print("Delegate not set")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SharedInstance.share.voices.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        let attributedString = NSAttributedString(string: "Test Name", attributes: [NSForegroundColorAttributeName : UIColor.white])
//        
//        return attributedString
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.font = UIFont(name: "AvenirNext-Medium", size: 30)
        pickerLabel.text = SharedInstance.share.voices[row].name.description
        pickerLabel.textColor = UIColor.white
        pickerLabel.textAlignment = .center
        return pickerLabel
    }
    
    @IBAction func onRateSlider(_ sender: UISlider) {
        rateSlider.value = roundf(rateSlider.value)
    }

    @IBAction func onPitchSlider(_ sender: Any) {
        pitchSlider.value = roundf(pitchSlider.value)
    }
}

protocol ReloadAnimationDelegate2: class {
    func reloadAnimation()
}
