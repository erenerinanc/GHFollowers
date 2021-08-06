//
//  GFContainerView.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 22.06.2021.
//

import UIKit

class GFAlertContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor    = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth  = 2
        layer.borderColor  = UIColor.white.cgColor
    }
}
