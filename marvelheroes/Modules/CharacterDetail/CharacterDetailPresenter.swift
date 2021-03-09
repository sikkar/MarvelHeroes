//
//  DetailPresenter.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

enum CharacterDetailSections: Int {
    case photo
    case description
    case media
    case comics
    case series
    case stories
}

protocol CharacterDetailPresenterProtocol: BasicPresenterProtocol {
    func getNumberOfSections() -> Int
    func numberOfItemsInSection(_ section: Int) -> Int
    func getCurrentSection(at indexPath: IndexPath) -> CharacterDetailSections?
    func getCharacterImage() -> URL?
    func getTitleCellForSection(section: CharacterDetailSections?, indexPath: IndexPath) -> String?
    func getCharacterMedia() -> [CharacterLinks]
}

class CharacterDetailPresenter<V: CharacterDetailViewProtocol, R: CharacterDetailRouterProtocol>: BasicPresenter<V,R> {
    private var character: Character!
    private var sections: [CharacterDetailSections] = []

    required init(router: R, view: V) {
        super.init(router: router, view: view)
    }

    convenience init(router: R, view: V, character: Character) {
        self.init(router: router, view: view)
        self.character = character
    }

    private func configureSections() {
        sections = [.photo]
        if let description = character.description, !description.isEmpty {
            sections.append(.description)
        }
        if let media = character.urls, !media.isEmpty {
            sections.append(.media)
        }
        if let comics = character.comics?.items, !comics.isEmpty {
            sections.append(.comics)
        }
        if let series = character.series?.items, !series.isEmpty {
            sections.append(.series)
        }
        if let stories = character.stories?.items, !stories.isEmpty {
            sections.append(.stories)
        }
    }

    private func getItemSummaryTitle(at row: Int, for section: CharacterDetailSections?) -> String? {
        var items: [ItemSummary]?
        switch section {
        case .comics:
            items = character.comics?.items
        case .series:
            items = character.series?.items
        case .stories:
            items = character.stories?.items
        default:
            items = []
        }
        guard let itemsSummary = items, row < itemsSummary.count,
              let title = itemsSummary[row].name else {
            return ""
        }
        return title
    }
}

extension CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    func viewDidLoad() {
        view?.charName = character.name ?? ""
        configureSections()
    }

    func getNumberOfSections() -> Int {
        return sections.count
    }

    func numberOfItemsInSection(_ section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .photo, .description, .media:
            return 1
        case .comics:
            return character.comics?.items?.count ?? 0
        case .series:
            return character.series?.items?.count ?? 0
        case .stories:
            return character.stories?.items?.count ?? 0
        }
    }

    func getCurrentSection(at indexPath: IndexPath) -> CharacterDetailSections? {
        return sections[indexPath.section]
    }

    func getCharacterImage() -> URL? {
        return character.characterImage?.url
    }

    func getTitleCellForSection(section: CharacterDetailSections?, indexPath: IndexPath) -> String? {
        switch section {
        case .description:
            return character.description
        case .comics, .series, .stories:
            return getItemSummaryTitle(at: indexPath.row, for: section)
        default:
            return ""
        }
    }

    func getCharacterMedia() -> [CharacterLinks] {
        guard let media = character.urls else {
            return []
        }
        return media
    }
}
