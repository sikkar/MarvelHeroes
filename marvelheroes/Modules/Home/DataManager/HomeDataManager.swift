//
//  HomeDataManager.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

protocol HomeDataManagerProtocol {
    func getCharacters(page:Int, completion: @escaping Handler<[Character]?>)
    func getCharacterDetailWith(id characterId: String, completion: @escaping Handler<Character>)
}

class HomeDataManager: BasicDataManager {
    var server: HomeServerProtocol! = HomeServer()
}

extension HomeDataManager: HomeDataManagerProtocol {
    func getCharacters(page: Int, completion: @escaping Handler<[Character]?>) {
        server.getCharacters(page: page) { result in
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

    func getCharacterDetailWith(id characterId: String, completion: @escaping Handler<Character>) {
        server.getCharacterDetailWith(id: characterId) { result in
            do {
                try self.handle {
                    let results = try result.get().data.results
                    guard let charDetails = results?.first else {
                        let result = "Unexpected Error"
                        self.callbackDelegate?.defaultError(result)
                        return
                    }
                    completion(charDetails)
                }
            } catch {
                let result = "Unexpected Error"
                self.callbackDelegate?.defaultError(result)
            }
        }
    }
}
