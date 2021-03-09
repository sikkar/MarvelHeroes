//
//  Image.swift
//  marvelheroes
//
//  Created by Angel on 9/3/21.
//

import Foundation

struct Image: Codable {
    let path: String?
    let ext: String?

    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.ext = try container.decodeIfPresent(String.self, forKey: .ext)
    }

    var url: URL? {
        guard let path = self.path, let ext = self.ext else {
            return nil
        }
        return URL(string: "\(path).\(ext)")
    }
}
