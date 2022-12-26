//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Лаванда on 26.12.2022.
//

import UIKit

class ProgressController: BaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Workout progress"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.progress
        addNavBarButton(at: .left, and: "Export")
        addNavBarButton(at: .right, and: "Details")
    }
}
