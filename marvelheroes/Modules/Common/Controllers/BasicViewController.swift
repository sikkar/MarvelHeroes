//
//  BasicViewController.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

class BasicViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyles()
    }

    //Override this function to get called in child view controllers
    func applyStyles() {}
}
