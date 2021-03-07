//
//  StoryboardHandler.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

enum StoryboardName: String {
    case main         = "Main"
}

enum ViewControllerId: String {
    // Main View
    case home              = "HomeViewController"

    var storyboard: StoryboardName {
        switch self {
        // Main View
        case .home:
            return .main
        }
    }
}

class StoryBoardHandler {
    static func instantiateViewController(_ identifier: ViewControllerId) -> UIViewController {
        UIStoryboard(name: identifier.storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: identifier.rawValue)
    }

    static func instantiateInitialViewController(_ storyboard: StoryboardName) -> UIViewController {
        guard let initialViewController = UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateInitialViewController() else {
            assertionFailure("There is not view controller set as root for this storyboard")
            return UIViewController()
        }
        return initialViewController
    }
}
