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
class FactoryExercises {
    
    static let defaultFactory = FactoryExercises()
    
    func createExercise(name: Exercises) -> Exercise {
        switch name {
        case .jumping: return Jumping()
        case .running: return Running()
        }
    }
    
    private init() {}
}

enum Exercises {
    case jumping
    case running
}

// MARK: Product Interface
protocol Exercise {
    var name: String { get }
    var type: String { get }
    
    func start()
    func stop()
}


// MARK: Product A
class Jumping: Exercise {
    
    var name: String = "Jumping"
    var type: String = "Exercise for legs"
    
    func start() {
        print("Start exercise for legs")
    }
    
    func stop() {
        print("Stop exercise for legs")
    }
}

// MARK: Product B
class Running: Exercise {
    
    var name: String = "Running"
    var type: String = "Exercise for running"
    
    func start() {
        print("Start exercise for running")
    }
    
    func stop() {
        print("Stop exercise for running")
    }
}


// MARK: Implementation
class SomeViewController: UIViewController {
    
    var workout: [Exercise] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addExercise(.jumping)
        addExercise(.running)
        myWorkout()
        startWorkout()
        stopWorkout()
    }
    
    func addExercise(_ exercise: Exercises) {
        let newExercise = FactoryExercises.defaultFactory.createExercise(name: exercise)
        workout.append(newExercise)
    }
    
    func myWorkout() {
        workout.forEach { print($0.name) }
    }

    func startWorkout() {
        workout.forEach { $0.start() }
    }
    
    func stopWorkout() {
        workout.forEach { $0.stop() }
    }
    
}
