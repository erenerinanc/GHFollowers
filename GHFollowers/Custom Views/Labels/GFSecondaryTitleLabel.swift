//
//  GFSecondaryLabel.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 2.07.2021.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    private func configure() {
        textColor                    = .secondaryLabel
        font                         = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth    = true
        minimumScaleFactor           = 0.90
        lineBreakMode                = .byTruncatingTail
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }

    
}
