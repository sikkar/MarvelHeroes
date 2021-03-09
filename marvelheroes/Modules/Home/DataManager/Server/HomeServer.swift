//
//  HomeServer.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

protocol HomeServerProtocol {
    func getCharacters(page: Int, completion: @escaping ResultHandler<CharactersResponseData>)
    func getCharacterDetailWith(id characterId: String, completion: @escaping ResultHandler<CharactersResponseData>)
}

final class HomeServer: BasicServer, HomeServerProtocol {
    func getCharacters(page: Int, completion: @escaping ResultHandler<CharactersResponseData>) {
        manager.getAllCharacters(page: page) { response in
            self.handle(response: response, completion: completion)
        }
    }

    func getCharacterDetailWith(id characterId: String, completion: @escaping ResultHandler<CharactersResponseData>) {
        manager.getCharacterWith(id: characterId) { response in
            self.handle(response: response, completion: completion)
        }
    }
}
