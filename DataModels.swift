//
//  DataModels.swift
//  ConnectSphere
//
//  Created by Михайло Тихонов on 11.08.2025.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}


struct Friend: Codable, Identifiable {
    let id: UUID
    let name: String
}

extension User {
    static let example = User(
        id: UUID(),
        isActive: true,
        name: "Taylor Swift",
        age: 26,
        company: "Big Machine",
        email: "taylor.swift@example.com",
        address: "555, Taylor Swift Avenue, Nashville, TN 37203",
        about: "Taylor Swift is a global superstar, known for her narrative songwriting, which often centers around her personal life. She has sold over 200 million records worldwide.",
        registered: Date(),
        tags: ["singer", "songwriter", "pop", "country"],
        friends: [Friend.example, Friend.example, Friend.example] 
    )
}

extension Friend {
    static let example = Friend(id: UUID(), name: "John Appleseed")
}
