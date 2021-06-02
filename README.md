
# MY HELP

In this project, I have collected various best practices and iOS development tips. This is my personal development assistant.

- [CLEANE CODE](#clean-code)
    - [Clean Class](#cleanclass)
    - [Lifecycle](#lifecycle)
    - [Extension](#extension)
    - [Logically Related Elements](#logically-related-elements)
    - [Dead Code](#dead-code)
    - [Main MARKs](#main-marks)
    
- [PROTOCOLS](#protocols)
    - [CustomStringConvertible](#customstringconvertible)
    
- [Extensions](#extensions)
    - [Int + Random](#int-random)




## CLEANE CODE
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


### [Dead Code](https://github.com/lgreydev/Help/blob/master/Help/CleanCode/DeadCode.swift)
Do not leave unnecessary comments (default), empty methods or dead functionality - it makes code dirty. Attention to the AppDelegate class, most likely you will find empty methods there with comments inside.

``` javascript

❌ NOT Preferred

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
//
//    func someFunc() {
//        print("Some")
//    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain
        //types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits
        //the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }


✅ Preferred

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
            return true
    }

}

```


### [Main MARKs](https://github.com/lgreydev/Help/blob/master/Help/CleanCode/MARK.swift)
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


## PROTOCOLS


### [CustomStringConvertible](https://github.com/lgreydev/Help/blob/master/Help/Protocols/CustomStringConvertible.swift)
A type with a customized textual representation.
Types that conform to the CustomStringConvertible protocol can provide their own representation to be used when converting an instance to a string. The String(describing:) initializer is the preferred way to convert an instance of any type to a string. If the passed instance conforms to CustomStringConvertible, the String(describing:) initializer and the print(_:) function use the instance’s custom description property. Accessing a type’s description property directly or using CustomStringConvertible as a generic constraint is discouraged.

``` javascript

struct Card: CustomStringConvertible {

    var description: String { return "\(rank) \(suit)"}

    var suit: Suit
    var rank: Rank

    enum Suit: String, CustomStringConvertible {
        var description: String { return self.rawValue }
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
    }

    enum Rank: Int, CustomStringConvertible {
        case jack = 11
        case lady = 12
        case king = 13
        case ace = 14
        var description: String { return "\(self.rawValue)" }
    }
}

let card = Card(suit: .hearts, rank: .king)
print(card) // 13 ♥️ nice print

```


## EXTENSIONS


### [Int Random](https://github.com/lgreydev/Help/blob/master/Help/Extensions/Int+Random.swift)
An extension for Int that returns a random number works with range  of numbers. Negative numbers converts to positive.
    Example: 17.random will return 0 to 17 (not including 17).
    Example: -5.random, -5 convert to 5, will return 0 to 5 (not including 5).


``` javascript

extension Int {
    var random: Int {
        if self > 0 {
            return Int.random(in: 0..<self)
        } else if self < 0 {
            return Int.random(in: 0..<abs(self))
        } else {
            return 0
        }
    }
}

```
