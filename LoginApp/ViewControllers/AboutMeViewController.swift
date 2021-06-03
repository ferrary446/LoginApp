//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Ilya Yushkov on 01.06.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = user.person.fullName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let descriptionVC = segue.destination as? DescriptionViewController else { return }
        descriptionVC.user = user
        
    }
    
}
