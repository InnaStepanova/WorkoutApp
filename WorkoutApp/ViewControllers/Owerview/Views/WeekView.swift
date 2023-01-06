//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Лаванда on 28.12.2022.
//

import UIKit

final class WeekView: BaseView {
    
    private let stackView = UIStackView()
    private let calendar = Calendar.current
    
}

@objc extension WeekView {
    override func configure() {
        super.configure()
        print("Configure")
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekdays = calendar.veryShortWeekdaySymbols
        print(weekdays)
        
        if calendar.firstWeekday == 1 {
            let sunday = weekdays.remove(at: 0)
            weekdays.append(sunday)
            print(weekdays)
        }
        
        weekdays.enumerated().forEach { index, name in
            let view = WeekDayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
        }
        
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func addViews() {
        super.addViews()
        addView(stackView)
    }
}
