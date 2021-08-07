//
//  GFDataLoadingViewController.swift
//  GHFollowers
//
//  Created by Eren Erinanc on 14.07.2021.
//

import UIKit
import SnapKit


class GFDataLoadingViewController: UIViewController {
    
    var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor   = .systemBackground
        containerView.alpha             = 0
        
        UIView.animate(withDuration: 0.25, animations: {self.containerView.alpha = 0.8})
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { (make) in
            make.centerY.equalTo(containerView.snp.centerY)
            make.centerX.equalTo(containerView.snp.centerX)
        }
        
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.safeAreaLayoutGuide.layoutFrame
        view.addSubview(emptyStateView)
    }
    
}

