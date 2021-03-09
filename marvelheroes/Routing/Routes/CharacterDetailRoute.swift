//
//  CharacterDetailRoute.swift
//  marvelheroes
//
//  Created by Angel on 9/3/21.
//

import Foundation

protocol CharacterDetailRoute {
    func openCharacterDetailModule(_ transitionType: TransitionType, character: Character)
}

extension CharacterDetailRoute where Self: BasicRouterProtocol {
    func openCharacterDetailModule(_ transitionType: TransitionType, character: Character) {
        let transition = TransitionFactory.get(transitionType)

        let builder = CharacterDetailBuilder(character: character)
        builder.openTransition = transition

        open(builder.build(), transition: transition)
    }
}
