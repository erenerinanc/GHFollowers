//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 27.07.2021.
//

import UIKit

extension UIView {
    
    func pinToEdges(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview(_:))
    }
}
