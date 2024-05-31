//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
    func login ( ){
        guard validate() else {
            return
        }
        
        //Log the user
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate( ) -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty , !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        return true
    }
}
