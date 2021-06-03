//
//  ViewController.swift
//  LoginApp
//
//  Created by Ilya Yushkov on 29.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    // MARK: - Private properties
    private let user = User.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        userNameTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        passwordTextField.enablesReturnKeyAutomatically = true
        
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.userNameLabel = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! AboutMeViewController
                userInfoVC.user = user
            }
        }
    }
    
    private func controlData() {
        
        guard let userName = userNameTextField.text, !userName.isEmpty else {
            showAlert(with: "User name is empty", and: "Please enter the username!")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(with: "Password is empty", and: "Please enter the password!")
            return
        }
        
        if !(userName == "Ilya") || !(password == "Password") {
            showAlert(with: "Wrong data!", and: "Incorrect login or password")
            self.passwordTextField.text = ""
        }
        
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    // MARK: - IBActions
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        switch sender.tag {
        
        case 0:
            
            showAlert(with: "Oops!", and: "Your username is Ilya 😉")
            
        case 1:
            
            showAlert(with: "Oops!", and: "Your password is Password 😉")
            
        default:
            
            controlData()
        }
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        
        userNameTextField.text = nil
        passwordTextField.text = nil
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    private func showAlert(with title: String, and message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            controlData()
        }
        return true
    }
}
