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
    func showLoading(lockScreen: Bool)
    func hideLoading()
}

extension UIViewController: BasicViewProtocol {
    func showLoading() {
        showLoading(lockScreen: true)
    }

    func showLoading(lockScreen: Bool) {
    }

    func hideLoading() {
    }
}
