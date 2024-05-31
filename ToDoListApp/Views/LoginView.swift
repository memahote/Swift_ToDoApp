//
//  LoginView.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                //header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15)
                
                //Login formulaire
                
                
                VStack (spacing: 20){
                    TextField("Email Address", text: $viewModel.email)                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TLButton(title: "Log In") {
                        //Login view
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                .frame(width: 350)
                
               
                
                Spacer()
                //Create account
                
                VStack {
                    Text("New User ?")
                    
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
