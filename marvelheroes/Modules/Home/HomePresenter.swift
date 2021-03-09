//
//  MainPresenter.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

protocol HomePresenterProtocol: BasicPresenterProtocol {
    func getNumberOfItems() -> Int
    func getCharacter(at indexPath: IndexPath) -> Character?
    func getMoreCharacters()
    func showCharacterDetail(at indexPath: IndexPath)
}

class HomePresenter<V: HomeViewProtocol, R: HomeRouterProtocol>: BasicPresenter<V,R> {
    var dataManager: HomeDataManagerProtocol!
    private var charactersList = [Character]()
    private var itemsPerPage = 20
    private var currentPage = 0

    required init(router: R, view: V) {
        super.init(router: router, view: view)
        dataManager = HomeDataManager(delegate:self)
    }

    override func clientError(_ error: String) {
        showAlertAndRetry(error)
    }

    override func noInternetError(_ error: String) {
        showAlertAndRetry(error)
    }

    private func showAlertAndRetry(_ error: String) {
        self.view?.hideLoading()
        self.router.showAlert(with: "No Internet", and: error) { _ in
            self.getCharacters()
        }
    }

    private func getCharacters() {
        self.view?.showLoading()
        dataManager.getCharacters(page: currentPage * itemsPerPage) { [weak self] chars in
            self?.view?.hideLoading()
            guard let self = self, let heroes = chars else {
                return
            }
            if self.currentPage > 0 {
                self.charactersList.append(contentsOf: heroes)
            } else {
                self.charactersList = heroes
            }

            self.view?.reloadData()
        }
    }
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoad() {
        getCharacters()
    }

    func getNumberOfItems() -> Int {
        return charactersList.count
    }

    func getCharacter(at indexPath: IndexPath) -> Character? {
        return (indexPath.row < charactersList.count) ? charactersList[indexPath.item] : nil
    }

    func getMoreCharacters() {
        currentPage += 1
        getCharacters()
    }

    func showCharacterDetail(at indexPath: IndexPath) {
        guard let char = getCharacter(at: indexPath), let charId = char.id else {
            return
        }
        self.view?.showLoading()
        dataManager.getCharacterDetailWith(id: String(charId)) { [weak self] characterDetail in
            self?.view?.hideLoading()
            self?.router.showCharacterDetail(character: characterDetail)
        }
    }
}


