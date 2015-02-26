//
//  CampaignViewController.swift
//  Fundraiser
//
//  Created by Derrick Or on 2/25/15.
//  Copyright (c) 2015 derrickor. All rights reserved.
//

import UIKit

class CampaignViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var AskButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contributorsView: UIView!
    var lastScrollPos: CGFloat! = 0
    var topViewOriginalPos: CGFloat! = 0
    
    @IBOutlet weak var topView: UIView!
    
    @IBAction func swipeLeft(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AskButton.layer.cornerRadius = 4
        AskButton.layer.borderColor = UIColor.whiteColor().CGColor
        AskButton.layer.borderWidth = 1
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        
        topViewOriginalPos = self.topView.center.y

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        
        //scrolling down
        if(self.lastScrollPos < scrollView.contentOffset.y - 70) {
            UIView.animateWithDuration(0.2, delay: 0.0, options: nil, animations: {
                self.contributorsView.hidden = false
                self.topView.center.y = self.topView.center.y - scrollView.contentOffset.y * 0.2
            }, completion: nil)
            self.lastScrollPos = scrollView.contentOffset.y
        }
        
        if(self.lastScrollPos >  scrollView.contentOffset.y + 70) {
            UIView.animateWithDuration(0.2, delay: 0.0, options: nil, animations: {
                self.contributorsView.hidden = true
                self.topView.center.y = self.topViewOriginalPos
            }, completion: nil)
            
            self.lastScrollPos = scrollView.contentOffset.y
        }
        
        //var offset = scrollView.contentOffset
        //self.AskButton.center.y = self.AskButton.center.y + 1
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
