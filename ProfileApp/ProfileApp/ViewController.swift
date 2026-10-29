//
//  ViewController.swift
//  ProfileApp
//
//  Created by Apple Lab 17 on 24/09/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var nameText: UITextField!
    @IBOutlet var deptLabel: UILabel!
    @IBOutlet var deptText: UITextField!
    @IBOutlet var editsavebutton: UIButton!
    
    @IBOutlet var grad: UILabel!
    
    @IBOutlet var year: UITextField!
    // STATE VARIABLE
    var isEditingMode: Bool=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureIntitialUI()
    }
    
    private func configureIntitialUI(){
        name.text="Riya Dey"
        deptLabel.text="PRN: 245100067 | Branch: CSE(A)"
        grad.text="Graduation Year: 2028"
        
        
//        HIDDING EDIT FIELDS
        nameText.isHidden=true
        deptText.isHidden=true
        year.isHidden=true
        
//        IMAGE STYLING
        profileImg.layer.cornerRadius=profileImg.frame.width/2
        profileImg.clipsToBounds=true
    }

    @IBAction func editSaveButtonSaved(_ sender: UIButton) {
        if isEditingMode{
            if let newName=nameText.text, !newName.trimmingCharacters(in: .whitespaces).isEmpty{
                name.text=newName
            }
            if let newDept=deptText.text, !newDept.trimmingCharacters(in: .whitespaces).isEmpty{
                deptLabel.text=newDept
            }
            if let newYear=year.text, !newYear.trimmingCharacters(in: .whitespaces).isEmpty{
                grad.text=newYear
            }
            nameText.resignFirstResponder()
            deptText.resignFirstResponder()
            year.resignFirstResponder()

            nameText.isHidden=true
            deptText.isHidden=true
            year.isHidden=true
            name.isHidden=false
            deptLabel.isHidden=false
            grad.isHidden=false
            editsavebutton.setTitle("Edit Profile", for: .normal)
            isEditingMode=false
        }
        else{
            nameText.text=name.text
            deptText.text=deptLabel.text
            year.text=grad.text
//            SHOW TEXTFIELDS N HIDE LABELS
            nameText.isHidden=false
            deptText.isHidden=false
            year.isHidden=false
            
            name.isHidden=true
            deptLabel.isHidden=true
            grad.isHidden=true
            editsavebutton.setTitle("Save Profile", for: .normal)
            isEditingMode=true
        }
    }
    
}

