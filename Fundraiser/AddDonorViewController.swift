//
//  AddDonorViewController.swift
//  Fundraiser
//
//  Created by Samuel Shih on 2/20/15.
//  Copyright (c) 2015 derrickor. All rights reserved.
//

import UIKit
import Parse

class AddDonorViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
//    var donors: [PFObject]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        submitButton.enabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSubmitButton(sender: AnyObject) {
        
        var donor = PFObject(className: "Donor")
        
        donor["name"] = nameField.text
        donor["phoneNumber"] = phoneField.text
        donor["user"] = PFUser.currentUser()
        
        donor.saveInBackgroundWithBlock { (success: Bool, error: NSError!) -> Void in
            println("Saved the donor attributes")
        }
        
        navigationController!.popViewControllerAnimated(true)
        
//        donors.append(donor)
    }
    
    
    @IBAction func editingChangedNameField(sender: AnyObject) {
        if (nameField.text.isEmpty == true || phoneField.text.isEmpty == true) {
            submitButton.enabled = false
        }
        else {
            submitButton.enabled = true
        }
    }
    

    
    @IBAction func editingChangedPhoneNumber(sender: AnyObject) {
        
        if (nameField.text.isEmpty == true || phoneField.text.isEmpty == true) {
            submitButton.enabled = false
        }
        else {
            submitButton.enabled = true
        }
    }
    
    
    
    // Gets the donors
 
    
    // MARK: - Navigation

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        var donorsViewController: DonorsViewController = segue.destinationViewController as DonorsViewController
//        donorsViewController.receivedDonors = donors
//    }

}
