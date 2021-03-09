//
//  HeroesServerManager.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Alamofire
import Foundation

protocol HeroesServerManager: ServerManagerProtocol {
    func getAllCharacters(page: Int, completion: @escaping (AFDataResponse<Any>) -> Void)
    func getCharacterWith(id characterId: String, completion: @escaping (AFDataResponse<Any>) -> Void)
}

extension ServerManager: HeroesServerManager {
    func getAllCharacters(page: Int, completion: @escaping (AFDataResponse<Any>) -> Void) {
        let completeRequest = baseURL! + "v1/public/characters"
        let parameters: [String: Any] =  ["offset": page]

        publicRequest(completeRequest,
                      method: .get,
                      parameters: parameters)
            .validate()
            .responseJSON { response in
                completion(response)
            }
    }

    func getCharacterWith(id characterId: String, completion: @escaping (AFDataResponse<Any>) -> Void) {
        let completeRequest = baseURL! + "v1/public/characters/\(characterId)"

        publicRequest(completeRequest,
                      method: .get)
            .validate()
            .responseJSON { response in
                completion(response)
            }
    }
}
