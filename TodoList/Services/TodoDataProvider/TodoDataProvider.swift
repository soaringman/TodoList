//
//  TodoDataProvider.swift
//  TodoList
//
//  Created by Алексей Гуляев on 01.03.2018.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import Foundation

protocol TodoDataProvider: class {
    func getTodoItems() -> [TodoItem]
    func saveTodoItem(todoItem: TodoItem)
}
