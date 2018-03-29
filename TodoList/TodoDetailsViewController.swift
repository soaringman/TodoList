//
//  TodoDetailsViewController.swift
//  TodoList
//
//  Created by Алексей Гуляев on 22.03.2018.
//  Copyright © 2018 Alexey Gulyaev. All rights reserved.
//

import UIKit

class TodoDetailsViewController: UIViewController {
    // MARK: Dependencies
    private let todoItem: TodoItem
    private let todoDataProvider: TodoDataProvider
    
    
    // MARK: Subviews
    private var dateTimeLabel: UILabel
    private var themeLabel: UILabel
    private var textLabel: UILabel

    
    // MARK: Init
    init(todoItem: TodoItem,
         todoDataProvider: TodoDataProvider)
    {
        self.todoItem = todoItem
        self.todoDataProvider = todoDataProvider
        
        dateTimeLabel = UILabel(frame: .zero)
        themeLabel = UILabel(frame: .zero)
        textLabel = UILabel(frame: .zero)
       
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Визуальная настройка вью контроллера
        navigationItem.title = todoItem.text
        view.backgroundColor = UIColor.white
        edgesForExtendedLayout = UIRectEdge()
        
        // Настройка subviews
        dateTimeLabel.text = dateToString(todoItem.dateTime)
        themeLabel.text = todoItem.theme
        textLabel.text = todoItem.text
        
        // Добавление subviews в иерархию
        view.addSubview(dateTimeLabel)
        view.addSubview(themeLabel)
        view.addSubview(textLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var yOffset: CGFloat = 0
        let labelHeight: CGFloat = 44
        let horizontalGap: CGFloat = 15
        let verticalGap: CGFloat = 10
        
        let viewWidth = view.bounds.width
        let labelWidth = viewWidth - 2 * horizontalGap
        
        // Располагаем лейблы в ряд с отступами verticalGap между собой
        yOffset += verticalGap
        let dateFrame = CGRect(
            x: horizontalGap,
            y: yOffset,
            width: labelWidth,
            height: labelHeight
        )
        
        yOffset += labelHeight
        yOffset += verticalGap
        let themeFrame = CGRect(
            x: horizontalGap,
            y: yOffset,
            width: labelWidth,
            height: labelHeight
        )
        
        yOffset += labelHeight
        yOffset += verticalGap
        let textFrame = CGRect(
            x: horizontalGap,
            y: yOffset,
            width: labelWidth,
            height: labelHeight
        )
        
        dateTimeLabel.frame = dateFrame
        themeLabel.frame = themeFrame
        textLabel.frame = textFrame
    }
    
    
    // MARK: Formatting
    private let DateFormat = "yyyy-MM-dd HH:mm:ss"
    //функция конвертирует дату в стринг
    func dateToString(_ date: Date) -> String {
        // Инициализация форматтера дат
        let formatter = DateFormatter()
        // Формат для перевода из Date в String и обратно
        formatter.dateFormat = DateFormat
        // Получаем строку из даты
        let dateString = formatter.string(from: date)
        
        return dateString
    }
}
