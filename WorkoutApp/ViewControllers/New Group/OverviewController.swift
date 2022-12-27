//
//  OverviewController.swift
//  WorkoutApp
//
//  Created by Лаванда on 26.12.2022.
//

import UIKit

class OverviewController: BaseController {
    
    let allWorkoutButton = SecondaryButton()
    
    override func viewDidLoad() {
        configure()
        addViews()
        layoutViews()
    }
}

extension OverviewController {
    
    override func configure() {
        super.configure()
        allWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutButton.addTitle(Resources.Strings.TabBar.allWorcoutButton)
        allWorkoutButton.addTarget(self, action: #selector(allWorkoutAction), for: .touchUpInside)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            allWorkoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkoutButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    override func addViews() {
        super.addViews()
        view.addSubview(allWorkoutButton)
    }
}

@objc extension OverviewController {
    private func allWorkoutAction() {}
}
