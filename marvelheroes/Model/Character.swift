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
    let characterImage: Image?
    let comics: ItemList?
    let series: ItemList?
    let stories: ItemList?
    let urls: [CharacterLinks]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case characterImage = "thumbnail"
        case comics
        case series
        case stories
        case urls
    }

    init() {
        id = 0
        name = nil
        description = nil
        characterImage = nil
        comics = nil
        series = nil
        stories = nil
        urls = nil
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.characterImage = try container.decodeIfPresent(Image.self, forKey: .characterImage)
        self.comics = try container.decodeIfPresent(ItemList.self, forKey: .comics)
        self.series = try container.decodeIfPresent(ItemList.self, forKey: .series)
        self.stories = try container.decodeIfPresent(ItemList.self, forKey: .stories)
        self.urls = try container.decodeIfPresent([CharacterLinks].self, forKey: .urls)
    }
}
