//
//  ViewController.swift
//  iosTest
//
//  Created by 허예은 on 2020/03/15.
//  Copyright © 2020 허예은. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    @IBOutlet var webView: WKWebView!
    
    override func loadView(){
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.naver.com")
        let myRequest = URLRequest(url:myURL!)
        webView.load(myRequest)
    }
    
        
//    override func viewWillAppear(_ animated: Bool) {
//        var viewBounds:CGRect = self.view.bounds
//        viewBounds.origin.y = 20;
//        viewBounds.size.height = viewBounds.size.height - 20;
//        self.webView.frame = viewBounds;
//
//        self.view.backgroundColor = UIColor.white
//    }


//    override var preferredStatusBarStyle: UIStatusBarStyle{
//        return .lightContent
//    }
}

