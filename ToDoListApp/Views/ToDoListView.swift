//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    
    init(userId: String) {
        
        //user/<id>/todos/<value>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                                    
                            }
                            .tint(.pink)
                            
                        }
                        
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView , content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
                
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "pJuEeTcdkbcsnRCwfqyfCLmgsqg1")
}
