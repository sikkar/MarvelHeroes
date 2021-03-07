//
//  ServerManagerErrorHandler.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Alamofire
import Foundation

struct ServerManagerErrorHandler {
    private let badRequestError = 400
    private let unauthorizedError = 401
    private let forbiddenError = 403
    private let notFoundError = 404
    private let requestEntityTooLarge = 413
    private let clientError = 417
    private let serverError = 500

    func validate(error: Error?, responseData: Data?) -> ServerManagerError? {
        if let err = error as? URLError {
            return handle(err)
        } else if let err = error as? AFError {
            if err.isServerTrustEvaluationError {
                return ServerManagerError.sslPinning("Server trust evaluation pinning error")
            } else {
                return handle(err, responseData)
            }
        } else if let err = clientBaseResponse(responseData) {
            return err
        } else {
            return nil
        }
    }

    // MARK: - App

    /*
     *    Return:
     *        noInternetError
     *        URLError
     */
    private func handle(_ error: URLError) -> ServerManagerError {
        switch error.code {
        case .notConnectedToInternet:
            print(error.code, ": notConnectedToInternet")
            return makeNoInternetError(error)
        case .networkConnectionLost:
            print(error.code, ": networkConnectionLost")
            return makeNoInternetError(error)
        default:
            print(error.code, ": defaultError ", error)
            return makeDefaultError(error)
        }
    }

    /*
     *    Return:
     *        noInternetError
     */
    private func makeNoInternetError(_ error: URLError?) -> ServerManagerError {
        let result = "Conecttion error"
        return ServerManagerError.noInternetError(result)
    }

    /*
     *    Return:
     *        defaultError
     */
    private func makeDefaultError(_ error: URLError?) -> ServerManagerError {
        let result = "Unexpected error"
        return ServerManagerError.defaultError(result)
    }

    // MARK: - Server

    /*
     *    Return:
     *        clientError
     *        expiredSession
     *        unknownError
     */
    private func handle(_ error: AFError?, _ responseData: Data?) -> ServerManagerError {
        if let afError = error?.asAFError,
           case let AFError.sessionTaskFailed(sessionError) = afError,
           let urlError = sessionError as? URLError {
            return handle(urlError)
        }

        guard error != nil else {
            return makeServerError(nil)
        }

        switch error! {
        case .responseSerializationFailed:
            return makeClientError(responseData)
        default:
            break
        }

        switch error?.responseCode ?? serverError {
        case unauthorizedError:
            print(unauthorizedError, ": Unauthorized Error")
            return makeUnauthorized(nil)
        case badRequestError:
            print(badRequestError, ": Bad Request Error")
            return makeBadRequestError(nil)
        case notFoundError:
            print(notFoundError, ": Not found Error")
            return makeNotFoundError(nil)
        case forbiddenError:
            print(forbiddenError, ": Forbidden Error")
            return makeForbiddenError(nil)
        case requestEntityTooLarge:
            print(requestEntityTooLarge, ": Request entity too large")
            return makeClientError(responseData)
        case clientError:
            print(clientError, ": Client error")
            return makeClientError(responseData)
        default:
            print(error?.responseCode ?? serverError, ": Server error")
            return makeServerError(nil)
        }
    }

    /*
     *    Return:
     *        clientError
     */
    private func makeClientError(_ responseData: Data?) -> ServerManagerError {
        var result: String
        var responseError: ResponseError?

        if let data = responseData {
            responseError = decodeResponse(from: data, type: ResponseError.self) as? ResponseError
        }
        result = responseError?.base.message ?? "Unexpected error"
        if  let code = responseError?.base.code, Int(code) == 419 {
            return ServerManagerError.unauthorizedError(result)
        } else {
            return ServerManagerError.clientError(result)
        }
    }

    private func clientBaseResponse(_ responseData: Data?) -> ServerManagerError? {
        guard let baseResponse: BaseResponse = decodeResponse(from: responseData, type: BaseResponse.self) as? BaseResponse else { return nil }

        switch Int(baseResponse.code) {
        case 200:
            return nil
        case 400: //Athletic Server: generic error
            return ServerManagerError.clientError(baseResponse.message)
        case 413: //Athletic Server: duplicated user error
            return ServerManagerError.clientError(baseResponse.message)
        case 414: //Athletic Server: missing minimum parameters error
            return ServerManagerError.clientError(baseResponse.message)
        case 415: //Athletic Server: no registered user found error
            return ServerManagerError.clientError(baseResponse.message)
        case 416: //Athletic Server: cannot create new token error
            return ServerManagerError.clientError(baseResponse.message)
        case 419: //Athletic Server: invalid token error
            return ServerManagerError.unauthorizedError(baseResponse.message)
        default:
            return ServerManagerError.clientError(baseResponse.message)
        }
    }

    /*
     *    Return:
     *        serverError
     */
    private func makeServerError(_ error: String?) -> ServerManagerError {
        let result = "Unexpected error"
        return ServerManagerError.serverError(error ?? result)
    }

    /*
     *    Return:
     *        expiredSession
     */
    private func makeUnauthorized(_ error: String?) -> ServerManagerError {
        let result = "Unauthorized error"
        return ServerManagerError.unauthorizedError(error ?? result)
    }

    /*
     *    Return:
     *        badRequestError
     */
    private func makeBadRequestError(_ error: String?) -> ServerManagerError {
        let result = "Bad Request"
        return ServerManagerError.badRequestError(error ?? result)
    }

    /*
     *    Return:
     *        forbiddenError
     */
    private func makeForbiddenError(_ error: String?) -> ServerManagerError {
        let result = "Forbidden Error"
        return ServerManagerError.forbiddenError(error ?? result)
    }

    /*
     *    Return:
     *        notFoundError
     */
    private func makeNotFoundError(_ error: String?) -> ServerManagerError {
        let result = "Not Found"
        return ServerManagerError.notFoundError(error ?? result)
    }

    func decodeResponse<T: Decodable>(from responseData: Data?, type: T.Type) -> Any? {
        var baseResponse: Any?
        if let data = responseData {
            let jsonDecoder = JSONDecoder()
            do {
                if let jsonString = String(data: data, encoding: String.Encoding.utf8) {
                    print(jsonString)
                }
                baseResponse = try jsonDecoder.decode(T.self, from: data)
            } catch let error {
                print(error)
            }
        }
        return baseResponse
    }
}

enum ServerManagerError: Error {
    // Server
    case unauthorizedError(String)
    case badRequestError(String)
    case forbiddenError(String)
    case notFoundError(String)
    case clientError(String)
    case serverError(String)

    //Pinning
    case sslPinning(String)

    // App
    case noInternetError(String)
    case defaultError(String)

    static func getServerError() -> ServerManagerError {
        ServerManagerError.serverError("Unexpected error")
    }
    static func getUnauthorizedError() -> ServerManagerError {
        ServerManagerError.unauthorizedError("Unexpected error")
    }
}
