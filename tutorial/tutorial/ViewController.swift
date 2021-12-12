//
//  ViewController.swift
//  tutorial
//
//  Created by 허예은 on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var one: UIButton!
    @IBOutlet var two: UIButton!
    @IBOutlet var three: UIButton!
    @IBOutlet var four: UIButton!
    @IBOutlet var five: UIButton!
    @IBOutlet var six: UIButton!
    @IBOutlet var seven: UIButton!
    @IBOutlet var eight: UIButton!
    @IBOutlet var nine: UIButton!
    @IBOutlet var zero: UIButton!
    
    @IBOutlet var dot: UIButton!
    @IBOutlet var plus: UIButton!
    @IBOutlet var minus: UIButton!
    @IBOutlet var multiply: UIButton!
    @IBOutlet var divide: UIButton!
    
    @IBOutlet var label: UILabel!
    var total: Int = 0
    var value: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func pressOne(_ sender: Any) {
        label.text = "1"
        total = total + 1
    }
    
    @IBAction func pressTwo(_ sender: Any) {
        label.text = "2"
        total = total + 1
    }
    
    @IBAction func pressThree(_ sender: Any) {
    }
    
}

