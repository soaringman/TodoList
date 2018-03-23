//
//  TodoDetailsViewController.swift
//  TodoList
//
//  Created by Алексей Гуляев on 22.03.2018.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import UIKit

class TodoDetailsViewController: UIViewController {
    
    private let todoItem: TodoItem
    private let todoDataProvider: TodoDataProvider
    
    init(todoItem: TodoItem, todoDataProvider: TodoDataProvider) {
        self.todoItem = todoItem
        self.todoDataProvider = todoDataProvider
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = todoItem.text
        view.backgroundColor = UIColor.white
    }
}
