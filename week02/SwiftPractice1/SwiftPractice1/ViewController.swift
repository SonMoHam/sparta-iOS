//
//  ViewController.swift
//  SwiftPractice1
//
//  Created by 손대홍 on 2021/06/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var onOffSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    var isBackSide = true
    
    @IBAction func buttonClicked(_ sender: Any) {
        UIView.transition(with: imageView, duration: 0.6, options: .transitionFlipFromLeft) {
            if self.isBackSide {
                self.imageView.image = UIImage(named: "ace")
                
            } else {
                self.imageView.image = UIImage(named: "poker")
                
            }
        } completion: { (animated) in
            self.isBackSide = !self.isBackSide
        }
    }
    
    @IBAction func onOffSwitchValueChanged(_ sender: Any) {
        UIView.transition(with: imageView, duration: 0.6, options: .transitionFlipFromLeft) {
            if self.onOffSwitch.isOn {
                self.imageView.image = UIImage(named: "ace")
                
            } else {
                self.imageView.image = UIImage(named: "poker")
                
            }
        } completion: { (animated) in
            self.isBackSide = !self.isBackSide
        }
    }
}

