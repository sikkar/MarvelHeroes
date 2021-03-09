//
//  DetailViewController.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

protocol CharacterDetailViewProtocol: BasicViewProtocol {
    var charName: String { get set }
}

class CharacterDetailViewController: BasicViewController {
    var presenter: CharacterDetailPresenterProtocol!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func applyStyles() {
        navigationItem.largeTitleDisplayMode = .always
    }
}

extension CharacterDetailViewController: CharacterDetailViewProtocol {
    var charName: String {
        get {
            self.title ?? ""
        }
        set {
            self.title = newValue
            adjustLargeTitleSize()
        }
    }
}
