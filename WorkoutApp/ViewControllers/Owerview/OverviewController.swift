//
//  OverviewController.swift
//  WorkoutApp
//
//  Created by Лаванда on 26.12.2022.
//

import UIKit

class OverviewController: BaseController {
    let overviewNavBar = OwerviewNavigationBar()
    
}

extension OverviewController {
    
    override func configure() {
        super.configure()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            overviewNavBar.topAnchor.constraint(equalTo: view.topAnchor),
            overviewNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overviewNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
 ])
    }
    
    override func addViews() {
        super.addViews()
        view.addView(overviewNavBar)
    }
}

