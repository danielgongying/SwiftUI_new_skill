//
//  ViewController.swift
//  Webview_demo
//
//  Created by daniel on 30/07/2019.
//  Copyright © 2019 daniel. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController ,WKUIDelegate,WKNavigationDelegate{
//    @IBOutlet weak var webView: WKWebView!
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }



    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void){
        
    }
    
    func webView(WKWebView, didReceive: URLAuthenticationChallenge, completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void){
        
    }

    

}

