//
//  PassDataClosure.swift
//  Help
//
//  Created by Sergey Lukaschuk on 21.06.2021.
//

import Foundation
import UIKit


/*

class FirstViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else { fatalError() }
        secondVC.closure = { [weak self] text in
            self?.textLabel.text = text
        }
    }
}


class SecondViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var closure: ((String) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        closure?("I can pass data by closure")
        dismiss(animated: true, completion: nil)
    }
}

 */
