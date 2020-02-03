//
//  UIViewController+EXT.swift
//  GHFollowers
//
//  Created by Daniel Salmon on 03/01/2020.
//  Copyright © 2020 Soinad. All rights reserved.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        let activityIndactor = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndactor)
        
        activityIndactor.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndactor.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndactor.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        activityIndactor.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
        containerView.removeFromSuperview()
        containerView = nil
        }
    }
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
