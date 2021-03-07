//
//  ServerManager.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Alamofire
import Foundation

protocol ServerManagerProtocol {
    var baseURL: String! { get set }

    func publicRequest(
                       _ url: URLConvertible,
                       method: HTTPMethod,
                       parameters: Parameters,
                       encoding: ParameterEncoding,
                       headers: HTTPHeaders?
        ) -> DataRequest
}

class ServerManager: ServerManagerProtocol {
    var baseURL: String!
    var version: String = ""
    var manager: Session
    var timeoutIntervalForRequest: TimeInterval = 60.0
    var timeoutIntervalForResource: TimeInterval = 60.0
    private let apiKey: String = "c2e8f8aa9149ef103b1b6fd1aedba749"
    private let privateKey: String = "a81cdc1a29654b2715206090b48ce50c6f25bcbe"

    private var defaultHeaders: HTTPHeaders

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutIntervalForRequest
        configuration.timeoutIntervalForResource = timeoutIntervalForResource
        configuration.httpShouldSetCookies = true
        configuration.protocolClasses = nil

        self.manager = Session(configuration: configuration)
        self.defaultHeaders = [:]
    }

    init(
        baseURL: String,
        version: String,
        timeoutIntervalForRequest: TimeInterval,
        timeoutIntervalForResource: TimeInterval,
        headers: HTTPHeaders,
        protocolClasses: [AnyClass]?
        ) {
        self.baseURL = baseURL
        self.timeoutIntervalForRequest = timeoutIntervalForRequest
        self.timeoutIntervalForResource = timeoutIntervalForResource
        self.version = version
        self.defaultHeaders = headers

        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutIntervalForRequest
        configuration.timeoutIntervalForResource = timeoutIntervalForResource
        configuration.httpShouldSetCookies = true
        configuration.protocolClasses = protocolClasses
        configuration.urlCredentialStorage = .shared

        manager = Session(configuration: configuration)
    }

    static func defaultManager() -> ServerManager {
        let serverManager = ServerManager(baseURL: "https://gateway.marvel.com:443/",
                                          version: "",
                                          timeoutIntervalForRequest: 60.0,
                                          timeoutIntervalForResource: 60.0,
                                          headers: [:],
                                          protocolClasses: nil)

        return serverManager
    }

    // MARK: - Requests

    func publicRequest(_ url: URLConvertible,
                       method: HTTPMethod = .get,
                       parameters: Parameters = [:],
                       encoding: ParameterEncoding = URLEncoding.default,
                       headers: HTTPHeaders? = nil
        ) -> DataRequest {
        print("------------------------------------------\n🌍 [REQUEST][URL]\n \(url):")

        let parameters = addCommonParams(params: parameters)
        print("[REQUEST][PARAMETERS]\n \(parameters as AnyObject)")

        print("------------------------------------------")
        return manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }

    private func addCommonParams(params: Parameters) -> Parameters {
        var allParams = params
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash = MD5(string: "\(timestamp)\(privateKey)\(apiKey)")
        allParams["ts"] = timestamp
        allParams["apikey"] = apiKey
        allParams["hash"] = hash
        return allParams
    }
}
