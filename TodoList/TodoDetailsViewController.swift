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
    
    //задание переменных под кнопки
    private var isCompletedButton: UIButton
    private var isNotCompletedButton: UIButton
    //задание переменных под картинки для кнопок
    private var isCompletedButtonImage: UIImage!
    private var isNotCompletedButtonImage: UIImage!
    private let buttonSize: CGFloat = 50.0

    
    // MARK: Init
    init(todoItem: TodoItem,
         todoDataProvider: TodoDataProvider)
    {
        self.todoItem = todoItem
        self.todoDataProvider = todoDataProvider
        
        dateTimeLabel = UILabel(frame: .zero)
        themeLabel = UILabel(frame: .zero)
        textLabel = UILabel(frame: .zero)
        
        //инициализация переменных под кнопки и присваивание им значений
        isCompletedButton = UIButton(frame: .zero)
        isNotCompletedButton = UIButton(frame: .zero)
     
       
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
        
        //настройка кнопки isCompletedButton
        isCompletedButtonImage = UIImage(named: "isCompletedImage")!.withRenderingMode(.alwaysOriginal)
        isCompletedButton.setImage(isCompletedButtonImage, for: .normal)
        isCompletedButton.contentMode = .scaleAspectFit
//        isCompletedButton.layer.cornerRadius = buttonSize / 2
//        isCompletedButton.layer.masksToBounds = false
//        isCompletedButton.backgroundColor = UIColor.green
        
        //        работаем с тенью isCompletedButton
        isCompletedButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        isCompletedButton.layer.shadowOpacity = 0.1
        isCompletedButton.layer.shadowRadius = 1
        
        //настройка кнопки isNotCompletedButton
        isNotCompletedButtonImage = UIImage(named: "isNotCompletedImage")!.withRenderingMode(.alwaysOriginal)
        isNotCompletedButton.setImage(isNotCompletedButtonImage, for: .normal)
        isCompletedButton.contentMode = .scaleAspectFit
        //        isCompletedButton.layer.cornerRadius = buttonSize / 2
        //        isCompletedButton.layer.masksToBounds = false
        //        isCompletedButton.backgroundColor = UIColor.green
        
        //        работаем с тенью isCompletedButton
        isNotCompletedButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        isNotCompletedButton.layer.shadowOpacity = 0.1
        isNotCompletedButton.layer.shadowRadius = 1
        
        // Добавление subviews в иерархию
        view.addSubview(dateTimeLabel)
        view.addSubview(themeLabel)
        view.addSubview(textLabel)
        
        view.addSubview(isCompletedButton)
        view.addSubview(isNotCompletedButton)
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
        
        //задание фрейма для кнопки isCompleted
        let iscompletedButtonFrame = CGRect(
            //x: horizontalGap,
            x: buttonSize * 2,
            //y: yOffset,
            y: view.bounds.height - buttonSize,
            width: buttonSize,
            height: buttonSize
         )
        
        //задание фрейма для кнопки isNotCompleted
        let isNotcompletedButtonFrame = CGRect(
            //x: horizontalGap,
            x: view.bounds.width - (buttonSize * 2),
            //y: yOffset,
            y: view.bounds.height - buttonSize,
            width: buttonSize,
            height: buttonSize
        )
        
        dateTimeLabel.frame = dateFrame
        themeLabel.frame = themeFrame
        textLabel.frame = textFrame
        
        isCompletedButton.frame = iscompletedButtonFrame
        isNotCompletedButton.frame = isNotcompletedButtonFrame
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
