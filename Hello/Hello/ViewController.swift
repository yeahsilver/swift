//
//  ViewController.swift
//  Hello
//
//  Created by 허예은 on 2020/01/19.
//  Copyright © 2020 허예은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelOne: UILabel! // 출력 레이블 아울렛 변수
    
    @IBOutlet weak var labelName: UILabel! // 이름 출력용 레이블

    @IBOutlet weak var textName: UITextField!
    // 이름 입력용 아울렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnSend(_ sender: Any) {
        labelOne.text = "이 화면은 버튼을 누른 후 나타나는 화면입니다."
        labelOne.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        labelName.text = "안녕하세요 " + textName.text! + "님!"
        
    }
    
}

