//
//  HomeDataManagerMock.swift
//  marvelheroesTests
//
//  Created by Angel on 10/3/21.
//

@testable import marvelheroes
import Foundation

class HomeDataManagerMock: HomeDataManagerProtocol {
    func getCharacters(page: Int, completion: @escaping Handler<[Character]?>) {
        completion([Character(), Character()])
    }

    func getCharacterDetailWith(id characterId: String, completion: @escaping Handler<Character>) {
        completion(Character())
    }
}
