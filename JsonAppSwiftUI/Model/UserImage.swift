//
//  UserImage.swift
//  JsonAppSwiftUI
//
//  Created by Developer on 22/07/25.
//

import Foundation

struct APIResponse: Decodable {
    let data: [UserImage]
}

struct UserImage: Decodable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}
