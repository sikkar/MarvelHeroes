//
//  ResponseData.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

struct CharactersResponseData: Codable {
    let base: BaseResponse
    let data: CharactersData

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.base = try BaseResponse(from: decoder)
        self.data = try values.decode(CharactersData.self, forKey: .data)
    }
}
