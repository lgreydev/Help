//
//  MoveRowAtTo.swift
//  Help
//
//  Created by Sergey Lukaschuk on 04.08.2021.
//

import UIKit

class MoveRow: UITableViewController {
    
    var arrayElement = [String]()
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let someRow = arrayElement.remove(at: sourceIndexPath.row)
        arrayElement.insert(someRow, at: destinationIndexPath.row)
    }
}


