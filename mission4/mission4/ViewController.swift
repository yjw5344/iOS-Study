//
//  ViewController.swift
//  mission4
//
//  Created by Jungwon on 2020/12/30.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    var alarmTime = ""
    var currentTime = ""

    @IBOutlet var currentTimeText: UILabel!
    @IBOutlet var selectTimeText: UILabel!
    @IBOutlet var datePickerView: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        selectTimeText.text = "선택시간 : " + formatter.string(from: datePickerView.date)
        
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        currentTimeText.text = "현재시간 : " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        currentTime = formatter.string(from: date as Date)
        NSLog(currentTime)
        
        if (alarmTime == currentTime) {
            view.backgroundColor = UIColor.red
        }
        else {
            view.backgroundColor = UIColor.white
        }

        
    }
    
}

