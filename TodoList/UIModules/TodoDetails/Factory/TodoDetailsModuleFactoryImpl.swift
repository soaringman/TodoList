//
//  TodoDetailsModuleFactoryImpl.swift
//  TodoList
//
//  Created by Алексей Гуляев on 24.05.2018.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import Foundation

final class TodoDetailsModuleFactoryImpl: TodoDetailsModuleFactory {
    fileprivate let container: TodoContainer
    
    // MARK: Init
    init(container: TodoContainer) {
        self.container = container
    }
    
    
    // MARK: TodoDetailsModuleFactory
    func module(moduleSeed: TodoDetailsModuleSeed) -> TodoDetailsViewController {
        let todoDataProvider = container.getTodoDataProvider()
        
        let viewController = TodoDetailsViewController(
            todoItem: moduleSeed.todoItem,
            todoDataProvider: todoDataProvider
        )
        
        return viewController
    }
}
