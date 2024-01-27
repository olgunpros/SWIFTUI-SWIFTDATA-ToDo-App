//
//  ToDoDetailScreen.swift
//  datatodoapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 27.01.2024.
//

import SwiftUI

struct ToDoDetailScreen: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private  var name : String = ""
    @State private  var priority : Int?
    
    let toDo : ToDo
    var body: some View {
        Form {
            TextField("Name: ",text: $name)
            TextField("priority: ",value: $priority, format: .number)
            Button("Update") {
                guard let priority = priority else {return}
                toDo.name = name
                toDo.priority = priority
                do {
                    try context.save()
                }catch {
                    print(error.localizedDescription)
                }
                dismiss()
                
            }.onAppear {
                name = toDo.name
                priority = toDo.priority
            }
        }
    }
}

