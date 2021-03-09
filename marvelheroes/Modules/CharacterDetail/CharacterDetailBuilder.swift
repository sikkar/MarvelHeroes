//
//  DetailBuilder.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

class CharacterDetailBuilder: BasicBuilderProtocol {
    var openTransition: Transition?
    var character: Character

    init(character: Character) {
        self.character = character
    }

    func build() -> UIViewController {
        let router = CharacterDetailRouter()
        router.configure(openTransition: openTransition)

        let viewController = StoryBoardHandler.instantiateViewController(.detail) as! CharacterDetailViewController
        let presenter = CharacterDetailPresenter(router: router, view: viewController, character: character)

        viewController.presenter = presenter
        router.viewController = viewController

        return viewController
    }
}
