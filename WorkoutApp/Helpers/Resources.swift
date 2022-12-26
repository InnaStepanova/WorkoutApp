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
    }
    
    enum Strings {
        enum TabBar {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
        }
    }
    
    enum Images {
        enum TabBar {
            static var overwiew = UIImage(named: "Overview")
            static var session = UIImage(named: "Session")
            static var progress = UIImage(named: "Progress")
            static var settings = UIImage(named: "Settings")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size:CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
}
