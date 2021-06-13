//
//  ViewController.swift
//  FlashApp
//
//  Created by 손대홍 on 2021/06/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        // Do any additional setup after loading the view.
    }

    @IBAction func onButtonClicked(_ sender: Any) {
        view.backgroundColor = UIColor.white
        label.textColor = UIColor.black
        imageView.tintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        imageView.image = UIImage(systemName: "flashlight.on.fill")
    }
    @IBAction func offButtonClicked(_ sender: Any) {
        view.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        imageView.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        imageView.image = UIImage(systemName: "flashlight.off.fill")
    }
    
}

