//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            Spacer()
            
            VStack (spacing : 10) {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(.roundedBorder)
                
                DatePicker("Date", selection: $viewModel.date)
                    .datePickerStyle(.graphical)
                
                TLButton(title: "Save") {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding(.bottom, 150)
                
                
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text ("Please fill in all Fields and select date that is today or newer"))
            })
            .frame(width: 350)
            
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
