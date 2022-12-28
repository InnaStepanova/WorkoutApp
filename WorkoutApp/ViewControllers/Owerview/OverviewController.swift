//
//  OverviewController.swift
//  WorkoutApp
//
//  Created by Лаванда on 26.12.2022.
//

import UIKit

class OverviewController: BaseController {
    let overviewNavBar = OwerviewNavigationBar()
    
    
    override func viewDidLoad() {
        addViews()
        layoutViews()
        configure()
    }
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
            overviewNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overviewNavBar.heightAnchor.constraint(equalToConstant: 120)
 ])
    }
    
    override func addViews() {
        super.addViews()
        view.addView(overviewNavBar)
    }
}

