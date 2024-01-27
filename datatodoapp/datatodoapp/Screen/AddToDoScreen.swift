//
//  ContentView.swift
//  datatodoapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 27.01.2024.
//

import SwiftUI
import SwiftData

struct AddToDoScreen: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    
    
    @State private  var name : String = ""
    @State private  var priority : Int?
    private var isFormValid : Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && priority != nil
        
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name: ",text: $name)
                TextField("priority: ",value: $priority, format: .number)
            }.navigationTitle("Add ToDo")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Dismiss")
                        }
                        
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            guard let priority = priority else {return}
                            let toDo = ToDo(name: name, priority: priority)
                            context.insert(toDo)
                            do {
                                try context.save()
                            }
                            catch {
                                print(error.localizedDescription)
                            }
                            dismiss()
                        } label: {
                            Text("Save")
                        }.disabled(!isFormValid)
                        
                    }
                }
        }
    }
}

#Preview {
    AddToDoScreen().modelContainer(for: [ToDo.self])
}
