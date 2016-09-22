//
//  ViewController2.swift
//  BMIApp
//
//  Created by 山田卓 on 2016/09/19.
//  Copyright © 2016年 TakuYamada. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var resultValue: UITextField!
    var text1: String?
    var text2: String?
    var myHeight: Double = 179.0
    var myWeight: Double = 72.0
    
    override func viewDidLoad() {
        myHeight = (text1! as NSString).doubleValue
        myWeight = (text2! as NSString).doubleValue
        let myHeightMeter = myHeight / 100
        var myBMI = myWeight / (myHeightMeter * myHeightMeter)
        myBMI = Double(myBMI)
        
        resultValue.text = String(myBMI)
        
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
