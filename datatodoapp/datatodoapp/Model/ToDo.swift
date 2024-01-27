//
//  ToDo.swift
//  datatodoapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 27.01.2024.
//

import Foundation
import SwiftData

@Model
final class ToDo {
    var name: String
    var priority : Int
    init(name: String, priority: Int) {
        self.name = name
        self.priority = priority
    }
}
