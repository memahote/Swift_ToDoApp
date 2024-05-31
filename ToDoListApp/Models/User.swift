//
//  User.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import Foundation

struct User: Codable {
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
