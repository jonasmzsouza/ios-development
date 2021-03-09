//
//  ViewController.swift
//  MyApp
//
//  Created by Jonas Muniz on 05/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myClass = MyClass(name: "Jonas Muniz")
        //print(myClass.name)  This code will not work if it is uncommented
        let message = myClass.getWelcomeMessage()
        print(message)
    }
    
}

