//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Лаванда on 27.12.2022.
//

import UIKit

enum BaceButtonType {
    case bace
    case custom
}

final class BaceButton: UIButton {
    private var type : BaceButtonType = .bace
    private let label = UILabel()
    private let iconView = UIImageView()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addViews()
//        layoutViews()
//        configure()
//        addAnimateTo(self)
//        
//    }
    
    init(buttonType: BaceButtonType = .bace) {
        super.init(frame: .zero)
        type = buttonType
        addViews()
        layoutViews()
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        addViews()
        layoutViews()
        configure()
    }
    
    func setButtonTitle(title: String) {
        label.text = title
    }
}

private extension BaceButton {
    func addViews() {
        addView(label)
        addView(iconView)
    }
    
    func layoutViews() {
        
        var horizontalOffset: CGFloat {
            switch type {
            case .bace: return 0
            case .custom: return 10
            }
        }
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo:iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2  * horizontalOffset)
        ])
        
    }
    
    func configure() {
        switch type {
        case .bace :
            label.font = Resources.Fonts.helveticaRegular(with: 13)
            label.textColor = Resources.Colors.inActive
            iconView.tintColor = Resources.Colors.inActive
        case .custom :
            backgroundColor = Resources.Colors.allWorkoutButton
            layer.cornerRadius = 14
            label.textColor = Resources.Colors.active
            label.font = Resources.Fonts.helveticaRegular(with: 15)
            label.textAlignment = .center
            iconView.tintColor = Resources.Colors.active
        }
        
        iconView.image = Resources.Images.TabBar.allWorkoutsArrov!.withRenderingMode(.alwaysTemplate)
        addAnimateTo(self)
    }
}
