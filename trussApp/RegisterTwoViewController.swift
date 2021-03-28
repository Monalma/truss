//
//  RegisterTwoViewController.swift
//  trussApp
//
//  Created by Monal mahajan on 3/18/21.
//

import UIKit
import SPAlert

class RegisterTwoViewController: UIViewController {
    @IBOutlet weak var privacy: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    static var valTS = false;
    
    @IBOutlet weak var readTS: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = "Click Here for Terms & Conditions."
        if privacy != nil {
            privacy.text = text
            self.privacy.textColor =  UIColor.black
            let underlineAttriString = NSMutableAttributedString(string: text)
            let range1 = (text as NSString).range(of: "Terms & Conditions.")
                    underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
            underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14.0, weight: .regular), range: range1)
                    underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemGreen, range: range1)
            privacy.attributedText = underlineAttriString
            privacy.isUserInteractionEnabled = true
            privacy.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
        }
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func isOnTS(_ sender: Any) {
        if readTS.isOn {
            RegisterTwoViewController.valTS = true
        } else {
            RegisterTwoViewController.valTS = false;
        }
    }
    @IBAction func signUpButton(_ sender: Any) {
        if RegisterTwoViewController.valTS {
            SPAlert.present(title: "Succesfully Registered", preset: .done)
            self.performSegue(withIdentifier: "registerSeque", sender: nil)
        } else {
            SPAlert.present(title: "Please agree to the terms and services", preset: .error)
            self.performSegue(withIdentifier: "termsConditionSeque", sender: nil)
        }
    }
    
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        let text = "Click Here for Terms & Conditions."
       let termsRange = (text as NSString).range(of: "Terms & Conditions")
       // comment for now
       let privacyRange = (text as NSString).range(of: "Privacy Policy")

       if gesture.didTapAttributedTextInLabel(label: privacy, inRange: termsRange) {
            self.performSegue(withIdentifier: "termsConditionSeque", sender: nil)
           print("Tapped terms")
       } else if gesture.didTapAttributedTextInLabel(label: privacy, inRange: privacyRange) {
           print("Tapped privacy")
       } else {
           print("Tapped none")
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

extension UITapGestureRecognizer {

    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)

        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)

        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }

}
