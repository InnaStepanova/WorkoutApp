//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Лаванда on 26.12.2022.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView = TimerView()
    private let timerDuration: Double = 10.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func leftBarButtonPressed() {
        if timerView.state == .isStopped {
            timerView.startTimer()
            timerView.state = .isRunning
            setTitleForNavBarButton(title: "Pause", at: .left)
        } else {
            timerView.pausedTimer()
            timerView.state = .isStopped
            setTitleForNavBarButton(title: "Start  ", at: .left)
        }
    }
    
    override func rightBarButtonPressed() {
        timerView.stopTimer()
        timerView.state = .isStopped
        setTitleForNavBarButton(title: "Start  ", at: .left)
    }
}

extension SessionController {
    override func configure() {
        super.configure()
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        addNavBarButton(at: .left, and: timerView.state == .isStopped ? "Start   " : "Pause")
        addNavBarButton(at: .right, and: "Finish")
        timerView.configure(with: timerDuration, progress: 0)
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
//            timerView.heightAnchor.constraint(equalToConstant: 350)
            
        ])
    }
}
