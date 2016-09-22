//
//  ViewController.swift
//  StopWatchApp
//
//  Created by 山田卓 on 2016/08/12.
//  Copyright © 2016年 TakuYamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var startTime: NSTimeInterval? = nil
    var timer: NSTimer?
    var elapsedTime: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        setButtonEnabled(true, stop: false, reset: false)
        
        // Dispose of any resources that can be recreated.
    }
    
    func setButtonEnabled(start: Bool, stop:Bool, reset:Bool){
        self.startButton.enabled = start
        self.stopButton.enabled = stop
        self.resetButton.enabled = reset

    }
    
    func update(){
        if let t = self.startTime {
            let time: Double = NSDate.timeIntervalSinceReferenceDate() - t + self.elapsedTime
            let sec: Int = Int(time)
            let msec: Int = Int((time - Double(sec)) * 100.0)
            self.timerLabel.text = NSString(format: "%02d:%02d:%02d", sec/60, sec/60, msec) as String //EM出現のため"as String"追記
        }
    
    }

    @IBAction func startTimer(sender: AnyObject) {
        setButtonEnabled(false, stop: true, reset: false)
        self.startTime = NSDate.timeIntervalSinceReferenceDate()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }//EM出現のため"Selector("update")"➡︎"#selector(ViewController.update)"変更
    
    @IBAction func stopTimer(sender: AnyObject) {
        if let t = self.startTime{
            self.elapsedTime += NSDate.timeIntervalSinceReferenceDate() - t
            setButtonEnabled(true, stop: false, reset: true)
            
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    @IBAction func resetTimer(sender: AnyObject) {
        self.elapsedTime = 0.0
        setButtonEnabled(true, stop: false, reset: false)
        self.timerLabel.text = "00:00:00"
    }
    

}

