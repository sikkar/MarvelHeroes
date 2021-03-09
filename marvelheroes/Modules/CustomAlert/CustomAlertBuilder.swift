//
//  CustomAlertBuilder.swift
//  marvelheroes
//
//  Created by Angel on 9/3/21.
//

import UIKit

class CustomAlertBuilder: BasicBuilderProtocol {
    var openTransition: Transition?
    var title: String
    var message: String
    var handler: ((UIAlertAction) -> Void)?

    init(title: String, message: String, handler: ((UIAlertAction) -> Void)?) {
        self.title = title
        self.message = message
        self.handler = handler
    }

    func build() -> UIViewController {
        let router = CustomAlertRouter()
        router.configure(openTransition: openTransition)

        let viewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        viewController.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))


        return viewController
    }
}
