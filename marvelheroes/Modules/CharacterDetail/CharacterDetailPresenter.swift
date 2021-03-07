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
    required init(router: R, view: V) {
        super.init(router: router, view: view)
    }
}

extension CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    func viewDidLoad() {
    }
}
