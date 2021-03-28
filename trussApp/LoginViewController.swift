//
//  LoginViewController.swift
//  trussApp
//
//  Created by Monal mahajan on 3/18/21.
//

import UIKit
import SPAlert

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
         
        let username = usernameField.text!.uppercased()
        let password = passwordField.text!
        if (!usernameField.text!.isEmpty && !passwordField.text!.isEmpty) {
            if (username == "MONAL" && password == "truss") {
                SPAlert.present(title: "Logging in...", preset: .done)
                self.performSegue(withIdentifier: "loginToHome", sender: nil)
            } else {
                SPAlert.present(title: "Incorrect Credentials ", preset: .error)
                self.dismiss(animated: true, completion:nil)
            }
        } else if (usernameField.text!.isEmpty && passwordField.text!.isEmpty) {
            SPAlert.present(title: "Nothing entered ", preset: .error)
            self.dismiss(animated: true, completion:nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
