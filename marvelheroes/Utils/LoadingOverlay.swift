//
//  LoadingOverlay.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import Foundation
import UIKit

class LoadingOverlay {

    private var contentView = UIView()
    private var activityIndicator = UIActivityIndicatorView()

    static let shared: LoadingOverlay = LoadingOverlay()

    public func showOverlay(view: UIView) {
        if contentView.superview == nil {
            contentView = UIView(frame: UIScreen.main.bounds)
            let background = UIColor.gray
            contentView.backgroundColor = background.withAlphaComponent(0.4)
            activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.center = contentView.center
            contentView.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            view.addSubview(contentView)
        }
    }

    public func hideOverlay(){
        activityIndicator.stopAnimating()
        contentView.removeFromSuperview()
    }
}
