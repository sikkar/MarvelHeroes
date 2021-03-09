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
        configureTable()
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

    private func configureTable() {
        tableView.register(UINib(nibName: "CharacterImageTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterImageTableViewCell")
        tableView.register(UINib(nibName: "CharacterMediaTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterMediaTableViewCell")
        tableView.register(UINib(nibName: "ListItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ListItemTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func openMediaUrl(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
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

extension CharacterDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = presenter.getCurrentSection(at: IndexPath(row: 0, section: section))
        switch section {
        case .photo, .media:
            return .zero
        default:
            return 40
        }
    }
}

extension CharacterDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.getNumberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection(section)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = presenter.getCurrentSection(at: IndexPath(row: 0, section: section))
        switch section {
        case .description:
            return "Hero Description"
        case .comics:
            return "Comic appearances"
        case .series:
            return "Series"
        case .stories:
            return "Stories"
        default:
            return ""
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = presenter.getCurrentSection(at: indexPath)
        switch section {
        case .photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterImageTableViewCell") as! CharacterImageTableViewCell
            cell.setImage(presenter.getCharacterImage())
            return cell
        case .description, .comics, .series, .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemTableViewCell") as! ListItemTableViewCell
            cell.setTitleText(presenter.getTitleCellForSection(section: section, indexPath: indexPath))
            return cell
        case .media:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterMediaTableViewCell") as! CharacterMediaTableViewCell
            cell.setupCellWith(links: presenter.getCharacterMedia())
            cell.selectedMedia = { [weak self] media in
                self?.openMediaUrl(media)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
