//
//  BasicPresenterProtocol.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

protocol BasicPresenterCallbackProtocol: AnyObject {
    func defaultError(_ error: String)
    func clientError(_ error: String)
    func unauthorized(_ error: String)
    func serverError(_ error: String)
    func noInternetError(_ error: String)
}

protocol BasicPresenterProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

extension BasicPresenterProtocol {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}
