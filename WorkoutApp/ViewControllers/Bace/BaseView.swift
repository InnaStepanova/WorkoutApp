//
//  BaseView.swift
//  WorkoutApp
//
//  Created by Лаванда on 28.12.2022.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BaseView {
    func configure() {
    }
    
    func addViews(){
        
    }
    
    func layoutViews() {
        
    }
}
