//
//  CharacterImageTableViewCell.swift
//  marvelheroes
//
//  Created by Angel on 9/3/21.
//

import UIKit

class CharacterImageTableViewCell: UITableViewCell {
    @IBOutlet weak var charImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setImage(_ image: URL?) {
        guard let imageUrl = image else {
            return
        }
        activityIndicator.startAnimating()
        charImageView.af.setImage(withURL: imageUrl, completion: { [weak self] _ in
            self?.activityIndicator.stopAnimating()
        })
    }
}
