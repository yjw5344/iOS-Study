//
//  ViewController.swift
//  DatePicker
//
//  Created by Jungwon on 2020/12/29.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector : Selector = #selector(ViewController.updateTime)
    // selector의 기능?
    let interval = 1.0
    var count = 0

    @IBOutlet var lb1CurrentTime: UILabel!
    @IBOutlet var lb1PickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lb1PickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
//        lb1CurrentTime.text = String(count)
//        count = count + 1
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:ss EEE"
//        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        // 상수인데 표현식 설정하는게 가능

        lb1CurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        // as Date ?
        // as는 클래스 형변환, Date 타입으로 형변환을 하고, string 타입으로 형변환
        
    }
    
}

