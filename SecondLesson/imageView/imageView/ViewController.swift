//
//  ViewController.swift
//  imageView
//
//  Created by 허예은 on 2020/01/19.
//  Copyright © 2020 허예은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isZoomed = false;
//    var imgOn: UIImage?
//    var imgOff: UIImage?

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var isOn: UILabel!
    
    @IBOutlet var btnResize: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnResizeImg(_ sender: UIButton) {
        if(isZoomed){
             isOn.font = UIFont.boldSystemFont(ofSize:100)
            
            btnResize.setTitle("확대",for: .normal) // 버튼의 이름을 "확대"로 전환
            toast(message: "축소 완료")
            
            
            
        } else{

            isOn.font = UIFont.boldSystemFont(ofSize:200)
            btnResize.setTitle("축소", for: .normal) // 버튼의 이름을 "축소"로 전환
            toast(message: "확대 완료")
        }
        
        isZoomed = !isZoomed
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn {
            isOn.text! = "ON"
            isOn.textColor = UIColor.blue
            
             toast(message: "켜짐")
        } else {
            isOn.text! = "OFF"
            isOn.textColor = UIColor.red
             toast(message: "꺼짐")
        }
    }
    
 func toast(message : String) {
            let toastLabel = UILabel(frame: CGRect(x: view.frame.width/2 - 150, y: view.frame.height-150, width: 300,  height : 35))

            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.65) // 배경색상을 지정해줌 숫자가 클수록 진한색.
            toastLabel.textColor = UIColor.white // 텍스트 색상 변경
            toastLabel.textAlignment = .center; // 가운데 정렬
            toastLabel.font = UIFont.boldSystemFont(ofSize:20) // 폰트의 사이즈를 20으로 변환
            toastLabel.text = message // message를 toastLabel.text에 대입함
            toastLabel.layer.cornerRadius = 15; // 레이어의 모양을 나타냄
            toastLabel.clipsToBounds  =  true // 텍스트뷰 테두리가 기준이 됨.
        toastLabel.alpha = 1.0 // 처음 나타나는 색상의 진하기를 나타냄.
            self.view.addSubview(toastLabel) // 위의 속성을 가진 subView 생성
    UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseIn, animations: { // 천천히 진행되었다가 조금씩 빨라짐
        toastLabel.alpha = 0.25 // 투명도
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview() // 링크를 끊어버림
            })
        }
    
}

