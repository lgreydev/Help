//
//  FailableInitializers.swift
//  Help
//
//  Created by Sergey Lukaschuk on 03.06.2021.
//

import Foundation

// MARK: Failable Initializers

/// t’s sometimes useful to define a class, structure, or enumeration for which initialization can fail. This failure might be triggered by invalid initialization parameter values, the absence of a required external resource, or some other condition that prevents initialization from succeeding.

/// To cope with initialization conditions that can fail, define one or more failable initializers as part of a class, structure, or enumeration definition. You write a failable initializer by placing a question mark after the init keyword (init?).


struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let cat = Animal(species: "") // nil
let dog = Animal(species: "Mammal") // Animal




