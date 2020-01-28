//
//  ViewController.swift
//  alarmClock
//
//  Created by 허예은 on 2020/01/28.
//  Copyright © 2020 허예은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let TimeInterval = 1.0
    var count = 0
    
    var alarmTime: String?
    var current: String?
    
    @IBOutlet var labelChange: UILabel!
    
    @IBOutlet var clockImage: UIImageView!
    
    @IBOutlet var currentTime: UILabel!
    
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var pickerTime: UILabel!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clockImage.image = UIImage(named:"time.png")
        Timer.scheduledTimer(timeInterval: TimeInterval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        timeLabel.text = "선택시간"
        pickerTime.text  = formatter.string(from:datePickerView.date)
        formatter.dateFormat = "hh:mm"
        alarmTime = formatter.string(from:datePickerView.date)
    }

    
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat =  "yyyy-MM-dd HH:mm:ss EEE"
       
        
        currentTime.text = "현재시간: " + formatter.string(from:date as Date)
        
        formatter.dateFormat = "hh:mm"
        current = formatter.string(from: date as Date)
  
        
        if(current == alarmTime){

            labelChange.textColor = UIColor.systemRed
               }else {

            labelChange.textColor = UIColor.systemBlue
               }
               
    }
}

