//
//  ErrorHandling.swift
//  Help
//
//  Created by Sergey Lukaschuk on 02.06.2021.
//

import Foundation


// MARK: - Error Handling
/// Error handler, using the 'throws' keyword we indicate that the function can receive an error.
/// Using the 'throw' key we throw an error into the 'NSError' instance.
/// do catch - this error handler helps to catch the error.
/// In this example, we are trying to call the function that we marked with the keyword 'throws'.
/// Before calling the function, put the 'try' keyword.
/// If the function gets an error, we catch it 'catch'.

/*
 
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

*/
