//
//  RegisterOneViewController.swift
//  trussApp
//
//  Created by Monal mahajan on 3/18/21.
//

import UIKit
import SPAlert

class RegisterOneViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var purdueEmailField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let purdueEmail = purdueEmailField.text!
        let email = emailField.text!
        let password = passwordField.text!
        if (email.isEmpty || password.isEmpty) {
            SPAlert.present(title: "Please fill the fields", preset: .error)
            self.dismiss(animated: true, completion:nil)
        }
        if (isValidEmail(email) && purdueEmail.isEmpty ? true : isValidEmail(purdueEmail)) {
            SPAlert.present(title: "Succesfully Registered", preset: .done)
            self.performSegue(withIdentifier: "registerTwoSeque", sender: nil)
        } else if (!isValidPassword(password)) {
            SPAlert.present(title: "Please enter a strong password", preset: .error)
            self.dismiss(animated: true, completion:nil)
        } else {
            SPAlert.present(title: "Incorrect email entered", preset: .error)
            self.dismiss(animated: true, completion:nil)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordReGex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"

        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordReGex)
        return passwordPred.evaluate(with: password)
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
