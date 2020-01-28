//
//  ViewController.swift
//  imageViewer
//
//  Created by 허예은 on 2020/01/20.
//  Copyright © 2020 허예은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var btnPrev: UIButton!
    
    @IBOutlet var btnNext: UIButton!
    
    @IBOutlet var numLabel: UILabel!
    
    var numImage = 1
    var maxImage = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        imageView.image = UIImage(named: imageName[numImage])
//        numLabel.text = String(numImage)
//
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        numImage = numImage-1 // 이전의 이미지를 받아오기 위한 숫자 설정
        if(numImage < 1){ // 만약 이미지의 번호가 처음(1)보다 숫자가 작아지면
            numImage = maxImage // 가장 마지막의 이미지로 이동
        }
        let imageName = String(numImage) + ".png" // 이미지를 불러옴
        imageView.image = UIImage(named:imageName) // 불러온 이미지를 이미지뷰에 삽입
        numLabel.text = String(numImage) // 이미지의 번호를 불러옴
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage = numImage+1 // 다음의 이미지를 받아오기 위한 숫자 설정
        if(numImage > maxImage){ // 만약 이미지의 번호가 마지막 이미지 번호보다 커지면,
            numImage = 1 // 가장 처음의 이미지로 이동
        }
        let imageName = String(numImage) + ".png" // 이미지를 불러옴
        imageView.image = UIImage(named:imageName) // 불러온 이미지를 이미지뷰에 삽입
        numLabel.text = String(numImage) // 이미지의 번호를 불러옴

    }
}

