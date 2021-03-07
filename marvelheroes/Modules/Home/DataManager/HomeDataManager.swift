//
//  HomeDataManager.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

protocol HomeDataManagerProtocol {
    func getAllHeroes()
}

class HomeDataManager: BasicDataManager {
    var server: HomeServer! = HomeServer()
}

extension HomeDataManager: HomeDataManagerProtocol {
    func getAllHeroes() {
        server.getHeroes { result in
            do {
                try self.handle {
                    let status = try result.get().status
                    print(status)
                }
            } catch {
                let result = "Unexpected Error"
                self.callbackDelegate?.defaultError(result)
            }
        }
    }
}
