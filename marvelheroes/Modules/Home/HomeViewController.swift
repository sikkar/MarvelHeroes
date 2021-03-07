//
//  HomeViewController.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

protocol HomeViewProtocol: BasicViewProtocol {
}

class HomeViewController: BasicViewController {
    var presenter: HomePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

}

extension HomeViewController: HomeViewProtocol {
    
}
