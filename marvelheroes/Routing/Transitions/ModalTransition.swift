//
//  ModalTransition.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

class ModalTransition: NSObject {
    var isAnimated: Bool = true

    var modalTransitionStyle: UIModalTransitionStyle
    var modalPresentationStyle: UIModalPresentationStyle

    var completionHandler: VoidHandler?

    weak var sourceViewController: UIViewController?

    init(isAnimated: Bool = true,
         modalTransitionStyle: UIModalTransitionStyle = .coverVertical,
         modalPresentationStyle: UIModalPresentationStyle = .overFullScreen
        ) {
        self.isAnimated = isAnimated
        self.modalTransitionStyle = modalTransitionStyle
        self.modalPresentationStyle = modalPresentationStyle
    }
}

// MARK: - Transition
extension ModalTransition: Transition {
    func open(_ viewController: UIViewController) {
        viewController.modalTransitionStyle = modalTransitionStyle
        viewController.modalPresentationStyle = modalPresentationStyle

        self.sourceViewController?.present(viewController, animated: isAnimated, completion: completionHandler)
    }

    func close(_ viewController: UIViewController, toRoot root: Bool, toViewControllerType viewControllerType: UIViewController.Type?, animated: Bool) {
        viewController.dismiss(animated: animated, completion: completionHandler)
    }
}
