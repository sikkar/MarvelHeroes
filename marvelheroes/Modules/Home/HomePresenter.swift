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
    required init(router: R, view: V) {
        super.init(router: router, view: view)
    }
}

extension HomePresenter: HomePresenterProtocol {
    
}


