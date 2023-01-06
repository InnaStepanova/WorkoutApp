//
//  WeekDayView.swift
//  WorkoutApp
//
//  Created by Лаванда on 28.12.2022.
//

import UIKit

extension WeekView {
    final class WeekDayView: BaseView {
        
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        
        func configure(with index: Int, and name: String) {
            let startOfweek = Date().startOfWeek
            let currentDay = startOfweek.agoForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            let isToday = currentDay.stripTime() == Date().stripTime()
            
            backgroundColor = isToday ? Resources.Colors.active : Resources.Colors.background
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isToday ? .white : Resources.Colors.inActive
            
            dateLabel.text = "\(day)"
            dateLabel.textColor = isToday ? .white : Resources.Colors.inActive
        }
    }
}

extension WeekView.WeekDayView {
    override func configure() {
        super.configure()
     
        stackView.spacing = 3
        stackView.axis = .vertical
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        nameLabel.textAlignment = .center
        dateLabel.textAlignment = .center
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func addViews() {
        super.addViews()
        addView(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
}
