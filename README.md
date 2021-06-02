
# My Help 

In this project, I have collected various best practices and iOS development tips. This is my personal development assistant.

- [CLEANE CODE](#clean-code)
    - [Clean Class](#cleanclass)
    - [Main MARKs](#main-marks)
    - [Lifecycle](#lifecycle)
    - [Extension](#extension)
    - [Logically Related Elements](#logically-related-elements)


## Clean Code
Raising code readability in iOS development. Thanks to the application of these tips, your code will become readable, which will further ensure convenience and speed of working with it.


### [Clean Class](https://github.com/lgreydev/Help/blob/master/Help/CleanCode/CleanClass.swift)
The code has a clear structure, due to which the logic is more obvious, the code is easy to read, you can quickly find what you are looking for, and besides, it is just pleasant to look at it.

```javascript
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


### [Main MARKs](https://github.com/lgreydev/Help/blob/master/Help/CleanCode/CleanClass.swift)
The main MARKs for splitting the code into logically related blocks and their sequence.

```javascript
// MARK: - IBOutlets

// MARK: - Public Properties

// MARK: - Private Properties

// MARK: - Initializers

// MARK: - Lifecycle

// MARK: - Public Methods

// MARK: - Private Methods

// MARK: - IBActions

```


### [Lifecycle](https://github.com/lgreydev/Help/blob/master/Help/CleanCode/Lifecycle.swift)
We move the logic out of the lifecycle methods into separate methods. The logic inside the methods of the ViewController lifecycle should be moved into separate methods, even if you have to create a method with one line of code. Today one, and tomorrow ten.

``` javascript
❌ NOT Preferred

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.backgroundColor = .red
        someButton.layer.cornerRadius = 10
        someButton.layer.masksToBounds = true
        navigationItem.title = "Some"
        print("Some")
    }


✅ Preferred

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupSomeButton()
        printSome()
    }
    
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .red
        navigationItem.title = "Some"
    }
    
    private func setupSomeButton() {
        someButton.layer.cornerRadius = 10
        someButton.layer.masksToBounds = true
    }
    
    private func printSome() {
        print("Some")
    }

```


### [Extension](https://github.com/lgreydev/Help/blob/master/Help/CleanCode/Extension.swift)
Using an extension to implement protocols. Move protocols implementation into extensions with mark // MARK: — SomeProtocol

``` javascript
❌ NOT Preferred

final class CleanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // all methods
}


✅ Preferred

final class CleanViewController: UIViewController {

  // class stuff here
  
}


// MARK: - Table View Data Source
extension CleanViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        return cell
    }
    
}
```


### [Logically Related Elements](https://github.com/lgreydev/Help/blob/master/Help/CleanCode/LogicallyRelatedElements.swift)
To improve clarity, you need to highlight logically related elements using an empty string.

``` javascript

❌ NOT Preferred

    private func showActivityIndicator(on viewController: UIViewController) {
        activityIndicator.center = viewController.view.center
        loadingView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        loadingView.alpha = 0.5
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .whiteLarge
        loadingView.center = viewController.view.center
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 15
        viewController.view.addSubview(loadingView)
        viewController.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }


✅ Preferred

    private func showActivityIndicator(on viewController: UIViewController) {
        activityIndicator.center = viewController.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .whiteLarge
        
        loadingView.center = viewController.view.center
        loadingView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        loadingView.alpha = 0.5
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 15
        
        viewController.view.addSubview(loadingView)
        viewController.view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }

```


