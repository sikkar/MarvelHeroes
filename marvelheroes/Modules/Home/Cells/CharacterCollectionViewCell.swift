//
//  CharacterCollectionViewCell.swift
//  marvelheroes
//
//  Created by Angel on 8/3/21.
//

import UIKit
import AlamofireImage

class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var charImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
    }

    func configureCellWith(name: String, image: URL?) {
        self.nameLabel.text = name
        charImageView.image = nil
        guard let imageUrl = image else {
            return
        }
        activityIndicator.startAnimating()
        charImageView.af.setImage(withURL: imageUrl, completion: { [weak self] _ in
            self?.activityIndicator.stopAnimating()
        })
    }
}
