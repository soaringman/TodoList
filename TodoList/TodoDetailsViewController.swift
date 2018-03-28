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
    /*
    //Писал все в комитах потому что не понимаю как можно проинициализировать
    //Создам переменнную для того что бы в дальнейшем использовать ее для описания вьюхи размером на весь свободный TodoDetailsViewController
    private let todoDetailsView: UIView!
     
    //добавляю новые переменные (типа UILabel для того что бы в них в дальнейшем в них положить содержимое TodoItem соответствующих полей )
    private var todoLabeldateTime: UILabel
    private var todoLabelTheme: UILabel
    private var todoLabelText: UILabel
    private var todoImageisCompleted: UIImage
    
    */
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
        /*
         todoDetailsView = UIView(frame: CGRect.zero)
         
         //Добавляем наши поля
         todoLabeldateTime = todoItem.dateTime
         todoLabelTheme = todoItem.theme
         todoLabelText = todoItem.text
         
         //есть сомнения по поводу правильности ниженаписанного так как isComleted булево значение
         todoImageisCompleted = todoItem.isCompleted
         
         //добавляю мою вьюху как Subview
         view.addSubview(todoDetailsView)
         
         //Использую для того что бы расширить DetailsView на весь экран
         override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         
         todoDetailsView.frame = view.bounds
         }
         //Надо задать отступы для полей (todoLabeldateTime = todoItem,todoLabelTheme, todoLabelText)
         //
 */
    
    }
}
