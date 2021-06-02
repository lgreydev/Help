


# My Help 

In this project, I have collected various best practices and iOS development tips. This is my personal development assistant.

- [CleanClass](#CleanClass)

text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 

text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 

text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 

text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 
text text text text text text 






#### [CleanClass](https://github.com/lgreydev/Help/blob/master/Help/CleanClass.swift)

```
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
```
