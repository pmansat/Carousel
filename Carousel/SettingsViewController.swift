//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Promeet Mansata on 10/18/15.
//  Copyright © 2015 Promeet Mansata. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        scrollView.contentSize = imageView.image!.size
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }



}
