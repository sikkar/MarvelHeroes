//
//  CustomAlertRoute.swift
//  marvelheroes
//
//  Created by Angel on 9/3/21.
//

import UIKit

protocol CustomAlertRoute {
    func openAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?)
}

extension CustomAlertRoute where Self: BasicRouterProtocol {
    func openAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?) {
        let transition = TransitionFactory.get(.modal) as! ModalTransition

        let builder = CustomAlertBuilder(title: title, message: message, handler: handler)
        builder.openTransition = transition

        let targetViewController = builder.build()

        open(targetViewController, transition: transition)
    }
}
