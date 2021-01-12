//
//  ViewController.swift
//  EscapingClosureTutorial
//
//  Created by 허예은 on 2021/01/12.
//

import UIKit

var completionHandlers: [() -> Void] = []

func withEscaping(completion: @escaping () -> Void){
    completionHandlers.append(completion)
}

func withoutEscaping(completion: () -> Void){
    completion()
}

class MyClass{
    var x = 10
    func callFunc() {
        withEscaping { self.x = 100 }
        withoutEscaping { x = 200}
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mc = MyClass()
        mc.callFunc()
        print(mc.x)
        completionHandlers.first?()
        print(mc.x)
    }
}

