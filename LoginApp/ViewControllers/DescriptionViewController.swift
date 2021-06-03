//
//  DescriptionViewController.swift
//  LoginApp
//
//  Created by Ilya Yushkov on 01.06.2021.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = user.person.description.description
        fullNameLabel.text = user.person.fullName
    }

}
