//  ToDoListView.swift
//  datatodoapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 27.01.2024.
//

import SwiftUI

struct ToDoListView: View {
    let toDos: [ToDo]
    @Environment(\.modelContext) private var context

    var body: some View {
        List {
            ForEach(toDos) { toDo in
                NavigationLink(value: toDo) {
                    HStack {
                        Text(toDo.name)
                        Spacer()
                        Text(toDo.priority.description)
                    }
                }
                
            }
            .onDelete { indexSet in
                indexSet.forEach { index in
                    let toDoToDelete = toDos[index]
                    context.delete(toDoToDelete)
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }.navigationDestination(for: ToDo.self) { toDo in
            ToDoDetailScreen(toDo: toDo)
        }
    }
}

#Preview {
    ToDoListView(toDos: [ToDo(name: "test", priority: 123)]).modelContainer(for: [ToDo.self])
}
