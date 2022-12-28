//
//  Resources.swift
//  WorkoutApp
//
//  Created by Лаванда on 25.12.2022.
//

import UIKit

enum Resources {
    
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inActive = UIColor(hexString: "#929DA5")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let titleNavBar = UIColor(hexString: "#545C77")
        static let background = UIColor(hexString: "#F8F9F9")
        static let allWorkoutButton = UIColor(hexString: "#F0F3FF")
    }
    
    enum Strings {
        enum TabBar {
            static let overview = "Overview"
            static let session = "Session"
            static let progress = "Progress"
            static let settings = "Settings"
            static let allWorcoutButton = "All Workout"
            static let navBarTitle = "Today"
        }
    }
    
    enum Images {
        enum TabBar {
            static let overwiew = UIImage(named: "Overview")
            static let session = UIImage(named: "Session")
            static let progress = UIImage(named: "Progress")
            static let settings = UIImage(named: "Settings")
            static let allWorkoutsArrov = UIImage(named: "DownArrow")
            static let addBotton = UIImage(named: "AddButton")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size:CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
}
