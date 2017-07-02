//
//  ViewController.swift
//  PlayingWithAnimations
//
//  Created by Derek on 6/29/17.
//  Copyright © 2017 DboTheGoat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = SharedInstance.share.dummyData[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 20)
//        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.textLabel?.textColor = UIColor.red
        return cell
        
    }
}

