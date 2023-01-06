//
//  BaseInfoView.swift
//  WorkoutApp
//
//  Created by Лаванда on 03.01.2023.
//

import UIKit

class BaseInfoView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.inActive
        
        return label
    }()
    
    private let button: BaceButton = {
        let button = BaceButton(buttonType: .bace)
        return button
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = Resources.Colors.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    init(with title: String? = nil, buttonTitle: String? = nil) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        button.setButtonTitle(title: buttonTitle ?? "")
        button.isHidden = buttonTitle == nil ? true : false
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtonTarget(target: Any?, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
}

extension BaseInfoView {
    override func configure() {
        super.configure()
        backgroundColor = .clear
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        
        let componentToOffset: CGFloat = titleLabel.text == nil ? 0 : 10
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            
            contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: componentToOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func addViews() {
        super.addViews()
        addView(titleLabel)
        addView(button)
        addView(contentView)
    }
}
