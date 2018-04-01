//
//  TodoDataProvider.swift
//  TodoList
//
//  Created by Алексей Гуляев on 01.03.2018.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import Foundation

class TodoDataProvider {
    
    var todoItems: [TodoItem] = []
    
    init() {
        var eachTodoItem: TodoItem
        
        eachTodoItem = TodoItem(
            dateTime: Date(),
            theme: "Личное",
            text: "Сходить за покупками на рынок, Постирать белье, Приготовить еду, Сделать английский, Дописать ToDoDetailView",
            isCompleted: false
        )
        todoItems.append(eachTodoItem)
        
        eachTodoItem = TodoItem(
            dateTime: Date(),
            theme: "Работа",
            text: "Закончить месячный отчет",
            isCompleted: false
        )
        todoItems.append(eachTodoItem)
        
        eachTodoItem = TodoItem(
            dateTime: Date(),
            theme: "Работа",
            text: "Планерка с подчиненными",
            isCompleted: false
        )
        todoItems.append(eachTodoItem)
        
        eachTodoItem = TodoItem(
            dateTime: Date(),
            theme: "Личное",
            text: "Сходить в кино с женой",
            isCompleted: false
        )
        todoItems.append(eachTodoItem)
    }
    
    
    func getTodoItems() -> [TodoItem] {
        return todoItems
    }
    
    func saveTodoItem(todoItem: TodoItem) {
        let existingIndex = todoItems.index(where: { eachTodoItem -> Bool in
            return eachTodoItem.todoItemId == todoItem.todoItemId
        })
        
        if let existingIndex = existingIndex {
            todoItems[existingIndex] = todoItem
        } else {
            todoItems.append(todoItem)
        }
        
        // TODO: Сделать сохранение на диск (UserDefaults или json файл)
    }
}
