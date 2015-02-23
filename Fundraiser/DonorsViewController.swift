//
//  DonorsViewController.swift
//  Fundraiser
//
//  Created by Samuel Shih on 2/20/15.
//  Copyright (c) 2015 derrickor. All rights reserved.
//

import UIKit
import Parse

class DonorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var donorsTableView: UITableView!
    
//    var donorNames: [String] = [ "Sam","Vinod","Tim","John","Josh"]
    
    var receivedDonors: [PFObject]! = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        donorsTableView.delegate = self
        donorsTableView.dataSource = self
        
        getDonors()
    }
    
    override func viewDidAppear(animated: Bool) {
        getDonors()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return receivedDonors.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var donor = receivedDonors[indexPath.row]
        var name = donor["name"] as String
        var phoneNumber = donor["phoneNumber"] as String

        var cell = donorsTableView.dequeueReusableCellWithIdentifier("donorCell") as DonorCell

        cell.donorName.text = name
        cell.donorPhoneNumber.text = phoneNumber
        
        return cell
    }
    
    func getDonors() {
        var query = PFQuery(className: "Donor")
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock { (donors: [AnyObject]!, error: NSError!) -> Void in
            self.receivedDonors = donors as [PFObject]
            self.donorsTableView.reloadData()
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
