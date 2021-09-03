//
//  SwipeScreen.swift
//  Help
//
//  Created by Sergey Lukaschuk on 03.09.2021.
//

import Foundation
import UIKit

class SwipeScreen: UIViewController {
    
    private func configureSwipe() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc
    private func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .right:
            print("right swipe")
            // add action!
            case .left:
            print("left swipe")
            // add action!
            default:
                break
            }
        }
    }
}
