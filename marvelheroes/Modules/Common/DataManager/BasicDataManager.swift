//
//  BasicDataManager.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Alamofire
import Foundation

class BasicDataManager {
    weak var callbackDelegate: BasicPresenterCallbackProtocol?

    convenience init(delegate: BasicPresenterCallbackProtocol?) {
        self.init()
        self.callbackDelegate = delegate
    }
    func handle<T>(result: Result<T, Error>, completion: @escaping Handler<T>) {
        do {
            try self.handle {
                let value = try result.get()
                DispatchQueue.main.async {
                    completion(value)
                }
            }
        } catch {
            let result = "Unexpected Error"
            self.callbackDelegate?.defaultError(result)
        }
    }

    func handleEmpty<T>(result: Result<T, Error>, completion: @escaping VoidHandler) {
        do {
            try self.handle {
                _ = try result.get()
                DispatchQueue.main.async {
                    completion()
                }
            }
        } catch {
            let result = "Unexpected Error"
            self.callbackDelegate?.defaultError(result)
        }
    }

    func handle(f: () throws -> Void) throws {
        do {
            try f()
        } catch ServerManagerError.noInternetError(let error) {
            print("noInternetError", error)
            self.callbackDelegate?.noInternetError(error)
        } catch ServerManagerError.defaultError(let error) {
            print("defaultError", error)
            self.callbackDelegate?.defaultError(error)
        } catch ServerManagerError.unauthorizedError(let error) {
            print("unauthorizedError", error)
            self.callbackDelegate?.unauthorized(error)
        } catch ServerManagerError.forbiddenError(let error) {
            print("forbiddenError", error)
            self.callbackDelegate?.forbiddenError(error)
        } catch ServerManagerError.badRequestError(let error) {
            print("badRequestError", error)
            self.callbackDelegate?.badRequestError(error)
        } catch ServerManagerError.notFoundError(let error) {
            print("notFoundError", error)
            self.callbackDelegate?.notFoundError(error)
        } catch ServerManagerError.clientError(let error) {
            print("clientError", error)
            self.callbackDelegate?.clientError(error)
        } catch ServerManagerError.serverError(let error) {
            print("serverError", error)
            self.callbackDelegate?.serverError(error)
        } catch let error {
            throw error
        }
    }

    deinit {
        print("deinit \(self)")
    }
}
