//
//  ViewController.swift
//  UserDefaultKeyTutorial
//
//  Created by 허예은 on 2021/01/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testSwitch.isOn = UserDefaults.standard.bool(forKey: "switchState")
        // Do any additional setup after loading the view.
    }

    @IBAction func switchAction(_ sender: Any) {
        UserDefaults.standard.set(testSwitch.isOn, forKey: "switchState")
    }
    
}

