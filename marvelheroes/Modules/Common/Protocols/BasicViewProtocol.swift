//
//  BasicViewProtocol.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation
import UIKit

protocol BasicViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
}

extension UIViewController: BasicViewProtocol {
    func showLoading() {
        LoadingOverlay.shared.showOverlay(view: self.view)
    }

    func hideLoading() {
        LoadingOverlay.shared.hideOverlay()
    }
}
