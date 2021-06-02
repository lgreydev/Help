//
//  CleanClass.swift
//  Help
//
//  Created by Sergey Lukaschuk on 02.06.2021.
//

import Foundation

/// Example of a clean class
/// The code has a clear structure, due to which the logic is more obvious, the code is easy to read, you can quickly find what you are looking for, and besides, it is just pleasant to look at it.

/*
final class CleanViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Public Properties
    var userID: String?
    weak var delegate: SomeDelegate?
    
    // MARK: - Private Properties
    private let userService = UserService()
    private var userList: [User]?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .red
        navigationItem.title = "Some"
    }
    
    // MARK: - IBActions
    @IBAction private func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

*/


/// The main MARKs for splitting the code into logically related blocks and their sequence
// MARK: - IBOutlets

// MARK: - Public Properties

// MARK: - Private Properties

// MARK: - Initializers

// MARK: - Lifecycle

// MARK: - Public Methods

// MARK: - Private Methods

// MARK: - IBActions
