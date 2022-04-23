//
//  AutoLayoutConstraintsProgrammatically.swift
//  Help
//
//  Created by Sergey Lukaschuk on 22.04.2022.
//

import UIKit

class AutoLayoutConstraintsProgrammatically: UIViewController {

    private let blueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .link
        return view
    }()

    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    private let imageView_1: UIImageView = {
        let image = UIImage(named: "github")
        let view = UIImageView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let imageView_2: UIImageView = {
        let image = UIImage(named: "github")
        let view = UIImageView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addConstraints()
    }
}

extension AutoLayoutConstraintsProgrammatically {

    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()

        view.addSubview(blueView)
        // Offset from the edges
        constraints.append(blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(blueView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor))

        // Safe Area
//        constraints.append(blueView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
//        constraints.append(blueView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
//        constraints.append(blueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
//        constraints.append(blueView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))

        // With constant
//        constraints.append(blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100))
//        constraints.append(blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -100))
//        constraints.append(blueView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100))
//        constraints.append(blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100))

        view.addSubview(redView)
        // Size Height and Width
        constraints.append(redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3))
        constraints.append(redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3))

        // Center alignment
        constraints.append(redView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(redView.centerYAnchor.constraint(equalTo: view.centerYAnchor))

        // Image 1
        view.addSubview(imageView_1)
        constraints.append(imageView_1.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(imageView_1.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(imageView_1.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(imageView_1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20))

        // Image 2
        view.addSubview(imageView_2)
        imageView_2.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView_2.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView_2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView_2.topAnchor.constraint(equalTo: imageView_1.bottomAnchor, constant: 20).isActive = true

        NSLayoutConstraint.activate(constraints)
    }
}
