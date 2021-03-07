//
//  BaiscRoute.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

class BasicRouter: BasicRouterProtocol {
    weak var viewController: UIViewController?
    var openTransition: Transition?

    func configure(openTransition: Transition?) {
        self.openTransition = openTransition
    }

    func open(_ viewController: UIViewController, transition: Transition) {
        transition.sourceViewController = self.viewController
        transition.open(viewController)
    }

    func close(animated: Bool = true) {
        guard let transition = openTransition else {
            assertionFailure("Open transition is not set. Use configure(openTransition:) in the route set up.")
            return
        }
        guard let viewController = viewController else {
            assertionFailure("Origin view controller is not set.")
            return
        }
        transition.close(viewController, animated: animated)
    }

    func closeToRoot(animated: Bool = true) {
        guard let transition = openTransition else {
            assertionFailure("Open transition is not set. Use configure(openTransition:) in the route set up.")
            return
        }
        guard let viewController = viewController else {
            assertionFailure("Origin view controller is not set.")
            return
        }
        transition.close(viewController, toRoot: true, animated: animated)
    }

    func closeToPrevious(viewControllerType: UIViewController.Type, animated: Bool = true) {
        guard let transition = openTransition else {
            assertionFailure("Open transition is not set. Use configure(openTransition:) in the route set up.")
            return
        }
        guard let viewController = viewController else {
            assertionFailure("Origin view controller is not set.")
            return
        }
        transition.close(viewController, toViewControllerType: viewControllerType, animated: animated)
    }

    deinit {
        print("deinit ", self)
    }
}
