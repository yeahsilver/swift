//
//  ViewController.swift
//  Notification
//
//  Created by 허예은 on 2021/01/05.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func setReminder(_ sender: Any){
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "This is a location notification"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
        
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        
        center.add(request){
            (error) in
            print("Error = \(error?.localizedDescription ?? "error local notification")")
        }
    }
}

