//
//  ViewController.swift
//  progressBar
//
//  Created by 허예은 on 2021/01/13.
//

import UIKit

class ViewController: UIViewController {

    var value: Float = 50.0
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        
        progressView.setProgress(value, animated: true)
    }
//        perform(#selector(updateProgress), with: nil, afterDelay: 1.0)
//
//    }
//
//    @objc func updateProgress(){
//        progressView.progress = value
//    }

}

