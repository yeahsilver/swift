//
//  ViewController.swift
//  tutorial1
//
//  Created by 허예은 on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showContent(_ sender: Any) {
        contentLabel.text =  contentTextField.text
    }
}

