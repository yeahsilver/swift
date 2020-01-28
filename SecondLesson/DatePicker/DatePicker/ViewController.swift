//
//  ViewController.swift
//  DatePicker
//
//  Created by 허예은 on 2020/01/20.
//  Copyright © 2020 허예은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentTime: UILabel!
    @IBOutlet var pickerTime: UILabel!
    
    let timeSelector:Selector = #selector(ViewController.updateTime)//타이머가 구동되면 실행할 함수를 지정
    var interval = 1.0// 1초를 의미
    var count = 0// 타이머가 설정한 간격대로 실행하기 위한 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // timeInterval: 타이머 간격
        // target: 동작될 view
        // selector: 타이머가 구동될 때 실행할 함수
        // uiserInfo: 사용자 정보
        //repeats: 반복여부
        
    
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender // sender를 datePickerView에 전달
        
        let formatter = DateFormatter()// 날짜 출력을 위한 변수
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"// dateFormat의 속성을 지정 ex)2020-1-28 14:58 TUE
        pickerTime.text = "선택시간: " + formatter.string(from:datePickerView.date)//문자열 변환하여 지정된 속성의 포맷대로 날짜 출력
        
    }
    
    @objc func updateTime(){

        let date = NSDate() // 현재 시간을 불러옴
        
        let formatter = DateFormatter()// 날짜를 출력하기 위해 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" // formatter의 속성 설정
        currentTime.text = "현재시간: " + formatter.string(from:date as Date) // 현재 시간을 출력
    }
    
}

