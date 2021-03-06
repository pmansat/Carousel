//
//  SignInViewController.swift
//  Carousel
//
//  Created by Promeet Mansata on 10/17/15.
//  Copyright © 2015 Promeet Mansata. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    
// define vars
    
    var initialY: CGFloat!
    let offset: CGFloat = -10
    
 
// define outlets
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
        @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
let alertController = UIAlertController(title: "Incorrect", message: "Please enter username and password", preferredStyle: .Alert)

    // define functions

    
    
    @IBAction func editingDidBegin(sender: AnyObject) {
        scrollView.contentOffset.y = 10
        loginButton.transform = CGAffineTransformMakeTranslation(10, 20)
        
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            self.containerView.frame.origin = CGPoint(x: self.containerView.frame.origin.x, y: self.initialY + self.offset)
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    

    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            // self.containerView.frame.origin = CGPoint(x: self.containerView.frame.origin.x, y: self.initialY + self.offset)
            self.containerView.frame.origin = CGPoint(x: self.containerView.frame.origin.x, y: self.initialY)
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    

    
    @IBAction func whenButtomPressed(sender: AnyObject) {
        if username.text!.isEmpty ||  password.text!.isEmpty {
           let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
                       presentViewController(alertController, animated: true) {
            }
        }
        else {
            if username.text! == "promeet" &&  password.text! == "welcome"   {
                activityIndicator.startAnimating()
                delay(2) {
                    self.activityIndicator.stopAnimating()}
                performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }


    @IBAction func onTap(sender: AnyObject) {
        username.endEditing(true)
        password.endEditing(true)
          }
    
       override func viewDidLoad() {
        super.viewDidLoad()
        initialY = username.frame.origin.y
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}







