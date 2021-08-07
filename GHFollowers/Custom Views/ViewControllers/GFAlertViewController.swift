//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 21.06.2021.
//

import UIKit
import SnapKit

class GFAlertViewController: UIViewController {
    
    let containerView   = GFAlertContainerView()
    let titleLabel      = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel    = GFBodyLabel(textAlignment: .center)
    let actionButton    = GFButton(backgroundColor: .red, title: "Ok")
    
    var alertTitle: String?
    var alertMessage: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        alertTitle = title
        alertMessage = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addSubviews(containerView, titleLabel, messageLabel, actionButton)
        layoutUI()
    }
    
    private func layoutUI() {
        //MARK: -Configure ContainerView
        containerView.snp.makeConstraints { (make) in
            make.centerY.equalTo(view.snp.centerY)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(280)
            make.height.equalTo(220)
        }
        //MARK: -Configure TitleLabel
        titleLabel.text = alertTitle ?? "Something went wrong"
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).offset(padding)
            make.leading.equalTo(containerView.snp.leading).offset(padding)
            make.trailing.equalTo(containerView.snp.trailing).inset(padding)
            make.height.equalTo(28)
        }
        //MARK: -Configure MessageLabel
        messageLabel.text           = alertMessage ?? "Unable to complete request"
        messageLabel.numberOfLines  = 4
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).inset(8)
            make.leading.equalTo(containerView.snp.leading).offset(padding)
            make.trailing.equalTo(containerView.snp.trailing).inset(padding)
            make.bottom.equalTo(actionButton.snp.top).offset(12)
        }
        //MARK: -Configure ActionButton
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        actionButton.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.leading.equalTo(containerView.snp.leading).offset(padding)
            make.trailing.equalTo(containerView.snp.trailing).inset(padding)
            make.bottom.equalTo(containerView.snp.bottom).inset(padding)
        }
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }


}
