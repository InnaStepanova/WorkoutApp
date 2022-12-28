//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by Лаванда on 28.12.2022.
//

import UIKit

final class OwerviewNavigationBar: BaseView {
    let allWorkoutButton = SecondaryButton()
    let addButton = UIButton()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorser(with: Resources.Colors.separator, and: 1)
    }
    func addAllWorkoutAction(_ action: Selector, with target: Any?) {
        allWorkoutButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addButtonAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

@objc extension OwerviewNavigationBar {
    override func configure() {
        super.configure()
        backgroundColor = .white
        
        allWorkoutButton.addTitle(Resources.Strings.TabBar.allWorcoutButton)
    
        addButton.setImage(Resources.Images.TabBar.addBotton, for: .normal)
        
        titleLabel.text = Resources.Strings.TabBar.navBarTitle
        titleLabel.textColor = Resources.Colors.titleNavBar
        titleLabel.font = Resources.Fonts.helveticaRegular(with: 22)
    }
    override func addViews() {
        addView(allWorkoutButton)
        addView(addButton)
        addView(titleLabel)
    }
    
    override func layoutViews() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutButton.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            allWorkoutButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutButton.leadingAnchor)
        ])
    }
}
