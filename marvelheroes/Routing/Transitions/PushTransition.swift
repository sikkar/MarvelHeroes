//
//  PushTransition.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

class PushTransition: NSObject {
    var isAnimated: Bool = true
    var completionHandler: VoidHandler?

    weak var sourceViewController: UIViewController?

    init(isAnimated: Bool = true) {
        self.isAnimated = isAnimated
    }
}

// MARK: - Transition
extension PushTransition: Transition {
    func open(_ viewController: UIViewController) {
        guard let navigationController = self.sourceViewController?.navigationController else {
            assertionFailure("You cannot push without navigation controller.")
            return
        }
        navigationController.pushViewController(viewController, animated: isAnimated)
    }

    func close(_ viewController: UIViewController, toRoot root: Bool, toViewControllerType viewControllerType: UIViewController.Type?, animated: Bool) {
        guard let navigationController = self.sourceViewController?.navigationController else {
            assertionFailure("You cannot push without navigation controller.")
            return
        }

        if root {
            navigationController.popToRootViewController(animated: animated)
        } else {
            navigationController.popViewController(animated: animated)
        }
    }
}
