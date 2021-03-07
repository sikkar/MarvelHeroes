//
//  MainPresenter.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

protocol HomePresenterProtocol: BasicPresenterProtocol {

}

class HomePresenter<V: HomeViewProtocol, R: HomeRouterProtocol>: BasicPresenter<V,R> {
    var dataManager: HomeDataManagerProtocol!

    required init(router: R, view: V) {
        super.init(router: router, view: view)
        dataManager = HomeDataManager(delegate:self)
    }
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoad() {
        dataManager.getCharacters { chars in
            guard let heroes = chars else {
                return
            }
            for char in heroes {
                print("\(char)\n")
            }
        }
    }
}


