//
//  Transition.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

protocol Transition: AnyObject {
    var sourceViewController: UIViewController? { get set }
    var completionHandler: VoidHandler? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController, toRoot root: Bool, animated: Bool)
}

extension Transition {
    func close(_ viewController: UIViewController, toRoot root: Bool = false, animated: Bool = true) {
        close(viewController, toRoot: root, animated: animated)
    }
}
