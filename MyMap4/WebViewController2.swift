//
//  WebViewController.swift
//  MyMap4
//
//  Created by Mongyan on 2023/5/1.
//

import Foundation
import WebKit

class WebViewController2 :UIViewController,WKNavigationDelegate{
    var webView2: WKWebView!

        override func loadView() {
            webView2 = WKWebView()
            webView2.navigationDelegate = self
            view = webView2
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            var urlString = "192.168.1.103:5448"
            var url2 = NSURL(string: urlString)
            if let url2 = URL(string: "192.168.1.103:5448") {
                            if UIApplication.shared.canOpenURL(url2) {
                                if #available(iOS 10.0, *) {
                                    UIApplication.shared.open(url2, options: [:], completionHandler: nil)
                                } else {
                                    UIApplication.shared.openURL(url2)
                                }
                            }
                        }
                }
        }
    

