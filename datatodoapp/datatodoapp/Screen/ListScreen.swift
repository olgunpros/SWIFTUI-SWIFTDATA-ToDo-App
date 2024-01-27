//
//  ListView.swift
//  datatodoapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 27.01.2024.
//

import SwiftUI
import SwiftData

struct ListScreen: View {
    @Query(sort: \ToDo.name, order: .forward) private var toDos: [ToDo]
    @State private var isAddToDoPresented: Bool = false
    
    var body: some View {
        NavigationView {
            ToDoListView(toDos: toDos)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add ToDo") {
                            isAddToDoPresented.toggle()
                        }
                    }
                }
        }
        .sheet(isPresented: $isAddToDoPresented) {
            AddToDoScreen()
        }
    }
}

#if DEBUG
struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListScreen().modelContainer(for: [ToDo.self])
        }
    }
}
#endif
