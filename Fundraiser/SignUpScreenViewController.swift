//
//  SignUpScreenViewController.swift
//  Fundraiser
//
//  Created by Samuel Shih on 2/20/15.
//  Copyright (c) 2015 derrickor. All rights reserved.
//

import UIKit
import Parse

class SignUpScreenViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAccountButton.enabled = false
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCreateAccountButton(sender: AnyObject) {
        
        // Create a user
        var user = PFUser()
        user.username = emailField.text
        user.password = passwordField.text
        
        // name success: and error:
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError!) -> Void in
            
            // If there is an error do something
            if success == true {
                self.dismissViewControllerAnimated(true , completion: { () -> Void in
                    
                })
            }
            else {
                var alert = UIAlertView(title: "Oops!", message: "The username that you entered is already taken", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
        }
    }
    @IBAction func editingChangedEmailField(sender: AnyObject) {
        
        if (emailField.text.isEmpty == true || passwordField.text.isEmpty == true) {
            createAccountButton.enabled = false
        }
        else {
            createAccountButton.enabled = true
        }
        
    }
    
    @IBAction func editingChangedPasswordField(sender: AnyObject) {
        
        if (emailField.text.isEmpty == true || passwordField.text.isEmpty == true) {
            createAccountButton.enabled = false
        }
        else {
            createAccountButton.enabled = true
        }
        
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
