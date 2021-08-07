//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 21.06.2021.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment          = textAlignment
    }
    
    private func configure() {
        textColor                    = .secondaryLabel
        font                         = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth    = true
        minimumScaleFactor           = 0.75
        lineBreakMode                = .byWordWrapping
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }

}
