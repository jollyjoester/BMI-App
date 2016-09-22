//
//  ViewController.swift
//  ShingoHananiiro
//
//  Created by 山田卓 on 2016/09/14.
//  Copyright © 2016年 TakuYamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var signalImageView: UIImageView!
    var blueImage:UIImage!
    var yellowImage:UIImage!
    var redImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        UIImageの imageNamed: メソッドを使って画像を設定
        blueImage = UIImage(named:"signal_blue.png")
        yellowImage = UIImage(named:"signal_yellow.png")
        redImage = UIImage(named:"signal_red.png")
        
//        UIImageViewのimageプロパティを使ってredImageを設定
        signalImageView.image = redImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func blueBtnPushed(sender: AnyObject) {
        resultLabel.textColor = UIColor.blueColor()
//        信号についての判定処理
        if signalImageView.image == blueImage{
            resultLabel.text = "せいかい！"
        }else{
            resultLabel.text = "まちがい！"
        }
//        メソッドの実行
        randomSignal()
    }
    @IBAction func yellowBtnPush(sender: AnyObject) {
        resultLabel.textColor = UIColor.yellowColor()
        //        信号についての判定処理
        if signalImageView.image == yellowImage{
            resultLabel.text = "せいかい！"
        }else{
            resultLabel.text = "まちがい！"
        }
        randomSignal()
    }
    @IBAction func redBtnPush(sender: AnyObject) {
        resultLabel.textColor = UIColor.redColor()
        //        信号についての判定処理
        if signalImageView.image == redImage{
            resultLabel.text = "せいかい！"
        }else{
            resultLabel.text = "まちがい！"
        }
        randomSignal()
    }
    
    func randomSignal(){
//        ランダムな数値を作る
        let randomNumber = arc4random() % 3
//        0なら青信号、1なら赤信号、それ以外なら黄色信号をセット
        if randomNumber == 0{
            signalImageView.image = blueImage
        }else if randomNumber == 1{
            signalImageView.image = redImage
        }else{
            signalImageView.image = yellowImage
        }
    }
    
    

}

