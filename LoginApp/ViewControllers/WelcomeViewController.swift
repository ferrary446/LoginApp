//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Ilya Yushkov on 29.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var helloLabel: UILabel!
    
    var userNameLabel: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        helloLabel.text = "Welcome, \(userNameLabel.person.fullName)!"
    }

}
