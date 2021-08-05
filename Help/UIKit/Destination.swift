//
//  Destination.swift
//  Help
//
//  Created by Sergey Lukaschuk on 05.08.2021.
//

import UIKit

class Destination: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! OtherDestination
        destination.property = 1
    }
}

class OtherDestination: UIViewController {
    var property = 0
}
