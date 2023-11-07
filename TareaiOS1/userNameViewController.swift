//
//  userNameViewController.swift
//  TareaiOS1
//
//  Created by Raul  Burrieza Garcia on 6/11/23.
//

import UIKit

class userNameViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func didTapOnButton(_ sender: UIButton) {
            saveLocalUser()
    }
    
    func saveLocalUser(){
        let userName = userNameTextField.text
        UserDefaults.standard.set(userName,forKey: "userName")
    }
    
}
