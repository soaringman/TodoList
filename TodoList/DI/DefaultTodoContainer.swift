//
//  DefaultTodoContainer.swift
//  TodoList
//
//  Created by Алексей Гуляев on 24.05.2018.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import Foundation

final class DefaultTodoContainer: TodoContainer {
    
    
    
    // MARK: TodoContainer
    func getTodoListModuleFactory() -> TodoListModuleFactory {
        return TodoListModuleFactoryImpl(container: self)
    }
    
    func getTodoDetailsModuleFactory() -> TodoDetailsModuleFactory {
        return TodoDetailsModuleFactoryImpl(container: self)
    }
    
    fileprivate var _todoDataProvider: TodoDataProvider?
    func getTodoDataProvider() -> TodoDataProvider {
        if let todoDataProvider = _todoDataProvider {
            return todoDataProvider
        }
        
        let todoDataProvider = TodoDataProviderImpl()
        self._todoDataProvider = todoDataProvider
        
        return todoDataProvider
    }
}
