//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // header
            HeaderView(title: "Register", subtitle: "Start organize your things", angle: -15)
            
            // Form
            
            VStack (spacing : 10){
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()

                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                
                TLButton(title: "Create Account") {
                    viewModel.register()
                }

            }
            .padding(.top)
            .offset(y: -50)
            .frame(width: 350)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
