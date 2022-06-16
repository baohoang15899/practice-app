//
//  LoginViewController.swift
//  movie-app
//
//  Created by Bao Hoang Gia on 07/06/2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet private weak var vLayer: UIView!
    @IBOutlet private weak var ivBg: UIImageView!
    @IBOutlet private weak var tfUsername: UITextField!
    @IBOutlet private weak var tfPassword: UITextField!
    @IBOutlet private weak var btnSubmit: UIButton!
    @IBOutlet private weak var lbDescription: UILabel!
    @IBOutlet private weak var cTop: NSLayoutConstraint!
    @IBOutlet private weak var lbLink: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        dismissKeyboard()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }

    private func setupUI() {
        ivBg.image = UIImage(named: "bg")
        ivBg.contentMode = .scaleAspectFill
        vLayer.backgroundColor = .black
        vLayer.alpha = 0.6
        btnSubmit.backgroundColor = .red
        btnSubmit.layer.cornerRadius = 10
        btnSubmit.setTitle("Login", for: .normal)
        btnSubmit.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        btnSubmit.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
        lbDescription.textColor = .white
        lbDescription.font = .systemFont(ofSize: 15, weight: .medium)
        lbDescription.text = "Don't have an account?"
        lbLink.font = .systemFont(ofSize: 15, weight: .medium)
        lbLink.textColor = .white
        lbLink.attributedText = NSAttributedString(string: "Register Now.", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        lbLink.textColor = Colors.LinkColor
        cTop.constant = (150 / self.view.frame.height) * self.view.frame.height
        tfUsername.placeholder = "username"
        tfPassword.placeholder = "password"
        let tap = UITapGestureRecognizer(target: self, action: #selector(navigateToRegister))
        lbLink.addGestureRecognizer(tap)
        lbLink.isUserInteractionEnabled = true
    }
    
    private func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc
    private func onTapLogin() {
//        UserDefaults.standard.set(true, forKey: "auth")
//        AppDelegate.shared.changeRootView(isLogin: true)
        startLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.stopLoading()
        })
    }
    
    @objc
    private func navigateToRegister() {
        present(RegisterViewController(), animated: true)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
