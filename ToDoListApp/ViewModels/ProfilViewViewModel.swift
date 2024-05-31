//
//  ProfilViewViewModel.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfilViewViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init() {
            Auth.auth().addStateDidChangeListener { [weak self] _, user in
                if let _ = user {
                    print("User is signed in")
                    self?.fetchUser()
                } else {
                    print("User is not signed in")
                    self?.user = nil
                }
            }
        }
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
               db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
                   if let error = error {
                       print("Error fetching user: \(error.localizedDescription)")
                       return
                   }
                   
                   guard let data = snapshot?.data() else {
                       print("No data found for user")
                       return
                   }
                   
                   DispatchQueue.main.async {
                       self?.user = User(id: data["id"] as? String ?? "",
                                         name: data["name"] as? String ?? "",
                                         email: data["email"] as? String ?? "",
                                         joined: data["joined"] as? TimeInterval ?? 0)
                       print("User data fetched: \(String(describing: self?.user))")
                   }
               }
           }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
