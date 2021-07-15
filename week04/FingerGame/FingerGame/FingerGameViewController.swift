//
//  FingerGameViewController.swift
//  FingerGame
//
//  Created by 손대홍 on 2021/07/13.
//

import UIKit

class FingerGameViewController: UIViewController {
    
    @IBOutlet weak var gameView: FingerGameView!
    @IBOutlet weak var secondsLabel: UILabel!
    
    var secondsLeft = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.controller = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    var timer: Timer?
    func touchCountDidChange() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (t) in
            for roundView in self.gameView.touchToRoundView.values {
                var randomChoice = Bool.random()
                
                UIView.animate(withDuration: 1) {
                    if randomChoice {
                        roundView.backgroundColor = UIColor(named: "myGreen")
                    } else {
                        roundView.backgroundColor = UIColor(named: "myOrange")
                    }
                    
                    let center = roundView.center
                    roundView.frame.size = CGSize(width: 90, height: 90)
                    roundView.layer.cornerRadius = 45
                    roundView.center = center
                }
                
            }
        }
        resetSecondsTimer()
    }
    
    var secondsTimer: Timer?
    func resetSecondsTimer() {
        secondsTimer?.invalidate()
        
        if gameView.touchToRoundView.values.count > 0 {
            //5초로 초기화
            self.secondsLeft = 5
            self.secondsLabel.text = "5"
            self.blinkSecondsLabel()
            
            secondsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
                //1초 빼기
                self.secondsLeft -= 1
                //남은초 보여주기
                self.secondsLabel.text = "\(self.secondsLeft)"
                self.blinkSecondsLabel()
                
                //시간이 다되면
                if self.secondsLeft == 0 {
                    //라벨 텍스트 안 보이게
                    self.secondsLabel.text = ""
                    //초시계 타이머 무효화
                    self.secondsTimer?.invalidate()
                }
            })
            // 없으면 라벨 텍스트 안 보이게
        } else {
            self.secondsLabel.text = ""

        }
    }
    
    func blinkSecondsLabel() {
        self.secondsLabel.alpha = 1
        
        UIView.animate(withDuration: 0.8) {
            self.secondsLabel.alpha = 0
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
