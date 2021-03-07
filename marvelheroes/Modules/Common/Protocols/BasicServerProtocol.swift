//
//  BasicServerProtocol.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Alamofire
import Foundation

protocol BasicServerProtocol {
    var manager: ServerManager { get }

    func handle<T: Decodable>(response: AFDataResponse<Any>, completion: @escaping (Result<T, Error>) -> Void)
}

extension BasicServerProtocol {
    func handle<T: Decodable>(response: AFDataResponse<Any>, completion: @escaping (Result<T, Error>) -> Void) {
        switch response.result {
        case .success (let json):
            do {
                print("""
                    ------------------------------------------
                    ✅ [RESPONSE SUCCESS]
                    \(json)
                    ------------------------------------------
                    """
                )
                if JSONSerialization.isValidJSONObject(json) {
                    let data = try JSONSerialization.data(withJSONObject: json, options: [])
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(T.self, from: data)
                    completion(Result.success(result))
                } else {
                    let baseSuccess: [String: Any] = ["message": "success", "code": 204]
                    let data = try JSONSerialization.data(withJSONObject: baseSuccess, options: [])
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(T.self, from: data)
                    completion(Result.success(result))
                }
            } catch let error {
                print(error)
                if let parsedError = ServerManagerErrorHandler().validate(error: error, responseData: response.data) {
                    completion(Result.failure(parsedError))
                } else {
                    completion(Result.failure(error))
                }
            }
        case .failure (let error):
            print("""
                ------------------------------------------
                ❌ [RESPONSE FAILURE]
                \(error)
                ------------------------------------------
                """
            )
            if let parsedError = ServerManagerErrorHandler().validate(error: error, responseData: response.data) {
                completion(Result.failure(parsedError))
            } else {
                completion(Result.failure(error))
            }
        }
    }
}

