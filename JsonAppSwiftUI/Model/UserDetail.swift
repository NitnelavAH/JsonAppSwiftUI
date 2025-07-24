//
//  UserDetail.swift
//  JsonAppSwiftUI
//
//  Created by Developer on 23/07/25.
//

import Foundation

// MARK: - User
struct UserDetail: Codable {
    let data: UserData
    let support: Support
}

// MARK: - DataClass
struct UserData: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}
