
# **Help**

In this project, I have collected various best practices and iOS development tips. This is my personal development assistant.

- [**Clean Code**](#clean-code)
    - [Clean Class](#clean-class)
    - [Life Cycle](#life-cycle)
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
    - [Array Enumerated](#array-enumerated)
    - [Array Zip](#array-zip)
    - [Dictionary Reduce](#dictionary-reduce)


- [**UIKit**](#uikit)
    - [Unwind Segue](#unwind-segue)
    - [Prepare Segue](#prepare-segue)
    - [Perform Segue](#perform-segue)
    - [Pass Data Delegate](#pass-data-delegate)
    - [Pass Data Closure](#pass-data-closure)
    
    
- [**Features**](#features)
   - [Launch Screen](#launch-screen)
    

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

// MARK: - Public Methods

// MARK: - Private Methods

// MARK: - IBActions

```


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


## **Extensions**


### [Int Random](https://github.com/lgreydev/Help/blob/master/Help/Extensions/Int+Random.swift)
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


### [Dictionary Reduce](https://github.com/lgreydev/Help/blob/master/Help/WorkingCode/DictionaryReduce.swift)
[documentation](https://developer.apple.com/documentation/swift/array/3126956-reduce)

Returns the result of combining the elements of the sequence using the given closure.

```swift

let fruits = ["🍏", "🍓", "🍒", "🍌", "🍏", "🍒", "🍌", "🍌", "🍌", "🍒", "🍒", "🍌", "🍓", "🍓"]

let fruitsCount = fruits.reduce(into: [:]) { counts, fruit in
    counts[fruit, default: 0] += 1
}

fruitsCount // ["🍒": 4, "🍏": 2, "🍓": 3, "🍌": 5]
// [String : Int]

```


## **UIKit**

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
    
    if segue.destination is DestinationViewController {
            let vc = segue.destination as? DestinationViewController
            vc?.property = "text"
        }
    
    if segue.source is SourceViewController {
            let vc = segue.source as? SourceViewController
            vc?.property = "text"
        }
        
        /// or >>
        
    if let vc = segue.destination as? DestinationViewController {
            vc.property = "text"
        }
        
    if let vc = segue.destination as? SourceViewController {
            vc.property = "text"
        }
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


### [Pass Data Delegate](https://github.com/lgreydev/Help/blob/master/Help/UIKit/PassDataDelegate.swift)

```swift

protocol MyDelegate: AnyObject {
    func set(title: String)
}

class MainViewController: UIViewController, MyDelegate {
    
    @IBOutlet weak var labelText: UILabel! // title 1
    @IBOutlet weak var textField: UITextField!
    
    var text: String?
    
    @IBAction func buttonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "1", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //guard segue.identifier == "123" else { fatalError() }
        /// SecondaryViewController
        if let vc = segue.destination as? SecondaryViewController {
            vc.text = textField.text
            vc.delegate = self
        }
    }
    
    /// protocol implementation
    func set(title: String) {
        labelText.text = title
    }
}

class SecondaryViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel! // title 2
    @IBOutlet weak var textField: UITextField!
    
    var text: String?
    weak var delegate: MyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        textLabel?.text = text
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        delegate?.set(title: textField.text ?? "nil")
        dismiss(animated: true, completion: nil)
    }
}

```


### [Pass Data Closure](https://github.com/lgreydev/Help/blob/master/Help/UIKit/PassDataClosure.swift)

```swift

class MainViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var text: String?
    
    @IBAction func buttonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "1", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //guard segue.identifier == "123" else { fatalError() }
        
        /// SecondaryViewController
        if let vc = segue.destination as? SecondaryViewController {
            vc.text = textField.text
            
            /// closure
            vc.dataClosure = { [weak self] text in
                self?.labelText.text = text
            }
        }
    }
}

class SecondaryViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel! // title 2
    @IBOutlet weak var textField: UITextField!
    
    var text: String?
    
    typealias MyClosure = (String) -> () // closure
    var dataClosure: MyClosure? // closure
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        dataClosure?(textField.text ?? "nil") // closure
        dismiss(animated: true, completion: nil)
    }
    
    func updateView() {
        textLabel?.text = text
    }
}

```


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

