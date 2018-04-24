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
    private var todoItem: TodoItem
    private let todoDataProvider: TodoDataProvider
    
    
    // MARK: Subviews
    
    private var markDateTimeLabel: UILabel
    private var markTheme: UILabel
    private var statusTitleLabel: UILabel
    
    private var dateTimeLabel: UILabel
    private var themeLabel: UILabel
    private var textLabel: UILabel
    
    
    
    //задание переменных под кнопки
    private var isCompletedButton: UIButton
    private var isNotCompletedButton: UIButton
    //задание переменных под картинки для кнопок
    private var isCompletedButtonImage: UIImage!
    private var isNotCompletedButtonImage: UIImage!
    
    //задание переменной под графическое отображение статуса
    private var statusImageView: UIImageView
    
    private let buttonSize: CGFloat = 50.0

    
    // MARK: Init
    init(todoItem: TodoItem,
         todoDataProvider: TodoDataProvider)
    {
        self.todoItem = todoItem
        self.todoDataProvider = todoDataProvider
        
        markDateTimeLabel = UILabel(frame: .zero)
        markTheme = UILabel(frame: .zero)
        statusTitleLabel = UILabel(frame: .zero)
        
        dateTimeLabel = UILabel(frame: .zero)
        themeLabel = UILabel(frame: .zero)
        textLabel = UILabel(frame: .zero)
        statusImageView = UIImageView(frame: .zero)
        
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
        markDateTimeLabel.text = "Дата:"
        markDateTimeLabel.textAlignment = NSTextAlignment.center
        markDateTimeLabel.layer.borderColor = UIColor.black.cgColor
        markDateTimeLabel.layer.borderWidth = 1.0
        markDateTimeLabel.layer.cornerRadius = 10
        
        dateTimeLabel.text = dateToString(todoItem.dateTime)
        dateTimeLabel.textAlignment = NSTextAlignment.center
        dateTimeLabel.layer.borderColor = UIColor.black.cgColor
        dateTimeLabel.layer.borderWidth = 1.0
        dateTimeLabel.layer.cornerRadius = 10
        
        markTheme.text = "Тема:"
        markTheme.textAlignment = NSTextAlignment.center
        markTheme.layer.borderColor = UIColor.black.cgColor
        markTheme.layer.borderWidth = 1.0
        markTheme.layer.cornerRadius = 10
        
        themeLabel.text = todoItem.theme
        themeLabel.textAlignment = NSTextAlignment.center
        themeLabel.layer.borderColor = UIColor.black.cgColor
        themeLabel.layer.borderWidth = 1.0
        themeLabel.layer.cornerRadius = 10
        
        statusTitleLabel.text = "Статус:"
        statusTitleLabel.textAlignment = NSTextAlignment.center
        statusTitleLabel.layer.borderColor = UIColor.black.cgColor
        statusTitleLabel.layer.borderWidth = 1.0
        statusTitleLabel.layer.cornerRadius = 10
        
        statusImageView.contentMode = .center
        
        textLabel.text = todoItem.text
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.layer.borderColor = UIColor.black.cgColor
        textLabel.layer.borderWidth = 1.0
        textLabel.layer.cornerRadius = 10
        
        isCompletedButtonImage = UIImage(named: "isCompletedImage")!.withRenderingMode(.alwaysOriginal)
        isCompletedButton.setImage(isCompletedButtonImage, for: .normal)
        isCompletedButton.contentMode = .scaleAspectFit

        isCompletedButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        isCompletedButton.layer.shadowOpacity = 0.1
        isCompletedButton.layer.shadowRadius = 1
        isCompletedButton.addTarget(self, action: #selector(completedTapped(sender:)), for: .touchUpInside)
        
        isNotCompletedButtonImage = UIImage(named: "isNotCompletedImage")!.withRenderingMode(.alwaysOriginal)
        isNotCompletedButton.setImage(isNotCompletedButtonImage, for: .normal)
        isCompletedButton.contentMode = .scaleAspectFit

        isNotCompletedButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        isNotCompletedButton.layer.shadowOpacity = 0.1
        isNotCompletedButton.layer.shadowRadius = 1
        isNotCompletedButton.addTarget(self, action: #selector(notCompletedTapped(sender:)), for: .touchUpInside)
        
        // Добавление subviews в иерархию
        view.addSubview(markDateTimeLabel)
        view.addSubview(dateTimeLabel)
        view.addSubview(markTheme)
        view.addSubview(themeLabel)
        view.addSubview(statusTitleLabel)
        view.addSubview(textLabel)
        view.addSubview(statusImageView)
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

        let markDateFrame = CGRect(
            x: horizontalGap,
            y: yOffset,
            width: 50,
            height: labelHeight
        )

        let dateFrame = CGRect(
            x: horizontalGap + 100,
            y: yOffset,
            width: 170,
            height: labelHeight
        )
        
        yOffset += labelHeight
        yOffset += verticalGap
        
        let markThemeFrame = CGRect(
            x: horizontalGap,
            y: yOffset,
            width: 50,
            height: labelHeight
        )
        
        let themeFrame = CGRect(
            x: horizontalGap + 100,
            y: yOffset,
            width: 170,
            height: labelHeight
        )
        
        yOffset += labelHeight
        yOffset += verticalGap
        
        let markTextFrame = CGRect(
            x: horizontalGap,
            y: yOffset,
            width: 50,
            height: labelHeight
        )

        let statusFrame = CGRect(
            x: (view.bounds.width / 2) - horizontalGap*2,
            y: yOffset,
            width: 50,
            height: labelHeight
        )
        
        yOffset += labelHeight
        yOffset += verticalGap
        
        let preferredTextSize = CGSize(
            width: view.bounds.width - horizontalGap * 2,
            height: CGFloat.nan
        )
        let actualTextSize = textLabel.sizeThatFits(preferredTextSize)
        let textFrame = CGRect(
            x: horizontalGap,
            y: yOffset,
            width: view.bounds.width - horizontalGap * 2,
            height: actualTextSize.height
        )
        
        let iscompletedButtonFrame = CGRect(
            x: (view.bounds.width / 2) - buttonSize * 2,
            y: view.bounds.height - buttonSize,
            width: buttonSize,
            height: buttonSize
         )
        
        let isNotcompletedButtonFrame = CGRect(
            x: (view.bounds.width / 2) + buttonSize,
            y: view.bounds.height - buttonSize,
            width: buttonSize,
            height: buttonSize
        )
        
        markDateTimeLabel.frame = markDateFrame
        dateTimeLabel.frame = dateFrame
        
        markTheme.frame = markThemeFrame
        themeLabel.frame = themeFrame
        
        statusTitleLabel.frame = markTextFrame
        statusImageView.frame = statusFrame
        textLabel.frame = textFrame
        
        isCompletedButton.frame = iscompletedButtonFrame
        isNotCompletedButton.frame = isNotcompletedButtonFrame
    }
    
    // MARK: Control's actions
    @objc
    private func completedTapped(sender: UIButton) {
        print("completed")
        todoItem.isCompleted = true
        statusImageView.image = UIImage(named: "completed")
    }
    
    @objc
    private func notCompletedTapped(sender: UIButton) {
        print("not completed")
        todoItem.isCompleted = false
        statusImageView.image = UIImage(named: "notcompleted")
    }
    
    // MARK: Formatting
    private let DateFormat = "yyyy-MM-dd HH:mm:ss"
    func dateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat
        let dateString = formatter.string(from: date)
        return dateString
    }
}
