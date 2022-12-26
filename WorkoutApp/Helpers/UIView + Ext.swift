//
//  UIView + Ext.swift
//  WorkoutApp
//
//  Created by Лаванда on 26.12.2022.
//

import UIKit

extension UIView {
    func addBottomBorser(with color: UIColor, and height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = Resources.Colors.separator
        separator.autoresizingMask = [.flexibleWidth, .flexibleWidth]
        separator.frame = CGRect(
            x: 0,
            y: frame.height - height,
            width: frame.width,
            height: height)
        addSubview(separator)
    }
}
