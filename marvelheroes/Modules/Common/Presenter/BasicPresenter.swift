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
        showGenericAlert(error)
    }

    func clientError(_ error: String) {
        showGenericAlert(error)
    }

    func unauthorized(_ error: String) {
        showGenericAlert(error)
    }

    func serverError(_ error: String) {
        showGenericAlert(error)
    }

    func noInternetError(_ error: String) {
        showGenericAlert(error)
    }

    func badRequestError(_ error: String) {
        showGenericAlert(error)
    }

    func notFoundError(_ error: String) {
        showGenericAlert(error)
    }

    func forbiddenError(_ error: String) {
        showGenericAlert(error)
    }

    private func showGenericAlert(_ error: String) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
            self.router.showAlert(with: "Error", and: error, handler: nil)
        }
    }
}
