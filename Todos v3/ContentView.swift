//
//  ContentView.swift
//  Todos v3
//
//  Created by YJ Soon on 9/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNewSheetShown = false
    
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        NavigationView {
            List {
                ForEach($todoManager.todos) { $todo in
                    NavigationLink {
                        TodoDetailView(todo: $todo)
                    } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            Text(todo.title)
                        }
                    }
                }
                .onDelete { indexSet in
                    todoManager.todos.remove(atOffsets: indexSet)
                }
                .onMove { originalOffset, newOffset in
                    todoManager.todos.move(fromOffsets: originalOffset, toOffset: newOffset)
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isNewSheetShown = true
                    } label : {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
        .sheet(isPresented: $isNewSheetShown) {
            NewTodoView(todos: $todoManager.todos)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
