//
//  NewViewController.swift
//  ViewLifeCycle
//
//  Created by Jonas Muniz on 16/03/21.
//

import UIKit

class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Screen 2: viewDidLoad (view was loaded)")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Screen 2: viewWillAppear (view will appear)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Screen 2: viewDidAppear (view appeared)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Screen 2: viewWillDisappear (view vai disappear)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Screen 2: viewDidDisappear (view disappeared)")
    }

}
