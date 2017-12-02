//
//  ViewController.swift
//  SampleWebApp
//
//  Created by Venkata ramana Kunapuli on 11/30/17.
//  Copyright © 2017 Venkata ramana Kunapuli. All rights reserved.
//

import UIKit
import WebKit
import GCDWebServer


class ViewController: UIViewController,WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    var placeUrl:String?
    var webServer:GCDWebServer?
    override func viewDidLoad() {
        super.viewDidLoad()
        //This is for angular
        self.webView.load(URLRequest(url: loadDefaultIndexFile()!))
        //The follwing is for regular or bootstrap HTML files
        /*
        // Do any additional setup after loading the view, typically from a nib.
        //let app_str = String("bootstrap/index.html")
        //let url = URL(string: "bootstrap/index.html")!
        //webView.load(URLRequest(url: url))
       // let url = NSURL(fileURLWithPath: "bootstrap/index.html")
        let url = Bundle.main.url(forResource: "index", withExtension: "html")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        showActivityIndicatory(uiView: self.view)
 */
        
        
        
    }
    private func loadDefaultIndexFile() -> URL? {
        self.webServer = GCDWebServer()
        let mainBundle = Bundle.main
        // The path to my index.html is www/index.html.  If using a default public folder then it could be public/index.html
        let folderPath = mainBundle.path(forResource: "ionicSample", ofType: nil)
        self.webServer?.addGETHandler(forBasePath: "/", directoryPath: folderPath!, indexFilename: "index.html", cacheAge: 0, allowRangeRequests: true)
        
        do {
            try self.webServer?.start(options: [
                "Port": 3000,
                "BindToLocalhost": true
                ]);
        }catch{
            print(error)
        }
        
        // Path should be http://localhost:3000/index.html
        return self.webServer?.serverURL
    }
    func showActivityIndicatory(uiView: UIView) {
        //var actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x:0.0, y:0.0, width:80.0, height:80.0);
        actInd.center = uiView.center
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.gray
        uiView.addSubview(actInd)
        actInd.startAnimating()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        actInd.stopAnimating()
        
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load")
        actInd.stopAnimating()
    }

}

