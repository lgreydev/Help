//
//  DismissKeyboard.swift
//  Help
//
//  Created by Sergey Lukaschuk on 11.11.2021.
//

import Foundation
import UIKit



class DismissKeyboard: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // When user touch on screen
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    // Dismiss keyboard
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
