//
//  PassDataDelegate.swift
//  Help
//
//  Created by Sergey Lukaschuk on 21.06.2021.
//

import Foundation
import UIKit



protocol MyDelegate: AnyObject {
    func set(title: String)
}

class MainViewController: UIViewController, MyDelegate {
    
    @IBOutlet weak var labelText: UILabel! // title 1
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
            vc.delegate = self
        }
    }
    
    /// protocol implementation
    func set(title: String) {
        labelText.text = title
    }
}

class SecondaryViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel! // title 2
    @IBOutlet weak var textField: UITextField!
    
    var text: String?
    weak var delegate: MyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        textLabel?.text = text
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        delegate?.set(title: textField.text ?? "nil")
        dismiss(animated: true, completion: nil)
    }
}
