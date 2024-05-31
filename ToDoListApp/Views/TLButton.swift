//
//  TLButton.swift
//  ToDoListApp
//
//  Created by apprenant65 on 26/05/2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.pink)
                    .frame(width: 250, height: 50)
                
                Text(title)
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(title: "Title") {
        //action
    }
}
