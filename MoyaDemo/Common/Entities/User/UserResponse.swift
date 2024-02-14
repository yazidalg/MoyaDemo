//
//  UserResponse.swift
//  MoyaDemo
//
//  Created by Yazid Al Ghozali on 14/02/24.
//

import Foundation

// Codable = protocol dimana struct user nantinya bisa di decode / encode
struct User: Codable, Identifiable {
    var id: Int?
    var email: String?
    var firstName: String?
    var lastName: String?
    var avatar: String?
    
    // Membuat penamaan dari swift seperti 'firstName' menjadi 'first_name'
    // sesuai penamaan dari backend
    enum CodingKeys: String, CodingKey {
        case id, email, avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
    var fullName: String {
        return (firstName ?? "") + " " + (lastName ?? "")
    }
}

// Cara gampang tapi kedepannya ribet
struct UserListResponse: Codable {
    var data: [User]?
}

struct UserResponse: Codable {
    var data: User?
}
