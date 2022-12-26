//
//  BaceController.swift
//  WorkoutApp
//
//  Created by Лаванда on 26.12.2022.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

@objc extension BaseController {
    func addViews() {}
    func layout() {}
    func configure() {
        view.backgroundColor = Resources.Colors.background
    }
    func leftBarButtonPressed() {
        
    }
    
    func rightBarButtonPressed() {
        
    }
}

extension BaseController {
//    Добавляем полоску под NavBar
    func addNavBarButton(at position: NavBarPosition, and title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Colors.active, for: .normal)
        button.setTitleColor(Resources.Colors.inActive, for: .disabled)
        button.titleLabel?.font = Resources.Fonts.helveticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(leftBarButtonPressed), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(rightBarButtonPressed), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
