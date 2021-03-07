//
//  DetailViewController.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

protocol CharacterDetailViewProtocol: BasicViewProtocol {
}

class CharacterDetailViewController: BasicViewController {
    var presenter: CharacterDetailPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

}

extension CharacterDetailViewController: CharacterDetailViewProtocol {

}
