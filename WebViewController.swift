//
//  WebViewController.swift
//  MyMap4
//
//  Created by Mongyan on 2023/5/1.
//

import Foundation
import WebKit

class WebViewController :UIViewController,WKNavigationDelegate{
    var webView: WKWebView!

        override func loadView() {
            webView = WKWebView()
            webView.navigationDelegate = self
            view = webView
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            var urlString = "http://192.168.1.104"
           var url = NSURL(string: urlString)
            if let url = URL(string: "http://192.168.1.104") {
                            if UIApplication.shared.canOpenURL(url) {
                                if #available(iOS 10.0, *) {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                } else {
                                    UIApplication.shared.openURL(url)
                                }
                            }
                        }
                }
        }
    

