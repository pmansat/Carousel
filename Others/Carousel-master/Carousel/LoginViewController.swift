//
//  LoginViewController.swift
//  Carousel
//
//  Created by Tracy Chu on 10/16/15.
//  Copyright © 2015 Tracy Chu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIAlertViewDelegate {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // declare variables
    var scrollViewInitialY: CGFloat!
    var buttonViewInitialY: CGFloat!
    let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize variables
        scrollViewInitialY = scrollView.center.y
        buttonViewInitialY = buttonView.center.y
        
        // Register for keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func keyboardWillShow(notification: NSNotification) {
        
        // adjust view positions
        scrollView.center.y = scrollViewInitialY - 110
        buttonView.center.y = buttonViewInitialY - 110

    }
    
    func keyboardWillHide(notification: NSNotification) {
        scrollView.center.y = scrollViewInitialY
        buttonView.center.y = buttonViewInitialY
        
    }
  
    
    
    
    @IBAction func didTapSignin(sender: AnyObject) {
        
        
        activityIndicator.startAnimating()
        delay(2) {
        self.activityIndicator.stopAnimating()
            
        // create a cancel action
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
        }
            
        // add the cancel action to the alertController
        self.alertController.addAction(cancelAction)

        self.presentViewController(self.alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
            }
            
        self.performSegueWithIdentifier("loginSegue", sender: nil)
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
