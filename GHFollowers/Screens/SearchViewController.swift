//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 17.06.2021.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    let logoImageView       = UIImageView()
    let usernameTextField   = GFTextField()
    let callToActionButton  = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    var logoImageViewTopConstraint: NSLayoutConstraint!

    var isUserNameEntered: Bool { return !usernameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(logoImageView, usernameTextField, callToActionButton)
        layoutUI()
    
        createDismissKeyboardTapGesture()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC() {
        guard isUserNameEntered else {
            presentGFAlertOnMainThread(title: "Empty username", message: "Please enter a username. We need to know who to look for 🧐", buttonTitle: "Ok")
            return
        }
        
        let followerListViewController            = FollowersListViewController(username: usernameTextField.text!)
        navigationController?.pushViewController(followerListViewController, animated: true)
    }
    
    private func layoutUI() {
        //MARK: -Configure LogoImageView
        logoImageView.image = Images.ghLogo
        
        let topConstraintConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 80
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(topConstraintConstant)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
        //MARK: -Configure TextField
        usernameTextField.delegate = self
        usernameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).inset(-48)
            make.leading.equalTo(view.snp.leading).inset(50)
            make.trailing.equalTo(view.snp.trailing).inset(50)
            make.height.equalTo(50)
        }
        
        //MARK: -Configure CallToActionButton
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        callToActionButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(80)
            make.leading.equalTo(view.snp.leading).inset(50)
            make.trailing.equalTo(view.snp.trailing).inset(50)
            make.height.equalTo(50)
        }
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        
        return true
    }
    
}
