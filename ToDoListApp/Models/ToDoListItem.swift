//
//  ToDoListItem.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let date: TimeInterval
    let currentDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
