//
//  MediaButton.swift
//  marvelheroes
//
//  Created by Angel on 9/3/21.
//

import UIKit

class MediaButton: UIButton {
    var url: String

    init(with url: String) {
        self.url = url
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
