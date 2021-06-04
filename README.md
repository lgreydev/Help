
# **Help**

In this project, I have collected various best practices and iOS development tips. This is my personal development assistant.

- [**Cleane Code**](#clean-code)
    - [Clean Class](#cleanclass)
    - [Lifecycle](#lifecycle)
    - [Extension](#extension)
    - [Logically Related Elements](#logically-related-elements)
    - [Dead Code](#dead-code)
    - [Main MARKs](#main-marks)
    
- [**Protocols**](#protocols)
    - [CustomStringConvertible](#customstringconvertible)
    
- [**Extensions**](#extensions)
    - [Int + Random](#int-random)

- [**Working Code**](#working-code)
    - [Error Handling](#error-handling)
    - [Type Casting](#type-casting)
    - [Failable Initializers](#failable-initializers)
    - [Guard](#guard)


## **Cleane Code**
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


## **Protocols**


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


## **Extensions**


### [Int Random](https://github.com/lgreydev/Help/blob/master/Help/Extensions/Int+Random.swift)
An extension for Int that returns a random number works with range  of numbers. Negative numbers converts to positive.
- **Example:** 17.random will return 0 to 17 (not including 17).
- **Example:** -5.random, -5 convert to 5, will return 0 to 5 (not including 5).


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

## **Working Code**


### [Error Handling](https://github.com/lgreydev/Help/blob/master/Help/WorkingCode/ErrorHandling.swift)
- Error handler, using the `throws` keyword we indicate that the function can receive an error.
- Using the `throw` key we throw an error into the `NSError` instance.
- `do catch` - this error handler helps to catch the error.
- In this example, we are trying to call the function that we marked with the keyword `throws`.
- Before calling the function, put the `try` keyword.
- If the function gets an error, we catch it `catch`.

``` javascript

func divide(_ a: Int, by b: Int) throws -> Double {
    guard b != 0 else { throw NSError(domain: "The number 'b' must not be zero", code: 100) }
    return Double(a / b)
}

/// Checks in 'do catch'
do {
    try divide(10, by: 0)
} catch let error {
    error.localizedDescription
}

/// Checks in 'try!' or 'try?'
let myError = try! divide(10, by: 0)
let myError = try? divide(10, by: 0)

/// Example with user data
enum NetworkError: Error {
    case notPage
    case networkError
}

class Network {
    static let responses = [200, 404, 500]
    static func request() -> Int {
        return responses.randomElement() ?? 0
    }
}

class NetworkManager {
    func userRequest(text: String) throws -> String {
        let statusCode = Network.request()
        guard statusCode != 404 else { throw NetworkError.notPage }
        guard statusCode != 500 else { throw NetworkError.networkError }
        return "\(statusCode): image \(text)"
    }
}

class Browser {
    let networkManager = NetworkManager()
    
    func getImage(text: String) {
        do {
            let result = try networkManager.userRequest(text: text)
            print(result)
        } catch {
            switch error {
            case NetworkError.notPage:
                print("Not Page")
            case NetworkError.networkError:
                print("Network Error")
            default:
                print(error.localizedDescription)
            }
        }
    }
}

let safari = Browser()
safari.getImage(text: "page 1")
safari.getImage(text: "page 2")
safari.getImage(text: "page 3")

```




### [Type Casting](https://github.com/lgreydev/Help/blob/master/Help/WorkingCode/TypeCasting.swift)
Type casting is a way to check the type of an instance, or to treat that instance as a different superclass or subclass from somewhere else in its own class hierarchy.

Type casting in Swift is implemented with the is and as operators. These two operators provide a simple and expressive way to check the type of a value or cast a value to a different type.

``` javascript

/// Type Casting
let unknown: Any = "Steve"

if let name = unknown as? String {
    print(name)
} else {
    print("'unknown' is not type String")
}

/// Checking Type
unknown is Int ? print(unknown) : print("'unknown' is not type Int")

/// Downcasting
/// The variable `tom` of the type `Superclass` assigns an instance of `Subclass`. 
/// If we want to access the properties of the subclass `Subclass` then we need to do Downcasting.
/// We cannot directly access the property of the `Subclass`, since the variable `tom` has the type `Superclass`.
class Superclass {
    var name: String = "Tom"
}

class Subclass: Superclass {
    var age: Int = 15
}

let tom: Superclass = Subclass() // The variable type of 'Superclass' assigns an instance of 'Subclass'

tom.age // error
if let value = tom as? Subclass {
    print(value.age)
}

```


### [Failable Initializers](https://github.com/lgreydev/Help/blob/master/Help/WorkingCode/FailableInitializers.swift)
It’s sometimes useful to define a class, structure, or enumeration for which initialization can fail. This failure might be triggered by invalid initialization parameter values, the absence of a required external resource, or some other condition that prevents initialization from succeeding.

To cope with initialization conditions that can fail, define one or more failable initializers as part of a class, structure, or enumeration definition. You write a failable initializer by placing a question mark after the init keyword (init?).


``` javascript

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let cat = Animal(species: "") // nil
let dog = Animal(species: "Mammal") // Animal

```

### [Guard](https://github.com/lgreydev/Help/blob/master/Help/WorkingCode/Guard.swift)
A guard statement is used to transfer program control out of a scope if one or more conditions aren’t met.
A guard statement has the following form:

`guard condition else {
    statements
}`

The value of any condition in a guard statement must be of type Bool or a type bridged to Bool. The condition can also be an optional binding declaration, as discussed in Optional Binding.
Any constants or variables assigned a value from an optional binding declaration in a guard statement condition can be used for the rest of the guard statement’s enclosing scope.
The else clause of a guard statement is required, and must either call a function with the Never return type or transfer program control outside the guard statement’s enclosing scope using one of the following statements:

`return`
`break`
`continue`
`throw`


``` javascript

/// Example 1
struct MyFood {
    var name: String
    var calories: Int
    
    init?(name: String, calories: Int) {
        guard name != "", calories != 0 else { return nil }
        self.name = name
        self.calories = calories
    }
}

let breakfast = MyFood(name: "banana", calories: 50) // return object
let dinner = MyFood(name: "", calories: 10) // return object
let lunch = MyFood(name: "water", calories: 0) // return object


/// Example 2
func printMyFood(eating: MyFood?) {
    guard let name = eating?.name, let calories = eating?.calories else { fatalError() }
    print(name, calories)
}

printMyFood(eating: breakfast) // print object
printMyFood(eating: lunch) // error

```
