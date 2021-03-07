//
//  Transition.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

protocol Transition: AnyObject {
    var sourceViewController: UIViewController? { get set }
    var completionHandler: () -> Void? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController, toRoot root: Bool, toViewControllerType viewControllerType: UIViewController.Type?, animated: Bool)
}

extension Transition {
    func close(_ viewController: UIViewController, toRoot root: Bool = false, toViewControllerType viewControllerType: UIViewController.Type? = nil, animated: Bool = true) {
        close(viewController, toRoot: root, toViewControllerType: viewControllerType, animated: animated)
    }
}
