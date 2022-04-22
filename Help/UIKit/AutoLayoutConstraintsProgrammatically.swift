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

    override func viewDidLoad() {
        super.viewDidLoad()

        addConstraints()
    }
}

extension AutoLayoutConstraintsProgrammatically {

    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()

        view.addSubview(blueView)
        constraints.append(blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(blueView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor))

        view.addSubview(redView)

        // Width and height
        constraints.append(redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5))
        constraints.append(redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5))

        // Center
        constraints.append(redView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(redView.centerYAnchor.constraint(equalTo: view.centerYAnchor))

        NSLayoutConstraint.activate(constraints)
    }
}
