//
//  NavBarController.swift
//  WorkoutApp
//
//  Created by Лаванда on 26.12.2022.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.titleNavBar,
            .font: Resources.Fonts.helveticaRegular(with: 17)]
        view.addBottomBorser(with: Resources.Colors.background, and: 1)
    }
}
