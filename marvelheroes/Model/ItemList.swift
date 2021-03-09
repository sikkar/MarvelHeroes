//
//  ComicList.swift
//  marvelheroes
//
//  Created by Angel on 9/3/21.
//

import Foundation

struct ItemList: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [ItemSummary]?

    enum CodingKeys: String, CodingKey {
        case available
        case returned
        case collectionURI
        case items
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.available = try container.decodeIfPresent(Int.self, forKey: .available)
        self.returned = try container.decodeIfPresent(Int.self, forKey: .returned)
        self.collectionURI = try container.decodeIfPresent(String.self, forKey: .collectionURI)
        self.items = try container.decodeIfPresent([ItemSummary].self, forKey: .items)
    }
}
