//
//  ErrorResponse.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

struct ResponseError: Codable {
    let base: BaseResponse

    init(from decoder: Decoder) throws {
        self.base = try BaseResponse(from: decoder)
    }
}
