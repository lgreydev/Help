//
//  PassDataClosure.swift
//  Help
//
//  Created by Sergey Lukaschuk on 21.06.2021.
//

import Foundation
import UIKit


/*
class MainViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var text: String?
    
    @IBAction func buttonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "1", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //guard segue.identifier == "123" else { fatalError() }
        
        /// SecondaryViewController
        if let vc = segue.destination as? SecondaryViewController {
            vc.text = textField.text
            
            /// closure
            vc.dataClosure = { [weak self] text in
                self?.labelText.text = text
            }
        }
    }
}

class SecondaryViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel! // title 2
    @IBOutlet weak var textField: UITextField!
    
    var text: String?
    
    typealias MyClosure = (String) -> () // closure
    var dataClosure: MyClosure? // closure
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        dataClosure?(textField.text ?? "nil") // closure
        dismiss(animated: true, completion: nil)
    }
    
    func updateView() {
        textLabel?.text = text
    }
}
*/
