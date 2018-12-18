//
//  ViewController.swift
//  Web浏览器
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 Young. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    //Mrak: Outlet
    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let url = URL(string:"https://www.yinyuetai.com") {
            webView.load(URLRequest(url: url))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Action
    //后退
    @IBAction func backBtn(_ sender: Any) {
        webView.goBack()
    }
    //前进
    @IBAction func forwardBtn(_ sender: Any) {
        webView.goForward()
    }
    //刷新
    @IBAction func reloadBtn(_ sender: Any) {
        webView.reload()
    }
    //前往
    @IBAction func goBtn(_ sender: Any) {
        if let url = URL(string: "https://"+tfUrl.text!) {
             webView.load(URLRequest(url: url))
        }
    }
}

