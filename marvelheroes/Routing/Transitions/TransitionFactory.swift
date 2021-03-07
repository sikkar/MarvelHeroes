//
//  TransitionFactory.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation

enum TransitionType {
    case push
    case modal
}

struct TransitionFactory {
    static func get(_ type: TransitionType) -> Transition {
        switch type {
        case .push:
            return PushTransition()
        case .modal:
            return ModalTransition()
        }
    }
}
