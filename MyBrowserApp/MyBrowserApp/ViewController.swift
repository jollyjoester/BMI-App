//
//  ViewController.swift
//  MyBrowserApp
//
//  Created by 山田卓 on 2016/08/15.
//  Copyright © 2016年 TakuYamada. All rights reserved.


import UIKit

class ViewController: UIViewController, UIWebViewDelegate,UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topBorder = CALayer()
        topBorder.frame = CGRectMake(0, 0, self.webView.frame.size.width, 1)
        topBorder.backgroundColor = UIColor.lightGrayColor().CGColor
        self.webView.layer.addSublayer(topBorder)
        
        self.webView.delegate = self
        self.textField.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        let startUrl = "http://dotinstall.com"
//        if let url = NSURL(string: startUrl){
//            let urlRequest = NSURLRequest(URL: url)
//            self.webView.loadRequest(urlRequest)
//        }
        
        self.jumpTourl(startUrl)
        self.setupButtonsEnabled()
        self.activityIndicatorView.hidesWhenStopped = true
        
    }
    
    func jumpTourl(urlString: String){
        if let url = NSURL(string: urlString){
        let urlRequest = NSURLRequest(URL: url)
        self.webView.loadRequest(urlRequest)
        } else {
            self.showAlert("Invalid URL")
        }
    }
    
    
    func showAlert(message: String){
//        >= ios8
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var urlString = self.textField.text
        urlString = urlString!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if urlString == "" {
//            alert
            self.showAlert("Please enter URL")
        } else {
            if !urlString!.hasPrefix("http://") && !urlString!.hasPrefix("https://"){
                urlString = "http://" + urlString!
            }
//            jumpTourl
            self.jumpTourl(urlString!)
            self.setupButtonsEnabled()
        }
        self.textField.resignFirstResponder()
        return true
    }
    
    func setupButtonsEnabled(){
        self.backButton.enabled = self.webView.canGoBack
        self.forwardButton.enabled = self.webView.canGoForward

    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        self.webView.stopLoading()
        self.activityIndicatorView.stopAnimating()
        
        if error!.code != NSURLErrorCancelled{
            self.showAlert("Netwaork Error")
        
        }
        
        self.updateUrlLocation()
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.activityIndicatorView.startAnimating()
    }
    
    func updateUrlLocation(){
        if let urlString = self.webView.request?.URL!.absoluteString{
            self.textField.text = urlString
        }
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.activityIndicatorView.stopAnimating()
        self.setupButtonsEnabled()
        self.updateUrlLocation()
        if let urlString = self.webView.request?.URL!.absoluteString{
                self.textField.text = urlString
        }
    }
    
        

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
        }
    
    @IBAction func goBack(sender: AnyObject) {
        self.webView.goBack()
    }
    @IBAction func goForward(sender: AnyObject) {
        self.webView.goForward()
    }
    @IBAction func reload(sender: AnyObject) {
        self.webView.reload()
    }

}
