//
//  BasicPresenter.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation


class BasicPresenter<V: BasicViewProtocol, R: BasicRouterProtocol>: BasicPresenterCallbackProtocol {
    weak var view: V?
    var router: R!

    required init(router: R, view: V) {
        self.router = router
        self.view = view
    }

    func defaultError(_ error: String) {

    }

    func clientError(_ error: String) {

    }

    func unauthorized(_ error: String) {

    }

    func serverError(_ error: String) {

    }

    func noInternetError(_ error: String) {
        
    }

    func badRequestError(_ error: String) {

    }

    func notFoundError(_ error: String) {

    }

    func forbiddenError(_ error: String) {

    }
}
