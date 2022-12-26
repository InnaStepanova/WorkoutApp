//
//  CustomTabBarViewController.swift
//  WorkoutApp
//
//  Created by Лаванда on 25.12.2022.
//

import UIKit

enum Tabs: Int {
    case overview
    case session
    case progress
    case settings
}

final class CustomTabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    private func configure() {
        
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inActive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewController = OverviewController()
        let sessionController = SessionController()
        let progressController = ProgressController()
        let settingsController = SettingsController()
        
        let overviewNavigation = NavBarController(rootViewController: overviewController)
        let sessionNavigation = NavBarController(rootViewController: sessionController)
        let progressNavigation = NavBarController(rootViewController: progressController)
        let settingsNavigation = NavBarController(rootViewController: settingsController)
        
        overviewController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.overview,
            image: Resources.Images.TabBar.overwiew,
            tag: Tabs.overview.rawValue)
        
        sessionController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.session,
            image: Resources.Images.TabBar.session,
            tag: Tabs.session.rawValue)
        
        progressController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.progress,
            image: Resources.Images.TabBar.progress,
            tag: Tabs.progress.rawValue)
        
        settingsController.tabBarItem = UITabBarItem(
            title: Resources.Strings.TabBar.settings,
            image: Resources.Images.TabBar.settings,
            tag: Tabs.settings.rawValue)
        
        setViewControllers([overviewNavigation, sessionNavigation, progressNavigation, settingsNavigation], animated: false)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

