//
//  ViewController.swift
//  PlayingWithAnimations
//
//  Created by Derek on 6/29/17.
//  Copyright © 2017 DboTheGoat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ReloadAnimationDelegate, ReloadAnimationDelegate2 {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var homeButton: DesignableButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.isHidden = true
        
        homeButton.isHidden = true
        
        //make navbar clear
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        
//        self.homeButton.image = UIImage(named: "goat-icon")?.withRenderingMode(.alwaysTemplate)
//        self.homeButton.tintColor = UIColor.white
        
        self.homeButton.setImage(UIImage(named: "goat-icon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.homeButton.tintColor = UIColor.white
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        animateTableCells()
    }
    
    func reloadAnimation() {
        animateTableCells()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addnew" {
            let AddViewController = segue.destination as! AddViewController
            AddViewController.customDelegate = self
        } else if segue.identifier == "settings" {
            let SettingsViewController = segue.destination as! SettingsViewController
            SettingsViewController.customDelegate2 = self
        }
    }
    
    func animateTableCells() {
        
        tableView.isHidden = false
        homeButton.isHidden = false
        
        homeButton.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        UIView.animate(withDuration: 1.5) {
            self.homeButton.transform = .identity
        }
        
        let cells = tableView.visibleCells
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: view.frame.height, y: 0)
        }
        
        var delay = 0.2
        for cell in cells {
            UIView.animate(withDuration: 0.5, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = .identity
            })
            
            delay += 0.1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedInstance.share.dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = SharedInstance.share.dummyData[indexPath.row]
        cell.textLabel?.font = UIFont(name: "AvenirNext-Bold", size: 25)
//        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.textLabel?.textColor = UIColor(red: 63/255, green: 101/255, blue: 179/255, alpha: 1)
        cell.layer.cornerRadius = 20
        cell.textLabel?.textAlignment = .center
        cell.layer.borderColor = UIColor(red: 63/255, green: 101/255, blue: 179/255, alpha: 1).cgColor
        cell.layer.borderWidth = 0.5
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = UIColor.clear
//        
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 500, height: 50))
//        label.text = "Your Goat List"
//        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
//        label.textColor = UIColor.black
//        label.textAlignment = .center
//        label.clipsToBounds = true
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(label)
//        return view
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "The Goat"
//    }
}

