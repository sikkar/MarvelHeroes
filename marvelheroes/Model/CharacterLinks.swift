//
//  CharacterLinks.swift
//  marvelheroes
//
//  Created by Angel on 9/3/21.
//

import Foundation

struct CharacterLinks: Codable {
    let type: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case type
        case url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}
