//
//  ViewController.swift
//  ClosureTutorial
//
//  Created by 허예은 on 2021/01/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        test1() { jsonObject in
            
            
            self.test2()
        }
        
        
        test3()
    }
    
    
    
    func test1(completion:@escaping (String)->Void) {
        var string: String = ""
        
        
        
        
        
        string = "sadfasdf"
        completion(string)
    }
    
    func test2() {
        
    }

    
    func test3() {
        
    }

}

