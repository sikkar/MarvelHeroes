//
//  HomeRouterSpy.swift
//  marvelheroesTests
//
//  Created by Angel on 10/3/21.
//

@testable import marvelheroes
import Foundation
import UIKit

class HomeRouterSpy: HomeRouterProtocol {
    var viewController: UIViewController?
    var openTransition: Transition?
    var character: Character? = nil

    func showCharacterDetail(character: Character) {
        self.character = character
    }

    func configure(openTransition: Transition?) {}

    func open(_ viewController: UIViewController, transition: Transition) {}

    func showAlert(with title: String, and message: String, handler: ((UIAlertAction) -> Void)?) {}
}
