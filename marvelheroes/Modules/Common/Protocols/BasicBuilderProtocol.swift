//
//  BasicBuilderProtocol.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation
import UIKit

protocol BasicBuilderProtocol {
    var openTransition: Transition? { get set }

    func build() -> UIViewController
}
