//
//  LoginScreenViewController.swift
//  Fundraiser
//
//  Created by Samuel Shih on 2/20/15.
//  Copyright (c) 2015 derrickor. All rights reserved.
//

import UIKit
import Parse

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var username: String = "sam"
    var password: String = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLoginButton(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(emailField.text, password: passwordField.text) { (success: PFUser!, error: NSError!) -> Void in
            if error == nil {
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                
            }
            else {
                var alert = UIAlertView(title: "Oops", message: "The email or password you entered is incorreect!", delegate: nil, cancelButtonTitle: "Ok")
                alert.show()

            }
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
