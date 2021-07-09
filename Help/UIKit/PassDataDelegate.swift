//
//  PassDataDelegate.swift
//  Help
//
//  Created by Sergey Lukaschuk on 21.06.2021.
//

import Foundation
import UIKit

/*
 
 Пишем протокол (правило), в котором описываем нужный нам метод, который принимает необходимые аргументы и, если нужно, что-то выдает.
 
 Подписываем «порождающий» контроллер под этот протокол и пишем в нем этот метод.
 
 У дочернего контроллера (например, у ячейки) добавляем опциональное свойство делегата, являющееся типом нашего протокола (то есть поддерживающего тип нашего протокола)
 
 При создании дочернего контроллера ставим в его свойстве делегата себя, то есть self «порождающего» контроллера.
 
 https://habr.com/ru/post/510882/
 
 */


protocol FirstViewControllerDelegate: AnyObject {
    func update(text: String)
}

/// - Implementation option through extensions
//extension FirstViewController: FirstViewControllerDelegate {
//    func update(text: String) {
//        textLabel.text = text
//    }
//}

class FirstViewController: UIViewController, FirstViewControllerDelegate {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else { fatalError() }
        secondVC.delegate = self
    }
    
    func update(text: String) {
        textLabel.text = text
    }
}


class SecondViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    weak var delegate: FirstViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        delegate?.update(text: "Text was changed")
        dismiss(animated: true, completion: nil)
    }
}
