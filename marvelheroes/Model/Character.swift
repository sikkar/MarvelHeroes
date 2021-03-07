//
//  Character.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

struct Character: Codable {
    let id: Int?
    let name: String?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
    }
}
