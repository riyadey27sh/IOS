//
//  ViewController.swift
//  SimpleForm
//
//  Created by Apple Lab 17 on 10/09/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text="Fill the form and press Submit."
    }

    @IBAction func submitButton(_ sender: UIButton) {
        nameTextField.resignFirstResponder()
//        AS TO DISMISS KEYBOARD WHEN SUBMIT IS CLICKED
        guard let enteredText = nameTextField.text, !enteredText.trimmingCharacters(in: .whitespaces).isEmpty else {
            result.text = "Name is required"
            return
        }
        
        result.textColor = .systemBlue
        result.text = "Hello \(enteredText)!"
    }
    
}

