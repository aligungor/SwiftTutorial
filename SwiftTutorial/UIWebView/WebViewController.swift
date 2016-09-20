//
//  WebViewController.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 30/05/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var webView: UIWebView!
    @IBOutlet var indLoading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("Load failed")
        print(error.debugDescription)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("should start load")
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        indLoading.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indLoading.stopAnimating()
    }
    
    @IBAction func onClickLoadHTML(_ sender: UIButton) {
        webView.loadHTMLString("<html><h1>Ali</h1> <h2>Güngör</h2></html>", baseURL: nil)
    }
    
    @IBAction func onClickLoadURL(_ sender: UIButton) {
        webView.loadRequest(URLRequest(url: URL(string: "http://github.com/aligungor")!))
    }
}
