//
//  ViewController.swift
//  BMIApp
//
//  Created by 山田卓 on 2016/09/19.
//  Copyright © 2016年 TakuYamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightValue: UITextField!
    @IBOutlet weak var weightValue: UITextField!
    @IBAction func nextButton(sender: AnyObject) {        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController2 = segue.destinationViewController as! ViewController2
        viewController2.text1 = heightValue.text
        viewController2.text2 = weightValue.text
    }


}

