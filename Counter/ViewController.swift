//
//  ViewController.swift
//  Counter
//
//  Created by Сергей on 01.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Int = 0
    var currentTime = Date()
    private let dateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ru_RU")
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter
        }()

//    кнопки
    @IBOutlet weak var again: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    
//    лейбл
    @IBOutlet weak var counterLable: UILabel!
    
//    текстовый слой
    @IBOutlet weak var historyVIew: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        again.layer.cornerRadius = 10
        plus.layer.cornerRadius = 10
        minus.layer.cornerRadius = 10
        counterLable.text = "Значение счётчика: 0"
        historyVIew.text = "История изменений:"
        historyVIew.isEditable = false
        // Do any additional setup after loading the view.
    }

    
    @IBAction func plusButton(_ sender: Any) {
        count += 1
        counterLable.text = "Значение счётчика: \(count)"
        historyVIew.text += "\n\(dateFormat.string(from: currentTime)):\nзначение изменено на +1"
        
    }
    
    @IBAction func minusButton(_ sender: Any) {
        if count == 0 {
            count = 0
            historyVIew.text += "\n\(dateFormat.string(from: currentTime)):\nпопытка уменьшить значение счётчика ниже 0"
        }else{
            count -= 1
            counterLable.text = "Значение счётчика: \(count)"
            historyVIew.text += "\n\(dateFormat.string(from: currentTime)):\nзначение изменено на -1"
        }
    }
    
    @IBAction func againButton(_ sender: Any) {
        count = 0
        counterLable.text = "Значение счётчика: \(count)"
        historyVIew.text += "\n\(dateFormat.string(from: currentTime)):\nзначение сброшено"
    }
}

