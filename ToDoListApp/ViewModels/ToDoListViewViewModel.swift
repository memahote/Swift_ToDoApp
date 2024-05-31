//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import Foundation
import FirebaseFirestore

/// Viewmodel for list of items view
///  Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId : String
    
    init (userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}
