//
//  UIViewController.swift
//  movie-app
//
//  Created by Bao Hoang Gia on 09/06/2022.
//

import Foundation
import UIKit

extension UIViewController {
    static let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    static let overlay: UIView = UIView()
    
    func startLoading() {
        let indicator = UIViewController.activityIndicator
        let overlay = UIViewController.overlay
        
        view.addSubview(overlay)
        overlay.backgroundColor = .black
        overlay.alpha = 0.6
        overlay.frame = view.bounds
        
        view.addSubview(indicator)
        if #available(iOS 13.0, *) {
            indicator.style = UIActivityIndicatorView.Style.large
        } else {
            indicator.style = UIActivityIndicatorView.Style.whiteLarge
        }
        indicator.color = .red
        indicator.center = view.center
        indicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func stopLoading(){
        let indicator = UIViewController.activityIndicator
        let overlay = UIViewController.overlay
        indicator.stopAnimating()
        indicator.removeFromSuperview()
        overlay.removeFromSuperview()
        view.isUserInteractionEnabled = true
    }
}
