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
