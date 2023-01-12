//
//  CompletedView.swift
//  WorkoutApp
//
//  Created by Лаванда on 12.01.2023.
//

import UIKit

extension TimerView {
    final class CompletedView: BaseView {
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: 13)
            label.textColor = Resources.Colors.inActive
            return label
        }()
        
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helveticaRegular(with: 25)
            label.textColor = Resources.Colors.titleNavBar
            return label
        }()
        
        private let stackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .fillProportionally
            stack.alignment = .center
            stack.spacing = 6
            return stack
        }()
    }
}

extension TimerView.CompletedView {

    override func addViews() {
        addView(stackView)
        stackView.addArrangedSubview(percentLabel)
        stackView.addArrangedSubview(titleLabel)
    }
    
    override func layoutViews() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    func configure(with title: String, and percent: Int) {
        titleLabel.text = title
        percentLabel.text = ("\(percent)%")
    }
}
