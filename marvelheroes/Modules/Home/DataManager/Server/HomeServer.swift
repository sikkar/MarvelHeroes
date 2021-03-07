//
//  HomeServer.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

protocol HomeServerProtocol {
    func getCharacters(completion: @escaping ResultHandler<CharactersResponseData>)
}

final class HomeServer: BasicServer, HomeServerProtocol {
    func getCharacters(completion: @escaping ResultHandler<CharactersResponseData>) {
        manager.getAllCharacters { response in
            self.handle(response: response, completion: completion)
        }
    }
}
