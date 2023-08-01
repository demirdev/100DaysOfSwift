//
//  ViewController.swift
//  Day-24-Project-4-Webview
//
//  Created by Mehmet Demir on 26.07.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webview: WKWebView!
    var progressView: UIProgressView!
    var initialAdress: String!
    
    override func loadView() {
        webview = WKWebView()
        webview.navigationDelegate = self
        view = webview
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButton = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(close))
        
        navigationItem.rightBarButtonItems = [closeButton, rightButton]
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webview, action: #selector(webview.reload))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        webview.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new,  context: nil)
        
        let url = URL(string: "https://" + initialAdress)!
        webview.load(URLRequest(url:url))
        webview.allowsBackForwardNavigationGestures = true
        
//        navigationController?.setNavigationBarHidden(false, animated: true)
        
        addToolBarButtons()
        
    }
    
    @objc func close() {
        navigationController?.popViewController(animated: true)
    }
    
    func addToolBarButtons(){
        let back = UIBarButtonItem(image: UIImage(systemName: "arrowshape.backward"), style: .plain, target: webview, action: #selector(webview.goBack))
        
        let forward = UIBarButtonItem(image: UIImage(systemName: "arrowshape.forward"), style: .plain, target: webview, action: #selector(webview.goForward))
        navigationItem.leftBarButtonItems = [ back, forward ]
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        
        decisionHandler(.cancel)
        
        showBlockedAlert(url?.host)
        
    }
    
    func showBlockedAlert(_ host: String?) {
        if let host = host {
            let ac = UIAlertController(title: "Can't visit site:", message: "\(host) is blocked", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            
                present(ac, animated: true)

        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webview.estimatedProgress)
        }
    }
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
        
    }
    
    func openPage(_ action: UIAlertAction) {
        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://\(actionTitle)") else { return }
        webview.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = (webview.title ?? " ") + "ddd"
    }


}

