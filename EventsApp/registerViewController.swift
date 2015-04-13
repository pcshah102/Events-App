//
//  registerViewController.swift
//  EventsApp
//
//  Created by pcshah on 4/7/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class registerViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    @IBAction func onRegisterButtonTapped(sender: UIButton) {
        if usernameTextField.text == "" || passwordTextField.text == ""
        {
            showAlert("Please enter a  username and password.", nil, self)
        }
        else
        {
          User.registerNewUser(usernameTextField.text, password: passwordTextField.text, completed: { (result, error) -> Void in
            if error != nil
            {
                showAlertWithError(error, self)
            }
            else
            {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
          })
        }
    }
}
