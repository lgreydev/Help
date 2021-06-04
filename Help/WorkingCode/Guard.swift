//
//  Guard.swift
//  Help
//
//  Created by Sergey Lukaschuk on 04.06.2021.
//

import Foundation

// MARK: Guard Statement
/// A guard statement is used to transfer program control out of a scope if one or more conditions aren’t met.
/// A guard statement has the following form:

/*
guard condition else {
    statements
}
*/

/// The value of any condition in a guard statement must be of type Bool or a type bridged to Bool. The condition can also be an optional binding declaration, as discussed in Optional Binding.
/// Any constants or variables assigned a value from an optional binding declaration in a guard statement condition can be used for the rest of the guard statement’s enclosing scope.
/// The else clause of a guard statement is required, and must either call a function with the Never return type or transfer program control outside the guard statement’s enclosing scope using one of the following statements:

/// return
/// break
/// continue
/// throw

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

//printMyFood(eating: breakfast) // print object
//printMyFood(eating: lunch) // error
