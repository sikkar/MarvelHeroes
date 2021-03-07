//
//  HomeServer.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

protocol HomeServerProtocol {
    func getHeroes(completion: @escaping ResultHandler<BaseResponse>)
}

final class HomeServer: BasicServer, HomeServerProtocol {
    func getHeroes(completion: @escaping ResultHandler<BaseResponse>) {
        manager.getAllHeroes { response in
            self.handle(response: response, completion: completion)
        }
    }
}
