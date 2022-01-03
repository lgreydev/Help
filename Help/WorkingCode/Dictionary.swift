//
//  Dictionary.swift
//  Help
//
//  Created by Sergey Lukaschuk on 25.06.2021.
//

import Foundation


// MARK:  Dictionary Reduce


let fruits = ["🍏", "🍓", "🍒", "🍌", "🍏", "🍒", "🍌", "🍌", "🍌", "🍒", "🍒", "🍌", "🍓", "🍓"]

let fruitsCount = fruits.reduce(into: [:]) { counts, fruit in
    counts[fruit, default: 0] += 1
}

// fruitsCount
// ["🍒": 4, "🍏": 2, "🍓": 3, "🍌": 5]
// [String : Int]



// MARK: Dictionary Search List

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

func test(lib: Library) {
    assert(!lib.deleteProduct(id: "1"))
    assert(lib.addNewProduct(product: Product(id: "1", name: "1", producer: "Lex")))
    assert(!lib.addNewProduct(product: Product(id: "1", name: "any name because we check id only", producer: "any producer")))
    assert(lib.deleteProduct(id: "1"))
    assert(lib.addNewProduct(product: Product(id: "3", name: "Some Product3", producer: "Some Producer2")))
    assert(lib.addNewProduct(product: Product(id: "4", name: "Some Product1", producer: "Some Producer3")))
    assert(lib.addNewProduct(product: Product(id: "2", name: "Some Product2", producer: "Some Producer2")))
    assert(lib.addNewProduct(product: Product(id: "1", name: "Some Product1", producer: "Some Producer1")))
    assert(lib.addNewProduct(product: Product(id: "5", name: "Other Product5", producer: "Other Producer4")))
    assert(lib.addNewProduct(product: Product(id: "6", name: "Other Product6", producer: "Other Producer4")))
    assert(lib.addNewProduct(product: Product(id: "7", name: "Other Product7", producer: "Other Producer4")))
    assert(lib.addNewProduct(product: Product(id: "8", name: "Other Product8", producer: "Other Producer4")))
    assert(lib.addNewProduct(product: Product(id: "9", name: "Other Product9", producer: "Other Producer4")))
    assert(lib.addNewProduct(product: Product(id: "10", name: "Other Product10", producer: "Other Producer4")))
    assert(lib.addNewProduct(product: Product(id: "11", name: "Other Product11", producer: "Other Producer4")))

    var byNames: Set<String> = lib.listProductsByName(searchString: "Product")
    assert(byNames.count == 10)

    byNames = lib.listProductsByName(searchString: "Some Product")
    assert(byNames.count == 4)
    assert(byNames.contains("Some Producer3 - Some Product1"))
    assert(byNames.contains("Some Product2"))
    assert(byNames.contains("Some Product3"))
    assert(!byNames.contains("Some Product1"))
    assert(byNames.contains("Some Producer1 - Some Product1"))

    var byProducer: [String] = lib.listProductsByProducer(searchString: "Producer")
    assert(byProducer.count == 10)

    byProducer = lib.listProductsByProducer(searchString: "Some Producer")
    assert(byProducer.count == 4)
    assert(byProducer[0] == "Some Product1")
    assert(byProducer[1] == "Some Product2" || byProducer[1] == "Some Product3")
    assert(byProducer[2] == "Some Product2" || byProducer[2] == "Some Product3")
    assert(byProducer[3] == "Some Product1")
}

//test(lib: LibraryRepository())
