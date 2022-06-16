//
//  AuthManager.swift
//  movie-app
//
//  Created by Bao Hoang Gia on 07/06/2022.
//

import Foundation

enum Authentication {
    case login
    case main
}

class AuthManager {
    static let shared: AuthManager = AuthManager()
    var authentication: Authentication = .login
    let registerUrl: String = "https://www.themoviedb.org/signup"
}
