//
//  UserModel.swift
//  Suit-School-Test-Project
//
//  Created by ahmadfarhanqf on 08/06/26.
//

import Foundation

struct ReqResUserResponse: Codable {
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [UserModel]
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}

struct UserModel: Identifiable, Codable, Hashable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
