//
//  ListItemTableViewCell.swift
//  marvelheroes
//
//  Created by Angel on 9/3/21.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setTitleText(_ title: String?) {
        titleLabel.text = title
    }
    
}
