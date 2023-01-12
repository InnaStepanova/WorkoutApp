//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Лаванда on 06.01.2023.
//

import UIKit

enum TimerState {
    case isRunning
    case isStopped
}

final class TimerView: BaseInfoView {
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration: Double = 0
    
    public var state: TimerState = .isStopped
    
    let progressView = ProgressView()
    
    private let elapsedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.elapsedTimeLabel
        label.textColor = Resources.Colors.inActive
        label.font = Resources.Fonts.helveticaRegular(with: 15)
        return label
    }()
    
    private let elapsedTimer: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.titleNavBar
        label.font = Resources.Fonts.helveticaRegular(with: 40)
        return label
    }()
    
    private let remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.remainingTimeLabel
        label.textColor = Resources.Colors.inActive
        label.font = Resources.Fonts.helveticaRegular(with: 15)
        return label
    }()
    
    private let remainingTimer: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.titleNavBar
        label.font = Resources.Fonts.helveticaRegular(with: 15)
        return label
    }()
    
    private let timerStackLabels: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 10
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    private let botoomSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()
    
    private let completedStack = CompletedView()
    private let remainingStack = CompletedView()
    
    private let bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 30
        return stack
    }()
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDevider = duration == 0 ? 1 : duration
        let persent = tempCurrentValue / goalValueDevider
        let roundetPercent = Int(round(persent * 100))
        progressView.drawProgressView(persent: persent)
        
        elapsedTimer.text = getTimeInString(from: Int(tempCurrentValue))
        remainingTimer.text = getTimeInString(from: Int(goalValueDevider) - Int(tempCurrentValue))
        
        completedStack.configure(with: "COMPLETED", and: roundetPercent)
        remainingStack.configure(with: "REMAINING", and: 100 - roundetPercent)
        
    }
    
    func startTimer() {
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else {return}
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    func pausedTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        
        guard timerProgress > 0 else { return }
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else {return}
            self.timerProgress -= self.timerDuration * 0.02
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
        
    }

}

extension TimerView {
    
    override func configure() {
        super.configure()
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.widthAnchor.constraint(equalTo: progressView.heightAnchor),
            
            elapsedTimer.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            elapsedTimer.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
            botoomSeparator.widthAnchor.constraint(equalToConstant: 1),
            
            bottomStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStack.topAnchor.constraint(equalTo: progressView.bottomAnchor)
        ])
        
    }
    
    override func addViews() {
        super.addViews()
        addView(progressView)
        timerStackLabels.addArrangedSubview(elapsedTimeLabel)
        timerStackLabels.addArrangedSubview(elapsedTimer)
        timerStackLabels.addArrangedSubview(remainingTimeLabel)
        timerStackLabels.addArrangedSubview(remainingTimer)
        addView(timerStackLabels)
        addView(bottomStack)
        bottomStack.addArrangedSubview(completedStack)
        bottomStack.addArrangedSubview(botoomSeparator)
        bottomStack.addArrangedSubview(remainingStack)
    }
}

private extension TimerView {
    func getTimeInString(from period: Int) -> String {
        let seconds = period % 60 //  получаем количество секунд без учета минут и часов
        let minutes = (period / 60) % 60 // получаем количество минут без учета часов
        let hours = period / 3600 // только часы
        
        let secondsStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        return hours == 0 ? [minutesStr, secondsStr].joined(separator: ":") : [hoursStr, minutesStr, secondsStr].joined(separator: ":")
    }
}
