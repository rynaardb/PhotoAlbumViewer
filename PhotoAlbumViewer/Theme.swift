// Theme.swift

import Foundation
import UIKit

struct Theme {
    static func apply(to window: UIWindow) {
        window.tintColor = Colors.lightGray

        let navBar = UINavigationBar.appearance()
        navBar.barStyle = .black
        navBar.barTintColor = Colors.darkGray1
        navBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Colors.lightGray
        ]
    }

    struct Colors {
        static var lightGray = UIColor(hue: 0.29, saturation: 0.00, brightness: 0.79, alpha: 1.00)
        static var darkGray1 = UIColor(hue: 0.58, saturation: 0.12, brightness: 0.14, alpha: 1.00)
        static var darkGray2 = UIColor(hue: 0.63, saturation: 0.09, brightness: 0.19, alpha: 1.00)
    }
}
