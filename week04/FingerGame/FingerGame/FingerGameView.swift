//
//  FingerGameView.swift
//  FingerGame
//
//  Created by 손대홍 on 2021/07/13.
//

import UIKit

class FingerGameView: UIView {
    
    weak var controller: FingerGameViewController?
    
    var touchToRoundView: [UITouch: UIView] = [:]
    
    //터치 시작
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
            view.center = touch.location(in: self)
            view.backgroundColor = UIColor(named: "myRed")
            view.layer.cornerRadius = 30    // width, height 값의 절반
            
            self.touchToRoundView[touch] = view
            self.addSubview(view)
            
            self.controller?.touchCountDidChange()
        }
    }
    
    //터치 이동
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            view?.center = touch.location(in: self)
        }
    }
    
    //터치 끝
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            self.controller?.touchCountDidChange()
        }
    }
    
    //터치가 비정상적인 이유로 끝남, 아이폰의 멀티 터치는 5개까지 -> 멀티 터치가 6개로 추가되면 캔슬이 되며 touchesCancelled 호출
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            self.controller?.touchCountDidChange()
        }
    }
    
}
