//
//  ViewController.swift
//  Qualifiers
//
//  Created by Jonas Muniz on 16/03/21.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lbError: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        }
    
    @IBAction func checkTextFields(_ sender: UIButton) {
        lbError.text = ""
        if tfName.text!.isEmpty || tfEmail.text!.isEmpty {
            lbError.text = "Both fields need to be filled"
        } else {
            performSegue(withIdentifier: "next", sender: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Screen 1: viewDidLoad (view was loaded)")
        lbError.text = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Screen 1: viewWillAppear (view will appear)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Screen 1: viewDidAppear (view appeared)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Screen 1: viewWillDisappear (view vai disappear)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Screen 1: viewDidDisappear (view disappeared)")
    }
    
}


