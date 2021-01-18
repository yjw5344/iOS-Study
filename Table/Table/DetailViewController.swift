//
//  DetailViewController.swift
//  Table
//
//  Created by Jungwon on 2021/01/17.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = ""

    @IBOutlet var lb1Item: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lb1Item.text = receiveItem

        // Do any additional setup after loading the view.
    }
    
    func reciveItem(_ item: String)
    {
        receiveItem = item
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
