//
//  RegisterViewController.swift
//  movie-app
//
//  Created by Bao Hoang Gia on 07/06/2022.
//

import UIKit
import WebKit

class RegisterViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebview()
        // Do any additional setup after loading the view.
    }
    
    private func setupWebview() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view.addSubview(webView)
        let url = URL(string: AuthManager.shared.registerUrl)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        activityIndicator = UIActivityIndicatorView()
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            activityIndicator.style = UIActivityIndicatorView.Style.large
        } else {
            activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        }
    }
    
    private func setupIndicator(isShown: Bool) {
        if isShown {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        setupIndicator(isShown: true)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        setupIndicator(isShown: false)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        setupIndicator(isShown: false)
    }
}
