//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// Viewmodel for single to do list iitem view (each row)
class ToDoListItemViewViewModel: ObservableObject {
    init () {
        
    }
    
    func toggleIsDone(item : ToDoListItem) {
        var newItem = item //new item because item is constant
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
