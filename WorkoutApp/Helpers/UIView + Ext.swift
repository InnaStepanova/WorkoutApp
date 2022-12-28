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
    
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeSustemButton(_ button: UIButton) {
        button.addTarget(self, action: #selector(hendleIn), for: [.touchDown,
                                                                  .touchDragInside])
        button.addTarget(self, action: #selector(hendleOut), for: [.touchUpInside,
                                                                   .touchUpOutside,
                                                                   .touchDragExit,
                                                                   .touchCancel])
    }
    
    @objc func hendleIn() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 0.55
        }
    }
    
    @objc func hendleOut() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 1
        }
    }
}
