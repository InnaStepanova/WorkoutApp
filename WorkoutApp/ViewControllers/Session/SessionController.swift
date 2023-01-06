//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Лаванда on 26.12.2022.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView: TimerView = {
        let view = TimerView()
            
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        addNavBarButton(at: .left, and: "Pause")
        addNavBarButton(at: .right, and: "Finish")
    }
}

extension SessionController {
    override func configure() {
        super.configure()
    }
    
    override func addViews() {
        super.addViews()
        view.addView(timerView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 350)
            
        ])
    }
}
