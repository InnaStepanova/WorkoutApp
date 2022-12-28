//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Лаванда on 27.12.2022.
//

import UIKit

final class SecondaryButton: UIButton {
    
    private let label = UILabel()
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configure()
        makeSustemButton(self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTitle(_ title: String) {
        label.text = title
    }
}

private extension SecondaryButton {
    func addViews() {
        addSubview(label)
        addSubview(iconView)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo:iconView.leadingAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        
    }
    
    func configure() {
        backgroundColor = Resources.Colors.allWorkoutButton
        layer.cornerRadius = 14
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Resources.Colors.active
        label.font = Resources.Fonts.helveticaRegular(with: 15)
        label.textAlignment = .center
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = Resources.Images.TabBar.allWorkoutsArrov!.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = Resources.Colors.active
    }
}
