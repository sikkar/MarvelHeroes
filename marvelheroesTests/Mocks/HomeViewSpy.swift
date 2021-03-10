//
//  HomeViewMock.swift
//  marvelheroesTests
//
//  Created by Angel on 10/3/21.
//

@testable import marvelheroes
import Foundation

class HomeViewSpy: HomeViewProtocol {
    var viewDidReload = false
    var viewDidShowLoading = false
    var viewDidHideLoading = false

    func reloadData() {
        viewDidReload = true
    }

    func showLoading() {
        viewDidShowLoading = true
    }

    func hideLoading() {
        viewDidHideLoading = true
    }
}
