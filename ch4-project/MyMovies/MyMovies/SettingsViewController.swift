//
//  SettingsViewController.swift
//  MyMovies
//
//  Created by Jonas Muniz on 18/03/21.
//

import UIKit
class SettingsViewController: UIViewController {
    @IBOutlet weak var swPlay: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Here we are asking UserDefaults to provide us with the Boolean linked to the play key.
        // If not, the value will be false.
        swPlay.isOn = UserDefaults.standard.bool(forKey: "play")
    }
    @IBAction func changePlay(_ sender: UISwitch) {
        
        // Whenever the user touches the switch, its status
        // will be assigned to the play key within UserDefaults.
        // (isOn is the property that indicates whether the switch is on or not)
        UserDefaults.standard.set(sender.isOn, forKey: "play")
    }
    
}
