//
//  FactoryMethod.swift
//  Help
//
//  Created by Sergey Lukaschuk on 06.01.2022.
//

import Foundation
import UIKit

// structure Factory Method
// MARK: Creator
class FactoryProducts {
    
    static let defaultFactory = FactoryProducts()
    
    func createProduct(_ product: Products) -> Product_ {
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
protocol Product_ {
    var id: String { get }
    var name: String { get }
    
    func printProduct()
}


// MARK: Product A
class ConcreteProductA: Product_ {
    
    var name: String = "Product A"
    var id: String = "1"
    
    func printProduct() {
        print("id: \(id), name: \(name)")
    }
}

// MARK: Product B
class ConcreteProductB: Product_ {
    
    var name: String = "Product B"
    var id: String = "2"
    
    func printProduct() {
        print("id: \(id), name: \(name)")
    }
}


// MARK: Implementation
class SomeViewController: UIViewController {
    
    var products: [Product_] = []

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
