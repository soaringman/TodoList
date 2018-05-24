//
//  TodoListModuleFactoryImpl.swift
//  TodoList
//
//  Created by Алексей Гуляев on 24.05.2018.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import Foundation

final class TodoListModuleFactoryImpl: TodoListModuleFactory {
    fileprivate let container: TodoContainer
    
    // MARK: Init
    init(container: TodoContainer) {
        self.container = container
    }
    
    
    // MARK: TodoListModuleFactory
    func module() -> TodoListViewController {
        let todoDataProvider = container.getTodoDataProvider()
        let todoDetailsModuleFactory = container.getTodoDetailsModuleFactory()
        
        let viewController = TodoListViewController(
            todoDataProvider: todoDataProvider,
            todoDetailsModuleFactory: todoDetailsModuleFactory
        )
        
        return viewController
    }
}
