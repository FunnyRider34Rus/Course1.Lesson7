//
//  ViewController.swift
//  Course1.Lesson7
//
//  Created by Павел on 16.08.2023.
//

import UIKit
import WebKit

class AuthViewController: UIViewController {
    
// MARK: - WKWebView
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        navigation()
    }
    
    private func setupWebView() {
        guard let appCode = AppConst.appCode else {
            return
        }
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=\(appCode)&redirect_uri=https://oauth.vk.com/blank.html&display=mobile&response_type=token")
        
        guard let url else {
            return
        }
        
        view.backgroundColor = Theme.currentTheme.backgroundColor
        webView.load(URLRequest(url: url))
        view.addSubview(webView)
    }
}

// MARK: - WKNavigationDelegate

extension AuthViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map{ $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        if let token = params["access_token"] {
            AppConst.token = token
        }
        
        if let userID = params["user_id"] {
            AppConst.userID = userID
        }

        decisionHandler(.cancel)
        webView.removeFromSuperview()
    }
}
