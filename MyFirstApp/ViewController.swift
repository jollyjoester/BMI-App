//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 山田卓 on 2016/08/06.
//  Copyright © 2016年 TakuYamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mylabel: UILabel!
    @IBAction func changelabel(sender: AnyObject) {
        mylabel.text = "Hallow World"
    }
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue){}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

