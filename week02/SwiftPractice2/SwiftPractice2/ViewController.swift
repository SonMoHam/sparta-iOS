//
//  ViewController.swift
//  SwiftPractice2
//
//  Created by 손대홍 on 2021/06/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        for index in 0..<textFields.count {
            textFields[index].text = "\(index + 1) 번째 텍스트 필드"
        }
    }
}

