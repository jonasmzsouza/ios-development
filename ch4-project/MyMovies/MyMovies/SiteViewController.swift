//
//  SiteViewController.swift
//  MyMovies
//
//  Created by Jonas Muniz on 21/03/21.
//

import UIKit

class SiteViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var site: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: site) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
