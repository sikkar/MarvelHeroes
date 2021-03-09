//
//  StackViewExtension.swift
//  marvelheroes
//
//  Created by Angel on 9/3/21.
//

import UIKit

extension UIStackView {
    func safelyRemoveArrangedSubviews() {
        // Remove all the arranged subviews and save them to an array
        let removedSubviews: [UIView] = arrangedSubviews.reduce(into: []) { sum, next in
            self.removeArrangedSubview(next)
            return sum += [next]
        }

        // Deactive all constraints at once
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))

        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}


