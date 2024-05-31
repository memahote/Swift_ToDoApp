//
//  ContentView.swift
//  ToDoListApp
//
//  Created by apprenant65 on 22/05/2024.
//

import SwiftUI
import FirebaseCore

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //Signed in view
            accountView
            
        } else {
            LoginView()

        }
        
    }
    
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userId :viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfilView()
                .tabItem {
                    Label("Profil", systemImage: "person.circle")
                }

        }
    }
}

#Preview {
    MainView()
}
