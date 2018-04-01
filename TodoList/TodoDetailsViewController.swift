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
    
    private var markDateTimeLabel: UILabel
    private var markTheme: UILabel
    private var markText: UILabel
    
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
        
        markDateTimeLabel = UILabel(frame: .zero)
        markTheme = UILabel(frame: .zero)
        markText = UILabel(frame: .zero)
        
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
        //рисуем заголовок Дата
        markDateTimeLabel.text = "Дата:"
        markDateTimeLabel.textAlignment = NSTextAlignment.center
        markDateTimeLabel.layer.borderColor = UIColor.black.cgColor
        markDateTimeLabel.layer.borderWidth = 1.0
        markDateTimeLabel.layer.cornerRadius = 10
        
        //рисуем текущую дату
        dateTimeLabel.text = dateToString(todoItem.dateTime)
        dateTimeLabel.textAlignment = NSTextAlignment.center
        dateTimeLabel.layer.borderColor = UIColor.black.cgColor
        dateTimeLabel.layer.borderWidth = 1.0
        dateTimeLabel.layer.cornerRadius = 10
        
        //рисуем заголовок Тема
        markTheme.text = "Тема:"
        markTheme.textAlignment = NSTextAlignment.center
        markTheme.layer.borderColor = UIColor.black.cgColor
        markTheme.layer.borderWidth = 1.0
        markTheme.layer.cornerRadius = 10
        
        //рисуем текущую тему
        themeLabel.text = todoItem.theme
        themeLabel.textAlignment = NSTextAlignment.center
        themeLabel.layer.borderColor = UIColor.black.cgColor
        themeLabel.layer.borderWidth = 1.0
        themeLabel.layer.cornerRadius = 10
        
        //рисуем заголовок текст
        markText.text = "Текст:"
        markText.textAlignment = NSTextAlignment.center
        markText.layer.borderColor = UIColor.black.cgColor
        markText.layer.borderWidth = 1.0
        markText.layer.cornerRadius = 10
        
        //рисуем текущий текст
        textLabel.text = todoItem.text
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.layer.borderColor = UIColor.black.cgColor
        textLabel.layer.borderWidth = 1.0
        textLabel.layer.cornerRadius = 10
        
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
        
        //добавляем заголовок Дата
        view.addSubview(markDateTimeLabel)
        //добавляем текущую дату
        view.addSubview(dateTimeLabel)
        //добавляем заголовок Тема
        view.addSubview(markTheme)
        //добавляем текущую тему
        view.addSubview(themeLabel)
        //добавляем заголовок Текст
        view.addSubview(markText)
        //добавляем текущий Текст
        view.addSubview(textLabel)
        //добавляфем кнопки
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
        //располагаем заголовок дата
        let markDateFrame = CGRect(
            x: horizontalGap,
            y: yOffset,
            width: 50,
            height: labelHeight
        )
        //располагаем дату сообщения
        let dateFrame = CGRect(
            x: horizontalGap + 100,
            y: yOffset,
            width: 170,
            height: labelHeight
        )
        
        yOffset += labelHeight
        yOffset += verticalGap
        
        //располагаем заголовок Тема
        let markThemeFrame = CGRect(
            x: horizontalGap,
            y: yOffset,
            width: 50,
            height: labelHeight
        )
        
        //располагаем текущую тему
        let themeFrame = CGRect(
            x: horizontalGap + 100,
            y: yOffset,
            width: 170,
            height: labelHeight
        )
        
        yOffset += labelHeight
        yOffset += verticalGap
        
        //располагаем заголовок текст
        let markTextFrame = CGRect(
            x: horizontalGap,
            y: yOffset,
            width: 50,
            height: labelHeight
        )
        
        yOffset += labelHeight
        yOffset += verticalGap
        
        //располагаем текущий текст
        let textFrame = CGRect(
            x: horizontalGap,
            y: yOffset,
            width: view.bounds.width - horizontalGap * 2,
            height: view.bounds.height - yOffset - buttonSize - verticalGap
        )
        
        //задание фрейма для кнопки isCompleted
        let iscompletedButtonFrame = CGRect(
            //x: buttonSize * 2,
            x: (view.bounds.width / 2) - buttonSize * 2,
            //y: yOffset,
            y: view.bounds.height - buttonSize,
            width: buttonSize,
            height: buttonSize
         )
        
        //задание фрейма для кнопки isNotCompleted
        let isNotcompletedButtonFrame = CGRect(
            //x: horizontalGap,
            x: (view.bounds.width / 2) + buttonSize,
            //y: yOffset,
            y: view.bounds.height - buttonSize,
            width: buttonSize,
            height: buttonSize
        )
        
        markDateTimeLabel.frame = markDateFrame
        dateTimeLabel.frame = dateFrame
        
        markTheme.frame = markThemeFrame
        themeLabel.frame = themeFrame
        
        markText.frame = markTextFrame
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
