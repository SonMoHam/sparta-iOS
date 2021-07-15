//
//  FingerGameViewController.swift
//  FingerGame
//
//  Created by 손대홍 on 2021/07/13.
//

import UIKit

class FingerGameViewController: UIViewController {
    
    @IBOutlet weak var gameView: FingerGameView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.controller = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        
    }
    var timer: Timer?
    func touchCountDidChange() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (t) in
            for roundView in self.gameView.touchToRoundView.values {
                var randomChoice = Bool.random()
                
                if randomChoice {
                    roundView.backgroundColor = UIColor(named: "myGreen")
                } else {
                    roundView.backgroundColor = UIColor(named: "myOrange")
                }
            }
        }
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
