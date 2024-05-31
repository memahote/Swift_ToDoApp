//
//  ToDoListItemView.swift
//  ToDoListApp
//
//  Created by apprenant65 on 24/05/2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(item.title)
                    .bold()
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.date).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item : item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.pink)
            }
        }
       
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "Get milk", date: Date().timeIntervalSince1970, currentDate: Date().timeIntervalSinceNow, isDone: false))
}
