//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Лаванда on 26.12.2022.
//

import UIKit

class SessionController: BaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        addNavBarButton(at: .left, and: "Pause")
        addNavBarButton(at: .right, and: "Finish")
    }
}
