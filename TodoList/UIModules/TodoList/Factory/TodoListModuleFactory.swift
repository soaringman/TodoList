//
//  TodoListModuleFactory.swift
//  TodoList
//
//  Created by Алексей Гуляев on 24.05.2018.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import Foundation

protocol TodoListModuleFactory: class {
    func module() -> TodoListViewController
}
