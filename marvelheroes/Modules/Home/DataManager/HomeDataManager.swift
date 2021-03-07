//
//  HomeDataManager.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

protocol HomeDataManagerProtocol {
    func getCharacters(completion: @escaping Handler<[Character]?>)
}

class HomeDataManager: BasicDataManager {
    var server: HomeServer! = HomeServer()
}

extension HomeDataManager: HomeDataManagerProtocol {
    func getCharacters(completion: @escaping Handler<[Character]?>) {
        server.getCharacters { result in
            do {
                try self.handle {
                    let chars = try result.get().data.results
                    completion(chars)
                }
            } catch {
                let result = "Unexpected Error"
                self.callbackDelegate?.defaultError(result)
            }
        }
    }
}
