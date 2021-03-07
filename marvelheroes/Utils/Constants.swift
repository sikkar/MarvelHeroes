//
//  Constants.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation


// MARK: - Typealais

typealias VoidHandler           = () -> Void
typealias Handler<T>            = (T) -> Void
typealias ResultHandler<T>      = (Result<T, Error>) -> Void
