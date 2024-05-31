//
//  ProfilView.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import SwiftUI

struct ProfilView: View {
    @StateObject var viewModel = ProfilViewViewModel()

    
    var body: some View {
        NavigationView {
            VStack (spacing: 50){
                
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.pink)
                        .frame(width: 125)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name :")
                                .bold()
                            Text(user.name)
                        }
                        .padding()
                        HStack {
                            Text("Email :")
                                .bold()
                            Text(user.email)
                        }
                        .padding()

                        HStack {
                            Text("Member since :")
                                .bold()
                            Text("\(Date(timeIntervalSince: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding()

                    }
                    
                    TLButton(title: "Log Out") {
                        viewModel.logOut()
                    }
                    
                    Spacer()
                } else {
                    Text("Loading Profile ...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            print("ProfilView appeared")
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfilView()
}
