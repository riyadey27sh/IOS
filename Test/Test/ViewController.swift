//
//  ViewController.swift
//  Test
//
//  Created by Apple Lab 17 on 23/09/26.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true
    
    @IBOutlet var nameTextFeild: UITextField!
    
    @IBOutlet var emailTextFeild: UITextField!
    
    @IBOutlet var mobileTextFeild: UITextField!
    
    @IBOutlet var formSubmit: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var userHeading: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!
    @IBOutlet var feedback: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
    fileprivate func updateUI() {
        if lightOn {
            view.backgroundColor = .white
            label1.textColor = .black
            label2.textColor = .black
            label3.textColor = .black
            label4.textColor = .black
            label5.textColor = .black
            label6.textColor = .black
            userHeading.textColor = .black
             
            
        } else {
            view.backgroundColor = .black
            label1.textColor = .white
            label2.textColor = .white
            label3.textColor = .white
            label4.textColor = .white
            label5.textColor = .white
            label6.textColor = .white
            feedback.textColor = .white
            
            userHeading.textColor = .white
        }
    }
    
    @IBAction func darkMode(_ sender: UISwitch) {
        lightOn = sender.isOn
        
        updateUI()
    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        
        let name = nameTextFeild.text ?? ""
        let email = emailTextFeild.text ?? ""
        let number = mobileTextFeild.text ?? ""
        
        if email.isEmpty || name.isEmpty || number.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please fill all the fields", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            present(alert, animated: true)
        }
        
        
        
        print("User Information")
        print("Name = \(name)")
        print("Email = \(email)")
        print("Mobile Number = \(number)")
        
        nameTextFeild.text = ""
        emailTextFeild.text = ""
        mobileTextFeild.text = ""
        
        if name.isEmpty || email.isEmpty || number.isEmpty {
            formSubmit.text = "Please fill all the fields!"
        }
        
        if !name.isEmpty && !email.isEmpty && !number.isEmpty {
            formSubmit.text = "Form submitted successfully! " + "WelCome \(name)"
            
        }
        
    }
    
    
    
    

        
}

