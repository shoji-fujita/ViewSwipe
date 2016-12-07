//
//  ViewController.swift
//  ViewSwipe
//
//  Created by shoji on 2016/12/06.
//  Copyright © 2016年 shoji fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    var startPointY: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        targetView.frame = view.frame
        targetView.frame.origin.y = self.view.frame.size.height - 70
        targetView.tag = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        let touch = touches.first!
        if touch.view?.tag != 1 {
            return
        }
        let nowPointY = touch.location(in: targetView).y
        let prePointY = touch.previousLocation(in: targetView).y
        
        targetView.frame.origin.y += nowPointY - prePointY
        
        view.alpha = CGFloat(targetView.frame.origin.y) / CGFloat(view.frame.size.height)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        let baseY = self.view.frame.size.height * 3/4
        if targetView.frame.origin.y < baseY {
            UIView.animate(withDuration: 0.5, animations: {
                self.targetView.frame.origin.y = 70
                self.view.alpha = CGFloat(self.targetView.frame.origin.y) / CGFloat(self.view.frame.size.height)
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.targetView.frame.origin.y = self.view.frame.size.height - 70
                self.view.alpha = CGFloat(self.targetView.frame.origin.y) / CGFloat(self.view.frame.size.height)
            })
        }
        
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        print("swipe")
    }

}
