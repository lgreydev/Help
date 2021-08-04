//
//  DeleteRow.swift
//  Help
//
//  Created by Sergey Lukaschuk on 04.08.2021.
//

import UIKit

class DeleteRow: UITableViewController {
    
    var arrayElement = [String]()
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayElement.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
