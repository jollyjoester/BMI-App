//
//  ViewController.swift
//  NameScoreApp
//
//  Created by 山田卓 on 2016/08/14.
//  Copyright © 2016年 TakuYamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultViewController: ResultViewController = segue.destinationViewController as! ResultViewController
        resultViewController.myName = self.textField.text!
    }


}

