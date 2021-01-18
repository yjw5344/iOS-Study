//
//  ViewController.swift
//  HelloWorld
//
//  Created by Jungwon on 2020/12/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lb1Hello: UILabel!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lb1Hello.text = "Hello, " + txtName.text!
    }
    
}

