//
//  TodoDataProviderImpl.swift
//  TodoList
//
//  Created by Алексей Гуляев on 24.05.2018.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import Foundation

final class TodoDataProviderImpl: TodoDataProvider {
    fileprivate var todoItems: [TodoItem] = []
    
    
    // MARK: Init
    init() {
        var eachTodoItem: TodoItem
        
        eachTodoItem = TodoItem(
            dateTime: Date(),
            theme: "Личное",
            text: "Сходить за покупками на рынок, Постирать белье, Приготовить еду, Сделать английский, Дописать ToDoDetailView. Сходить за покупками на рынок, Постирать белье, Приготовить еду, Сделать английский, Дописать ToDoDetailView. Сходить за покупками на рынок, Постирать белье, Приготовить еду, Сделать английский, Дописать ToDoDetailView",
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
    
    
    // MARK: TodoDataProvider
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
        
        
        // sdf
    }
}

