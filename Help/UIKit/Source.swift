//
//  Source.swift
//  Help
//
//  Created by Sergey Lukaschuk on 05.08.2021.
//

import UIKit

class Source: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let source = segue.source as! OtherSource
        source.property = 1
    }
}

class OtherSource: UIViewController {
    var property = 0
}
