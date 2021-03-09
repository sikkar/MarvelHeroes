//
//  CharacterMediaTableViewCell.swift
//  marvelheroes
//
//  Created by Angel on 9/3/21.
//

import UIKit

class CharacterMediaTableViewCell: UITableViewCell {
    @IBOutlet weak var stackView: UIStackView!
    var selectedMedia: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setupCellWith(links: [CharacterLinks]) {
        stackView.safelyRemoveArrangedSubviews()
        for link in links {
            let button = MediaButton(with: link.url ?? "")
            button.setTitle(link.type, for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }

    @objc
    func buttonTapped(sender: MediaButton) {
        selectedMedia?(sender.url)
    }
}
