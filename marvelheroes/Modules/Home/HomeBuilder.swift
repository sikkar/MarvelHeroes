//
//  HomeBuilder.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

class HomeBuilder: BasicBuilderProtocol {
    var openTransition: Transition?

    func build() -> UIViewController {
        let router = HomeRouter()
        router.configure(openTransition: openTransition)

        let navController = StoryBoardHandler.instantiateInitialViewController(.main) as! UINavigationController
        let viewController = StoryBoardHandler.instantiateViewController(.home) as! HomeViewController
        navController.viewControllers = [viewController]
        let presenter = HomePresenter(router: router, view: viewController)

        viewController.presenter = presenter
        router.viewController = viewController

        return navController
    }
}
