//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Лаванда on 06.01.2023.
//

import UIKit

final class TimerView: BaseInfoView {
    
    let progressView: ProgressView = {
        let view = ProgressView()
        view.drawProgressView(persent: 0.7)
        return view
    }()
    
}
extension TimerView {
    
    override func configure() {
        super.configure()
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.widthAnchor.constraint(equalTo: progressView.heightAnchor)
        ])
        
    }
    
    override func addViews() {
        super.addViews()
        addView(progressView)
    }
}
