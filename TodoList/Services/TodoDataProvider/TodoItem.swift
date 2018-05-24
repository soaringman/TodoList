//
//  TodoItem.swift
//  TodoList
//
//  Created by Алексей Гуляев on 01.03.2018.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import Foundation

struct TodoItem {
    let todoItemId: UUID
    var dateTime: Date
    var theme: String
    var text: String
    var isCompleted: Bool
    
    init(dateTime: Date,
         theme: String,
         text: String,
         isCompleted: Bool) {
        
        todoItemId = UUID()
        
        self.dateTime = dateTime
        self.theme = theme
        self.text = text
        self.isCompleted = isCompleted
    }
}
