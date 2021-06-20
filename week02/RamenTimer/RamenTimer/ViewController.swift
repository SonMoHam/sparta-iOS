//
//  ViewController.swift
//  RamenTimer
//
//  Created by 손대홍 on 2021/06/20.
//

import UIKit
enum SEGUE_INDEX {
    static let SECONDS_10 = 0
    static let SECONDS_180 = 1
    static let SECONDS_240 = 2
    static let SECONDS_300 = 3
}
class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var timerSegment: UISegmentedControl!
    var secondsLeft: Int = 10
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerButton.layer.cornerRadius = 10
        self.secondsLeft = 10
        self.updateTimerLabel()
    }
    
    func updateTimerLabel() {
        let minutes = self.secondsLeft / 60
        let seconds = self.secondsLeft % 60
        
        if self.secondsLeft < 5 {
            timerLabel.textColor = UIColor.red
        } else {
            timerLabel.textColor = UIColor.black
        }
        UIView.transition(with: self.timerLabel, duration: 0.3, options: .transitionFlipFromBottom) {
            if self.secondsLeft > 0 {
                self.timerLabel.text = String(format: "%02d:%02d", minutes,seconds)
            } else {
                self.timerLabel.text = "시간 끝!"
            }
        } completion: { (animated) in

        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
        timerButton.setTitle("타이머 시작하기", for: .normal)
    }
    
    func setTimerSeconds() {
        switch timerSegment.selectedSegmentIndex {
        case SEGUE_INDEX.SECONDS_10:
            secondsLeft = 10
        case SEGUE_INDEX.SECONDS_180:
            secondsLeft = 180
        case SEGUE_INDEX.SECONDS_240:
            secondsLeft = 240
        case SEGUE_INDEX.SECONDS_300:
            secondsLeft = 300
        default:
            secondsLeft = 10
        }
        updateTimerLabel()
    }
    @IBAction func segmentValueChanged(_ sender: Any) {
        print(timerSegment.selectedSegmentIndex)
        resetTimer()
        setTimerSeconds()
    }
    
    @IBAction func timerButtonClicked(_ sender: Any) {
        if timer != nil {
            resetTimer()
            return
        }
        self.timerButton.setTitle("타이머 종료하기", for: .normal)
        setTimerSeconds()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
            self.secondsLeft -= 1
            self.updateTimerLabel()
            if self.secondsLeft == 0 {
                self.resetTimer()
            }
        }
    }
}

