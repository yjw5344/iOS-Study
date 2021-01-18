//
//  ViewController.swift
//  mission3
//
//  Created by Jungwon on 2020/12/30.
//

import UIKit

class ViewController: UIViewController {
    
    var numImage = 1
    var maxImage = 6

    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var prewBtn: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named:"1.png")
    }

    @IBAction func prevBtnClicked(_ sender: UIButton) {
        numImage -= 1
        if(numImage < 1) {
            numImage = 6
        }
        
        let imageName = String(numImage) + ".png"
        imageView.image = UIImage(named:imageName)
        
    }
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        numImage += 1
        if(numImage > 6) {
            numImage = 1
        }
        let imageName = String(numImage) + ".png"
        imageView.image = UIImage(named:imageName)
    }
    
}

