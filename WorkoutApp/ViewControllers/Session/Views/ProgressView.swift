//
//  ProgressView.swift
//  WorkoutApp
//
//  Created by Лаванда on 06.01.2023.
//

import UIKit

extension TimerView {
final class ProgressView: UIView {
    
    func drawProgressView(persent: CGFloat) {
        
        let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2
        let radius = circleFrame / 2
        let center = CGPoint(x: radius, y: radius)
        let startAngle = -CGFloat.pi * 7 / 6
        let endAngle = CGFloat.pi * 1 / 6
        
        let circlePath = UIBezierPath(arcCenter: center,
                                      radius: radius,
                                      startAngle: startAngle,
                                      endAngle: endAngle,
                                      clockwise: true)
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = Resources.Colors.active.cgColor
        circleLayer.lineWidth = 20
        circleLayer.fillColor = UIColor.clear.cgColor // цвет который заполнить все пространство внутри
        circleLayer.lineCap = .round
        circleLayer.strokeEnd = persent
        
        layer.addSublayer(circleLayer)
        
    }
    }
}
