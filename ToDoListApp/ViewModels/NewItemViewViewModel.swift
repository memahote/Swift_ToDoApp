//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
    @Published var showAlert = false
    
    init () {
        
    }
    
   func save () {
       guard canSave else {
           return
       }
           //get current user id
       guard let uid = Auth.auth().currentUser?.uid else {
           return
       }
       //create a model
       let newId = UUID().uuidString
       let newItem = ToDoListItem(id: newId, title: title, date: date.timeIntervalSince1970, currentDate: Date().timeIntervalSince1970, isDone: false)
       
       // save a model
       
       let db = Firestore.firestore()
       
       db.collection("users")
           .document(uid)
           .collection("todos")
           .document(newId)
           .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard date >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
    
}
