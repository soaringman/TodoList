//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Boris Bengus on 22.02.18.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {
    var greatingLabel: UILabel!
    var todoListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        
        edgesForExtendedLayout = UIRectEdge()
        
        greatingLabel = UILabel(frame: CGRect.zero)
        greatingLabel.text = "Привет TodoList"
        view.addSubview(greatingLabel)
        
        todoListTableView = UITableView(frame: CGRect.zero)
        todoListTableView.backgroundColor = UIColor.gray
        view.addSubview(todoListTableView)
    }
    
    let greatingLabelHeight: CGFloat = 30.0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let greatingFrame = CGRect(
            x: 0,
            y: 0,
            width: view.bounds.width,
            height: greatingLabelHeight
        )
        greatingLabel.frame = greatingFrame
        
        let todoListFrame = CGRect(
            x: 0,
            y: greatingLabelHeight,
            width: view.bounds.width,
            height: view.bounds.height - greatingLabelHeight
        )
        todoListTableView.frame = todoListFrame
    }
}
