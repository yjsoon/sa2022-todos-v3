//
//  ContentView.swift
//  Todos v3
//
//  Created by YJ Soon on 9/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var todos = [
        Todo(title: "Feed the cat"),
        Todo(title: "Water the plants"),
        Todo(title: "Completely change all the groups and watch everyone panic", isCompleted: true)
    ]
    
    var body: some View {
        NavigationView {
            List($todos) { $todo in
                NavigationLink {
                    TodoDetailView(todo: $todo)
                } label: {
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                        Text(todo.title)
                    }
                }
            }
            .navigationTitle("Todos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
