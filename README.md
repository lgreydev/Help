
# **Help**

In this project, I have collected various best practices and iOS development tips. This is my personal development assistant.

### Index

- [**Clean Code**](#clean-code)
    - [Clean Class](#clean-class)
    - [Life Cycle](#life-cycle)
    - [Extension](#extension)
    - [Logically Related Elements](#logically-related-elements)
    - [Dead Code](#dead-code)
    - [Main MARKs](#main-marks)
    - [Semantic Commit](#semantic-commit)
    - [Shortcuts](#shortcut)
    
- [**Protocols**](#protocols)
    - [CustomStringConvertible](#customstringconvertible)
    - [Equatable](#equatable)
    - [Comparable](#comparable)
    
- [**Extensions**](#extensions)
    - [Int+Random](#intᐩrandom)
    - [String+CompareNumbers](#stringᐩcompareNumbers)

- [**Working Code**](#working-code)
    - [Error Handling](#error-handling)
    - [Type Casting](#type-casting)
    - [Failable Initializers](#failable-initializers)
    - [Guard](#guard)
    - [Array Enumerated](#array-enumerated)
    - [Array Zip](#array-zip)
    - [Dictionary](#dictionary)
    - [Enum Data Model](#enum-data-model)


- [**UIKit**](#uikit)
    - [UITextField](#uitextfield)
        - [Dismiss Keyboard](#dismiss-keyboard)
    - [Data Manager](#data-manager)
        - [Save and Load Data on Device](#save-and-load-data-on-device)
    - [Table View](#table-view)
        - [Move Row](#move-row)
        - [Delete Row](#delete-row)
    - [Unwind Segue](#unwind-segue)
    - [Prepare Segue](#prepare-segue)
    - [Perform Segue](#perform-segue)
    - [Source](#source)
    - [Destination](#destination)
    - [Pass Data Delegate](#pass-data-delegate)
    - [Pass Data Closure](#pass-data-closure)
    
    
- [**Features**](#features)
   - [Launch Screen](#launch-screen)
   - [Custom View](#custom-view)
   - [Swipe Screen](#swipe-screen)
   - [Add Home Screen Quick Actions](#add-home-screen-quick-actions)
    

- [**Design Patterns**](#design-patterns)
    - [Factory Method](#factory-method)


- [**Leet Code**](#leet-code)
    - [Pascal Triangle](#pascal-triangle)
    - [Spiral Matrix](#spiral-matrix)
    - [Container With Most Water](#container-with-most-water)


## **Clean Code**
Raising code readability in iOS development. Thanks to the application of these tips, your code will become readable, which will further ensure convenience and speed of working with it.


### [Clean Class](https://github.com/lgreydev/Help/blob/master/Help/CleanCode/CleanClass.swift)
The code has a clear structure, due to which the logic is more obvious, the code is easy to read, you can quickly find what you are looking for, and besides, it is just pleasant to look at it.

```swift

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


### [Life Cycle](https://github.com/lgreydev/Help/blob/master/Help/CleanCode/Lifecycle.swift)
We move the logic out of the lifecycle methods into separate methods. The logic inside the methods of the ViewController lifecycle should be moved into separate methods, even if you have to create a method with one line of code. Today one, and tomorrow ten.

```swift

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

```swift

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

```swift

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

```swift

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

```swift

// MARK: - IBOutlets

// MARK: - Public Properties

// MARK: - Private Properties

// MARK: - Initializers

// MARK: - Lifecycle

// MARK: - View Life Cycle

// MARK: - Object Life Cycle

// MARK: - Navigation

// MARK: - Public Methods

// MARK: - Private Methods

// MARK: - IBActions

// MARK: - Actions

// MARK: - Application Shortcut Support

// MARK: - Segue preparation

// MARK: - Table view data source

```

### Semantic Commit

- `feat`: (new feature for the user, not a new feature for build script)
- `fix`: (bug fix for the user, not a fix to a build script)
- `docs`: (changes to the documentation)
- `style`: (formatting, missing semi colons, etc; no production code change)
- `refactor`: (refactoring production code, eg. renaming a variable)
- `test`: (adding missing tests, refactoring tests; no production code change)
- `chore`: (updating grunt tasks etc; no production code change) `chore: release v0.5.3'`


### Shortcut

- Build: `⌘ + B`
- Run: `⌘ + R`
- Test: `⌘ + U`
- Stop: `⌘ + .`
- Clean: `⌘ + ⇧ + K`
- Open quickly: `⇧ + ⌘ + O`
- Code completion: `⌃ + Space`
- Opening a file: `⇧ + ⌘ + O`
- Navigation: `⇧ + ⌘ + J`
- Jump to Definition: `⌃ + ⌘ + J`
- Multiple Cursors: `⌥ + ⌘ + E`
- All Refactor: `⌃ + ⌘ + E`
- Reorder Statements: `⌘ + ⌥ + ( ] or [ )`
- Open Inspectors: `⌥ + ⌘ + 0`
- Open Navigation: `⌘ + 0`

**[⬆ Back to Index](#index)**



## **Protocols**

### [CustomStringConvertible](https://github.com/lgreydev/Help/blob/master/Help/Protocols/CustomStringConvertible.swift)
A type with a customized textual representation.
Types that conform to the CustomStringConvertible protocol can provide their own representation to be used when converting an instance to a string. The String(describing:) initializer is the preferred way to convert an instance of any type to a string. If the passed instance conforms to CustomStringConvertible, the String(describing:) initializer and the print(_:) function use the instance’s custom description property. Accessing a type’s description property directly or using CustomStringConvertible as a generic constraint is discouraged.

```swift

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


### [Equatable](https://github.com/lgreydev/Help/blob/master/Help/Protocols/Equatable.swift)

[Documentation](https://developer.apple.com/documentation/swift/equatable)

```swift

struct User: Equatable {
    let login: String
    let password: Int
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.password == rhs.password
    }
}

let userOne = User(login: "mike", password: 123 )
let userTwo = User(login: "mikeeeee", password: 123 )

userOne == userTwo ? print("login") : print("not login")
// login

```


### [Comparable](https://github.com/lgreydev/Help/blob/master/Help/Protocols/Comparable.swift)

[Documentation](https://developer.apple.com/documentation/swift/comparable/)

```swift

struct User: Comparable {
    
    let name: String
    let money: Int
    
    static func < (lhs: User, rhs: User) -> Bool {
        return lhs.money < rhs.money
    }
}

let mike = User(name: "Mike", money: 50 )
let bob = User(name: "Bob", money: 40 )

mike < bob // false
mike > bob // true

```

**[⬆ Back to Index](#index)**



## **Extensions**

### [IntᐩRandom](https://github.com/lgreydev/Help/blob/master/Help/Extensions/Int+Random.swift)
An extension for Int that returns a random number works with range  of numbers. Negative numbers converts to positive.
- **Example:** 17.random will return 0 to 17 (not including 17).
- **Example:** -5.random, -5 convert to 5, will return 0 to 5 (not including 5).


```swift

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


### [StringᐩCompareNumbers](https://github.com/lgreydev/Help/blob/master/Help/Extensions/String+CompareNumbers.swift)

```swift

// Compare string of numbers
extension String {
    static func ==(lhs: String, rhs: String) -> Bool {
        return lhs.compare(rhs, options: .numeric) == .orderedSame
      }

      static func <(lhs: String, rhs: String) -> Bool {
        return lhs.compare(rhs, options: .numeric) == .orderedAscending
      }

      static func <=(lhs: String, rhs: String) -> Bool {
        return lhs.compare(rhs, options: .numeric) == .orderedAscending || lhs.compare(rhs, options: .numeric) == .orderedSame
      }

      static func >(lhs: String, rhs: String) -> Bool {
        return lhs.compare(rhs, options: .numeric) == .orderedDescending
      }

      static func >=(lhs: String, rhs: String) -> Bool {
        return lhs.compare(rhs, options: .numeric) == .orderedDescending || lhs.compare(rhs, options: .numeric) == .orderedSame
      }
}

```

**[⬆ Back to Index](#index)**



## **Working Code**


### [Error Handling](https://github.com/lgreydev/Help/blob/master/Help/WorkingCode/ErrorHandling.swift)
- Error handler, using the `throws` keyword we indicate that the function can receive an error.
- Using the `throw` key we throw an error into the `NSError` instance.
- `do catch` - this error handler helps to catch the error.
- In this example, we are trying to call the function that we marked with the keyword `throws`.
- Before calling the function, put the `try` keyword.
- If the function gets an error, we catch it `catch`.

```swift

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

```swift

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


```swift

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


```swift

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


### [Array Enumerated](https://github.com/lgreydev/Help/blob/master/Help/WorkingCode/ArrayEnumerated.swift)
[documentation](https://developer.apple.com/documentation/swift/array/1687832-enumerated)

Returns a sequence of pairs (n, x), where n represents a consecutive integer starting at zero and x represents an element of the sequence.

```swift

let emojiArray = ["🥵", "😰", "😇", "😱", "🥶"]

for (index, emoji) in emojiArray.enumerated() {
    print(index, emoji)
}

//0 🥵
//1 😰
//2 😇
//3 😱
//4 🥶

```


### [Array Zip](https://github.com/lgreydev/Help/blob/master/Help/WorkingCode/ArrayZip.swift)
[documentation](https://developer.apple.com/documentation/combine/publishers/autoconnect/zip(_:)/)

Combines elements from another publisher and deliver pairs of elements as tuples.

```swift

let emojiArray = ["🥵", "🥶", "😎", "😱", "😡"]
let strArray = ["Hot", "Cold", "Good"]
var newArray = [(String, String)]()

for value in zip(emojiArray, strArray) {
    newArray.append(value)
}

print(newArray)

// [("🥵", "Hot"), ("🥶", "Cold"), ("😎", "Good")] // Array of Tuple

```


### [Dictionary](https://github.com/lgreydev/Help/blob/master/Help/WorkingCode/Dictionary.swift)
[reduce(into:_:)](https://developer.apple.com/documentation/swift/array/3126956-reduce)

**Dictionary Reduce**

Returns the result of combining the elements of the sequence using the given closure.

```swift

let fruits = ["🍏", "🍓", "🍒", "🍌", "🍏", "🍒", "🍌", "🍌", "🍌", "🍒", "🍒", "🍌", "🍓", "🍓"]

let fruitsCount = fruits.reduce(into: [:]) { counts, fruit in
    counts[fruit, default: 0] += 1
}

fruitsCount // ["🍒": 4, "🍏": 2, "🍓": 3, "🍌": 5]
// [String : Int]

```

**Dictionary Search List**
[updateValue(_:forKey:)](https://developer.apple.com/documentation/swift/dictionary/3127179-updatevalue)
[removeValue(forKey:)](https://developer.apple.com/documentation/swift/dictionary/1641348-removevalue)

```swift
struct Product: Hashable {
    let id: String; // unique identifier
    let name: String;
    let producer: String;

    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}

protocol Library {
    /**
     Adds a new product object to the Library.
     - Parameter product: product to add to the Library
     - Returns: false if the product with same id already exists in the Library, true – otherwise.
    */
    func addNewProduct(product: Product) -> Bool;
    
    /**
     Deletes the product with the specified id from the Library.
     - Returns: true if the product with same id existed in the Library, false – otherwise.
    */
    func deleteProduct(id: String) -> Bool;
    
    /**
     - Returns: 10 product names containing the specified string. If there are several products with the same name, producer's name is appended to product's name.
    */
    func listProductsByName(searchString: String) -> Set<String>;
    
    /**
     - Returns: 10 product names whose producer contains the specified string, ordered by producers.
    */
    func listProductsByProducer(searchString: String) -> [String];
}

class LibraryRepository: Library {
    private var products = [String: Product]()

    func addNewProduct(product: Product) -> Bool {
        return self.products.updateValue(product, forKey: product.id) == nil
    }

    func deleteProduct(id: String) -> Bool {
        return self.products.removeValue(forKey: id) != nil
    }

    func listProductsByName(searchString: String) -> Set<String> {
        return self.products
            .filter({ $1.name.contains(searchString) })
            .prefix(10)
            .reduce(into: Set<String>()) { (productNames, product) in
                if products.filter({ $1.name == product.value.name }).count > 1 {
                    productNames.insert("\(product.value.producer) - \(product.value.name)")
                    return
                }
                productNames.insert(product.value.name)
            }
    }

    func listProductsByProducer(searchString: String) -> [String] {
        return self.products
            .filter({ $1.producer.contains(searchString) })
            .sorted(by: { $0.value.producer > $1.value.producer })
            .prefix(10)
            .map { $0.value.name }
    }
}
```



### [Enum Data Model](https://github.com/lgreydev/Help/blob/master/Help/WorkingCode/EnumDataModel.swift)

```swift

enum Difficulty: String {
    typealias DifficultyContent = (title: String, description: String, levels: Int)
    
    case novice
    case warrior
    case master
    case unknown
    
    var content: DifficultyContent {
        switch self {
        case .novice:
            return (title: "Novice", description: "All Too Easy!", levels: 8)
        case .warrior:
            return (title: "Warrior", description: "You Will Die Mortal!", levels: 10)
        case .master:
            return (title: "Master", description: "You Will Never Win!", levels: 12)
        case .unknown:
            return (title: "Unknown", description: "Unknown!", levels: -1)
        }
    }
}

func showTower(for difficulty: Difficulty) {
    print(difficulty.content.title)
    print(difficulty.content.description)
    print(difficulty.content.levels)
}

let difficulty = Difficulty(rawValue: "novice")

showTower(for: difficulty ?? .unknown)

```

**[⬆ Back to Index](#index)**



## **UIKit**

## UITextField

### [Dismiss Keyboard](https://github.com/lgreydev/Help/blob/master/Help/UIKit/UITextField/DismissKeyboard.swift)

```swift

class DismissKeyboard: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // When user touch on screen
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    // Dismiss keyboard
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

```

## Data Manager

### [Save and Load Data on Device](https://github.com/lgreydev/Help/blob/master/Help/UIKit/DataManager/SaveAndLoadDataOnDevice.swift)
[Documentation - Data Manager](https://developer.apple.com/documentation/foundation/filemanager)<br>
[Documentation - Codable](https://developer.apple.com/documentation/swift/codable)<br>
[Documentation - Decodable](https://developer.apple.com/documentation/swift/decodable)<br>
[Documentation - Encodable](https://developer.apple.com/documentation/swift/encodable)

```swift

class SaveAndLoadDataOnDevice {
    
    // Create an archive file
    var archiveURL: URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError() }
        return documentDirectory.appendingPathComponent("nameFile").appendingPathExtension("plist")
    }
    
    // Decoding an object from an archive
    func loadAll() -> [SameObject]? {
        let decoder = PropertyListDecoder()
        guard let archiveURL = archiveURL else { fatalError() }
        guard let decoderSameObject = try? Data(contentsOf: archiveURL) else { fatalError() }
        return try? decoder.decode([SameObject].self, from: decoderSameObject)
    }
    
    // Encoder the received object into the archive file
    func saveEmojis(_ object: [SameObject]) {
        let encoder = PropertyListEncoder()
        guard let archiveURL = archiveURL else { fatalError() }
        guard let encoderSameObject = try? encoder.encode(object) else { fatalError() }
        try? encoderSameObject.write(to: archiveURL, options: .noFileProtection)
    }
}

// Class have to protocol 'Codable'
class SameObject: Codable {
    
}

```

**[⬆ Back to Index](#index)**



## Table View

### [Move Row](https://github.com/lgreydev/Help/blob/master/Help/UIKit/TableView/MoveRow.swift)
[Documentation](https://developer.apple.com/documentation/uikit/uitableviewdatasource/1614867-tableview)

```swift

class MoveRow: UITableViewController {
    
    var arrayElement = [String]()
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let someRow = arrayElement.remove(at: sourceIndexPath.row)
        arrayElement.insert(someRow, at: destinationIndexPath.row)
    }
}

```

### [Move Row](https://github.com/lgreydev/Help/blob/master/Help/UIKit/TableView/DeleteRow.swift)
[Documentation1](https://developer.apple.com/documentation/uikit/uitableviewdiffabledatasource/3375816-tableview)
[Documentation2](https://developer.apple.com/documentation/uikit/uitableviewdiffabledatasource/3375814-tableview)

```swift

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

```

### [Unwind Segue](https://github.com/lgreydev/Help/blob/master/Help/UIKit/UnwindSegue.swift)
[Articl - Unwind Segue](https://developer.apple.com/documentation/uikit/resource_management/dismissing_a_view_controller_with_an_unwind_segue)

**Dismissing a View Controller with an Unwind Segue**

Configure an unwind segue in your storyboard file that dynamically chooses the most appropriate view controller to display next. 

To handle the dismissal of a view controller, create an unwind segue. Unlike the segues that you use to present view controllers, an unwind segue promises the dismissal of the current view controller without promising a specific target for the resulting transition. Instead, UIKit determines the target of an unwind segue programmatically at runtime. 

UIKit determines the target of an unwind segue at runtime, so you aren’t restricted in how you set up your view controller hierarchies. Consider a scenario where two view controllers present the same child view controller, as shown in the following figure. You could add complicated logic to determine which view controller to display next, but such a solution wouldn’t scale well. Instead, UIKit provides a simple programmatic solution that scales to any number of view controllers with minimal effort.

```swift

@IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
    // Connect a Triggering Object to the Exit Control
}

```
<img src="https://github.com/lgreydev/Help/blob/master/Screenshots/segue-002.png" width="350"><img src="https://github.com/lgreydev/Help/blob/master/Screenshots/segue-001.png" width="350">



### [Prepare Segue](https://github.com/lgreydev/Help/blob/master/Help/UIKit/PrepareSegue.swift)
[Documentation](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621490-prepare)

`prepare(for:sender:)`
Notifies the view controller that a segue is about to be performed.

The default implementation of this method does nothing. Subclasses override this method and use it to configure the new view controller prior to it being displayed. The segue object contains information about the transition, including references to both view controllers that are involved.

Because segues can be triggered from multiple sources, you can use the information in the segue and sender parameters to disambiguate between different logical paths in your app. For example, if the segue originated from a table view, the sender parameter would identify the table view cell that the user tapped. You could then use that information to set the data on the destination view controller.


```swift

func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == "identifier segue" else { fatalError() }
    guard let secondVC = segue.destination as? SecondViewController else { fatalError() }
        secondVC?.property = "text
}

```

**Parameters**

`segue` The segue object containing information about the view controllers involved in the segue. 

`sender`  The object that initiated the segue. You might use this parameter to perform different actions based on which control (or other object) initiated the segue.
    
**Accessing the Segue Attributes** 

`var source: UIViewController`   The source view controller for the segue.

`var destination: UIViewController`  The destination view controller for the segue.

`var identifier: String?`  The identifier for the segue object.
        


### [Perform Segue](https://github.com/lgreydev/Help/blob/master/Help/UIKit/PerformSegue.swift)
[Documentation](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621413-performsegue)

Initiates the segue with the specified identifier from the current view controller's storyboard file.

```swift

func performSegue(withIdentifier identifier: String, sender: Any?)

```

**Parameters**

`identifier` The string that identifies the triggered segue. In Interface Builder, you specify the segue’s identifier string in the attributes inspector.

This method throws an Exception handling if there is no segue with the specified identifier.

`sender` The object that you want to use to initiate the segue. This object is made available for informational purposes during the actual segue.

**Discussion**

Normally, segues are initiated automatically and not using this method. However, you can use this method in cases where the segue could not be configured in your storyboard file. For example, you might call it from a custom action handler used in response to shake or accelerometer events.

The current view controller must have been loaded from a storyboard. If its storyboard property is nil, perhaps because you allocated and initialized the view controller yourself, this method throws an exception.


### [Source](https://github.com/lgreydev/Help/blob/master/Help/UIKit/Source.swift)
[Documentation](https://developer.apple.com/documentation/uikit/uistoryboardsegue/1621918-source)

```swift

class Source: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let source = segue.source as! OtherSource
        source.property = 1
    }
}

class OtherSource: UIViewController {
    var property = 0
}

```


### [Destination](https://github.com/lgreydev/Help/blob/master/Help/UIKit/Destination.swift)
[Documentation](https://developer.apple.com/documentation/uikit/uistoryboardsegue/1621916-destination)

```swift

class Destination: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! OtherDestination
        destination.property = 1
    }
}

class OtherDestination: UIViewController {
    var property = 0
}

```

### [Pass Data Delegate](https://github.com/lgreydev/Help/blob/master/Help/UIKit/PassDataDelegate.swift)

```swift

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

```


### [Pass Data Closure](https://github.com/lgreydev/Help/blob/master/Help/UIKit/PassDataClosure.swift)
#### Callbacks

```swift

class FirstViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else { fatalError() }
        secondVC.closure = { [weak self] text in
            self?.textLabel.text = text
        }
    }
}


class SecondViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var closure: ((String) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        closure?("I can pass data by closure")
        dismiss(animated: true, completion: nil)
    }
}

```

**[⬆ Back to Index](#index)**



## **Features**

### [Launch Screen](https://github.com/lgreydev/Help/blob/master/Help/Features/LaunchScreen.swift)

[Watch video](https://youtu.be/QpShzjq8q8g)<br>
[Watch project](https://github.com/lgreydev/LaunchScreen)

```swift

class LogoViewController: UIViewController {
    
    // MARK: - Private Properties
    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "logo-icon")
        return imageView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
            self.performSegue(withIdentifier: "welcomeVC", sender: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.animate()
        }
    }
    
    
    // MARK: - Private Methods
    private func animate() {
        UIView.animate(withDuration: 1.7) {
            let size = self.view.frame.size.width * 2.5
            let diffX = size - self.view.frame.width
            let diffY = self.view.frame.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size)
            self.imageView.alpha = 0
        }
    }
}
 
 
 class WelcomeViewController: UIViewController {
     
     override func viewDidLoad() {
         super.viewDidLoad()

     }
 }
 
 ```

### [Custom View](https://github.com/lgreydev/Help/blob/master/Help/Features/CustomView.swift)

[Article](https://medium.com/@umairhassanbaig/ios-swift-creating-a-custom-view-with-xib-ace878cd41c5)

``` swift

class PersonView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
        
    let contentXibName = "PersonView"
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        func commonInit() {
            Bundle.main.loadNibNamed(contentXibName, owner: self, options: nil)
            contentView.fixInView(self)
        }
}

extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}

```


### [Swipe Screen](https://github.com/lgreydev/Help/blob/master/Help/Features/SwipeScreen.swift)

``` swift

private func configureSwipe() {
    let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
    swipeRight.direction = .right
    self.view.addGestureRecognizer(swipeRight)
    
    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
    swipeLeft.direction = .left
    self.view.addGestureRecognizer(swipeLeft)
}

@objc
private func respondToSwipeGesture(gesture: UIGestureRecognizer) {
    if let swipeGesture = gesture as? UISwipeGestureRecognizer {
        switch swipeGesture.direction {
        case .right:
        print("right swipe")
        // add action!
        case .left:
        print("left swipe")
        // add action!
        default:
            break
        }
    }
}

```

**[⬆ Back to Index](#index)**



## **Design Patterns**
[Book Design Patterns](https://en.wikipedia.org/wiki/Design_Patterns)

### [Factory Method](https://github.com/lgreydev/Help/blob/master/Help/DesignPatterns/FactoryMethod.swift)
[Factory Method RU](https://refactoring.guru/ru/design-patterns/factory-method)

``` swift

// structure Factory Method
// MARK: Creator
class FactoryProducts {
    
    static let defaultFactory = FactoryProducts()
    
    func createProduct(_ product: Products) -> Product {
        switch product {
        case .productA: return ConcreteProductA()
        case .productB: return ConcreteProductB()
        }
    }
    
    private init() {}
}

enum Products {
    case productA
    case productB
}

// MARK: Product Interface
protocol Product {
    var id: String { get }
    var name: String { get }
    
    func printProduct()
}


// MARK: Product A
class ConcreteProductA: Product {
    
    var name: String = "Product A"
    var id: String = "1"
    
    func printProduct() {
        print("id: \(id), name: \(name)")
    }
}

// MARK: Product B
class ConcreteProductB: Product {
    
    var name: String = "Product B"
    var id: String = "2"
    
    func printProduct() {
        print("id: \(id), name: \(name)")
    }
}


// MARK: Implementation
class SomeViewController: UIViewController {
    
    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addProduct(.productA)
        addProduct(.productB)
        allProducts()
    }
    
    func addProduct(_ product: Products) {
        let newProduct = FactoryProducts.defaultFactory.createProduct(product)
        products.append(newProduct)
    }
    
    func allProducts() {
        products.forEach { $0.printProduct() }
    }
}


```

**[⬆ Back to Index](#index)**



## **Leet Code**

### [Pascal Triangle](https://github.com/lgreydev/Help/blob/master/Help/LeetCode/Pascal'sTriangle.swift)
 
  Given an integer numRows, return the first numRows of Pascal's triangle.<br>
 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown: <br>
 
 <img src="https://github.com/lgreydev/Help/blob/master/Screenshots/PascalTriangleAnimated2.gif" width="350">
 
 **Example 1:**<br>
 *Input:* `numRows = 5`<br>
 *Output:* `[[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]`<br>
 
 **Example 2:**<br>
 *Input:* `numRows = 1`<br>
 *Output:* `[[1]]`

``` swift

func generate(_ numRows: Int) -> [[Int]] {
    
    guard numRows > 0 else { return [] }
    if numRows == 1 { return [[1]] }
    
    var results = [[Int]]()
    results.append([1])
    
    for x in 1..<numRows {
        var newRow = [1]
        let prevRow = results[x - 1]
        
        for j in 1..<prevRow.count {
            let sum = prevRow[j] + prevRow[j - 1]
            newRow.append(sum)
        }
        newRow.append(1)
        results.append(newRow)
    }

    return results
}

```



### [Spiral Matrix](https://github.com/lgreydev/Help/blob/master/Help/LeetCode/SpiralMatrix.swift)
  
  Given an m x n matrix, return all elements of the matrix in spiral order.<br>
 
 <img src="https://github.com/lgreydev/Help/blob/master/Screenshots/spiral1.jpg" width="350"><img src="https://github.com/lgreydev/Help/blob/master/Screenshots/spiral.jpg" width="350">
 
**Example 1:**<br>
> **Input:** `matrix = [[1,2,3],[4,5,6],[7,8,9]]`<br>
> **Output:** `[1,2,3,6,9,8,7,4,5]`<br>
 
**Example 2:**<br>
> **Input:** `matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]`<br>
> **Output:** `[1,2,3,4,8,12,11,10,9,5,6,7]`

``` swift

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var result = [Int]()
    
    if matrix.count == 0 || matrix[0].count == 0 {
        return result
    }
    
    var left = 0
    var bottom = matrix.count - 1
    var top = 0
    var right = matrix[0].count - 1
    
    while (left <= bottom && top <= right) {
        // Go left to right
        for col in stride(from: top, through: right, by: 1) {
            result.append(matrix[left][col])
        }
        // Go top to down
        left += 1
        for row in stride(from: left, through: bottom, by: 1) {
            result.append(matrix[row][right])
        }
        // Go right to left
        right -= 1
        if left <= bottom {
            for col in stride(from: right, through: top, by: -1) {
                result.append(matrix[bottom][col])
            }
            bottom -= 1
        }
        // Go up
        if top <= right {
            for row in stride(from: bottom, through: left, by: -1) {
                result.append(matrix[row][top])
            }
            top += 1
        }
    }
    return result
}

```



### [Container With Most Water](https://github.com/lgreydev/Help/blob/master/Help/LeetCode/ContainerWithMostWater.swift)

 You are given an integer array `height` of length `n`. There are n vertical lines drawn such that the two endpoints of the `ith` line are `(i, 0)` and `(i, height[i])`.
 
 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the maximum amount of water a container can store.
 
 **Notice** that you may not slant the container.
 
 
**Example 1:**<br>
 
  <img src="https://github.com/lgreydev/Help/blob/master/Screenshots/ContainerWithMostWater.jpg" width="450">
 
 
> **Input:** `height = [1,8,6,2,5,4,8,3,7]` <br>
> **Output:** `49` <br>
> **Explanation:** The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 
**Example 2:**<br>
> **Input:** `height = [1,1]`<br>
> **Output:** `1`<br>
 
``` swift

func maxArea(_ height: [Int]) -> Int {
    guard !height.isEmpty else { return -1 }
    
    var maxArea = 0
    var left = 0
    var right = height.count - 1
    
    while left < right {
        // Re-calc maxArea
        let minHeight = min(height[left], height[right])
        let currentHeight = minHeight * (right - left)
        maxArea = max(maxArea, currentHeight)

        // Move pointers
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    return maxArea
}

let input = [1, 8, 6, 2, 5, 4, 8, 3, 7]
let result = maxArea(input)
//print("Result: \(result)")

```

**[⬆ Back to Index](#index)**



### 🛡️ License

This project is licensed under the MIT License - see the [`LICENSE`](https://github.com/lgreydev/Help/blob/master/License) file for details.

### 🙏 Support

This project needs a ⭐️ from you. Don't forget to leave a star ⭐️

### 😎 Contributing
Sergey Lukaschuk ✉️ s.lukaschuk@yahoo.com
