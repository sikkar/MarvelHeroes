//
//  DetailPresenter.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

protocol CharacterDetailPresenterProtocol: BasicPresenterProtocol {

}

class CharacterDetailPresenter<V: CharacterDetailViewProtocol, R: CharacterDetailRouterProtocol>: BasicPresenter<V,R> {
    private var character: Character!

    required init(router: R, view: V) {
        super.init(router: router, view: view)
    }

    convenience init(router: R, view: V, character: Character) {
        self.init(router: router, view: view)
        self.character = character
    }
}

extension CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    func viewDidLoad() {
        view?.charName = character.name ?? ""
    }
}
