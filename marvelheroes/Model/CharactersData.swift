//
//  HeroesData.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

struct CharactersData: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Character]?

    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.offset = try container.decodeIfPresent(Int.self, forKey: .offset)
        self.limit = try container.decodeIfPresent(Int.self, forKey: .limit)
        self.total = try container.decodeIfPresent(Int.self, forKey: .total)
        self.count = try container.decodeIfPresent(Int.self, forKey: .count)
        self.results = try container.decodeIfPresent([Character].self, forKey: .results)
    }
}
