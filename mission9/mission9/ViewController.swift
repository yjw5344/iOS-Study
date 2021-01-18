//
//  ViewController.swift
//  mission9
//
//  Created by Jungwon on 2021/01/10.
//

import UIKit

let NUM_PAGE = 10

class ViewController: UIViewController {

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var lb1PageNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = NUM_PAGE
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        lb1PageNumber.text = String(pageControl.currentPage+1)
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        lb1PageNumber.text = String(pageControl.currentPage+1)
    }
    
}

