//
//  HeroesServerManager.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Alamofire
import Foundation

protocol HeroesServerManager: ServerManagerProtocol {
    func getAllCharacters(completion: @escaping (AFDataResponse<Any>) -> Void)
}

extension ServerManager: HeroesServerManager {
    func getAllCharacters(completion: @escaping (AFDataResponse<Any>) -> Void) {
        let completeRequest = baseURL! + "v1/public/characters"
        let parameters: [String: Any] =  ["limit": 10]

        publicRequest(completeRequest,
                      method: .get,
                      parameters: parameters)
            .validate()
            .responseJSON { response in
                completion(response)
            }
    }
}
