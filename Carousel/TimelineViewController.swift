//
//  TimelineViewController.swift
//  Carousel
//
//  Created by Promeet Mansata on 10/18/15.
//  Copyright © 2015 Promeet Mansata. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ScrollView: UIScrollView!
    
    override func viewDidLoad() {
               ScrollView.contentSize = imageView.image!.size
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
