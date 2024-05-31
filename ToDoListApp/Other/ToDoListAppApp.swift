//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by apprenant65 on 22/05/2024.
//

import SwiftUI
import FirebaseCore


@main
struct ToDoListAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
