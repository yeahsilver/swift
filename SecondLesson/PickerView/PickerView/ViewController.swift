//
//  ViewController.swift
//  PickerView
//
//  Created by 허예은 on 2020/02/02.
//  Copyright © 2020 허예은. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    
    var imageFileName = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    var imageArray = [UIImage?]()


    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0..<MAX_ARRAY_NUM{
            let image = UIImage(named:imageFileName[i]) // 이미지 배열을 불러옴
            imageArray.append(image)
        } // for 문 0부터 MAX_ARRAY_NUM까지
        
        lblImageFileName.text = imageFileName[0] // label에 ImageFileName배열의 첫 번째 파일명을 출력
        imageView.image = imageArray[0] // 이미지 뷰에 첫번째 이미지를 나타냄
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN // 열의 개수를 의미함.
    } // 피커뷰에게 요소의 수를 정수 값으로 넘겨주는 델리게이트 메서드
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count // 이미지의 개수
    } // 몇개의 행으로 이루어질것인지를 나타내주는 메서드
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    } // 피커뷰의 각 행의 요소들을 문자열로 변환시켜주는 메서드

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView { // 각 열의 뷰를 UIView 타입의 값으로 넘겨줌.
        let imageView = UIImageView(image:imageArray[row]) // 선택된 row에 해당하는 이미지를 imageArray에서 가져옴
        imageView.frame = CGRect(x:0, y:0, width:100, height:150) // 이미지뷰의 프레임 크기 설정
        
        return imageView // 이미지 뷰 리턴
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row] // row 값에 해당하는 이미지 불러오기
    } // 위의 함수에서 받아온 문자열을 라벨의 텍스트에 삽입하여 어떤 이미지파일이 띄워졌는지 출력
}

