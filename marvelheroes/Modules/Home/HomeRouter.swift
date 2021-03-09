//
//  HomeRouter.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

protocol HomeRouterProtocol: BasicRouterProtocol {
    func showCharacterDetail(character: Character)
}

final class HomeRouter: BasicRouter, HomeRouterProtocol, CharacterDetailRoute {
    func showCharacterDetail(character: Character) {
        openCharacterDetailModule(.push, character: character)
    }
}
