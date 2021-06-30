//
//  LaunchScreen.swift
//  Help
//
//  Created by Sergey Lukaschuk on 30.06.2021.
//

import Foundation

/*
class LogoViewController: UIViewController {
    
    // MARK: - Private Properties
    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "logo-icon")
        return imageView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
            self.performSegue(withIdentifier: "welcomeVC", sender: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.animate()
        }
    }
    
    
    // MARK: - Private Methods
    private func animate() {
        UIView.animate(withDuration: 1.7) {
            let size = self.view.frame.size.width * 2.5
            let diffX = size - self.view.frame.width
            let diffY = self.view.frame.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size)
            self.imageView.alpha = 0
        }
    }
}
 
 
 class WelcomeViewController: UIViewController {
     
     override func viewDidLoad() {
         super.viewDidLoad()

     }
 }
 
*/
