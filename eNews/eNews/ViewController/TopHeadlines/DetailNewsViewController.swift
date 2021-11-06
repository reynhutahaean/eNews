//
//  DetailNewsViewController.swift
//  eNews
//
//  Created by Reynaldo Cristinus Hutahaean on 05/11/21.
//

import UIKit
import WebKit

class DetailNewsViewController: ParentViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    
    var detailNews = News()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    func initUI() {
        headerView.dropShadow()
        loadDetailNews()
    }

    func loadDetailNews() {
        guard let url = URL(string: detailNews.url ?? "") else {
            return
        }
        
        UIView.animate(withDuration: 2.0, animations: {
            self.showLoading(self.view)
        })
        webView.load(URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30))
        self.hideLoading(self.view)
    }
    
}
