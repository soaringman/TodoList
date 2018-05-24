//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Boris Bengus on 22.02.18.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import UIKit

class TodoListViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate
{
    fileprivate let todoDataProvider: TodoDataProvider
    fileprivate let todoDetailsModuleFactory: TodoDetailsModuleFactory
    
    
    // MARK: Subviews
    private var todoListTableView: UITableView!
    
    private var todoItems: [TodoItem] = []
    
    init(todoDataProvider: TodoDataProvider,
         todoDetailsModuleFactory: TodoDetailsModuleFactory)
    {
        self.todoDataProvider = todoDataProvider
        self.todoDetailsModuleFactory = todoDetailsModuleFactory
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "TodoList"
        view.backgroundColor = UIColor.white
        
        edgesForExtendedLayout = UIRectEdge()
        
        todoListTableView = UITableView(frame: CGRect.zero)
        todoListTableView.dataSource = self
        todoListTableView.delegate = self
        view.addSubview(todoListTableView)
        
        todoItems = todoDataProvider.getTodoItems()
        todoListTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        todoListTableView.frame = view.bounds
    }
    
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    let cellIdentifier = "TodoCellIdentifier"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reusedCell = todoListTableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        return cell
    }
    
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item = todoItems[indexPath.row]
        cell.textLabel?.text = "\(item.theme) - \(item.text)"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let todoItem = todoItems[indexPath.row]
        
        let todoDetailsModuleSeed = TodoDetailsModuleSeed(todoItem: todoItem)
        let detailsViewController = todoDetailsModuleFactory.module(moduleSeed: todoDetailsModuleSeed)
        
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
