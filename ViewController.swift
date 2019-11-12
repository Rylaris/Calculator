//
//  ViewController.swift
//  Calculator
//
//  Created by 温蟾圆 on 2019/11/10.
//  Copyright © 2019 温蟾圆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arithmetic : String = "0" {
        didSet {
            arithmeticLabel.text = arithmetic
        }
    }
    var curentResult : String = "0" {
        didSet {
            resultLabel.text = curentResult
        }
    }
    var tapic = UIImpactFeedbackGenerator.init(style: UIImpactFeedbackGenerator.FeedbackStyle.heavy)
    let fontName = "Cascadia Code"
    var curentNum : Double = 0
    var resultLabel = UILabel()
    var arithmeticLabel = UILabel()
    let equalButton = UIButton(type: .system)
    let plusButton = UIButton(type: .system)
    let minusButton = UIButton(type: .system)
    let multiplyButton = UIButton(type: .system)
    let divideButton = UIButton(type: .system)
    let pointButton = UIButton(type: .system)
    let threeButton = UIButton(type: .system)
    let sixButton = UIButton(type: .system)
    let nineButton = UIButton(type: .system)
    let percentSignButton = UIButton(type: .system)
    let zeroButton = UIButton(type: .system)
    let cleanButton = UIButton(type: .system)
    let sevenButton = UIButton(type: .system)
    let fourButton = UIButton(type: .system)
    let twoButton = UIButton(type: .system)
    let fiveButton = UIButton(type: .system)
    let oneButton = UIButton(type: .system)
    let switchButton = UIButton(type: .system)
    let deleteButton = UIButton(type: .system)
    let eightButton = UIButton(type: .system)
    
    let backgroundColor = UIColor { (trainCollection) -> UIColor in
        if trainCollection.userInterfaceStyle == .dark {
            return UIColor.lightGray
        } else {
            return UIColor.lightGray
        }
    }

    let labelColor = UIColor { (trainCollection) -> UIColor in
        if trainCollection.userInterfaceStyle == .dark {
            return UIColor.white
        } else {
            return UIColor.black
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = UIScreen.main.bounds
        let size = rect.size
        let width = size.width
        let height = size.height - 34
        let buttonWidth = width / 4
        let buttonHeight = buttonWidth
        
        arithmeticLabel.frame = CGRect(x: 0, y: height - 7 * buttonHeight, width: width - 25, height: buttonHeight)
        arithmeticLabel.text = arithmetic
        arithmeticLabel.textAlignment = NSTextAlignment.right
        arithmeticLabel.font = UIFont(name: self.fontName, size: 30)
        self.view.addSubview(arithmeticLabel)
        
        resultLabel.frame = CGRect(x: 0, y: height - 6 * buttonHeight, width: width - 25, height: buttonHeight)
        resultLabel.text = curentResult
        resultLabel.textAlignment = NSTextAlignment.right
        resultLabel.font = UIFont(name: self.fontName, size: 25)
        resultLabel.textColor = backgroundColor
        self.view.addSubview(resultLabel)
        
        
        equalButton.frame = CGRect(x: buttonWidth * 3, y: height - buttonHeight, width: buttonWidth, height: buttonHeight)
        equalButton.setTitle("=", for: .normal)
        equalButton.setTitleColor(labelColor, for: .normal)
        equalButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        equalButton.addTarget(self, action: #selector(self.equal(button:)), for: .touchUpInside)
        self.view.addSubview(equalButton)
        
        plusButton.frame = CGRect(x: buttonWidth * 3, y: height - 2 * buttonHeight, width: buttonWidth, height: buttonHeight)
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(labelColor, for: .normal)
        plusButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        plusButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(plusButton)
        
        minusButton.frame = CGRect(x: buttonWidth * 3, y: height - 3 * buttonHeight, width: buttonWidth, height: buttonHeight)
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(labelColor, for: .normal)
        minusButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        minusButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(minusButton)
        
        multiplyButton.frame = CGRect(x: buttonWidth * 3, y: height - 4 * buttonHeight, width: buttonWidth, height: buttonHeight)
        multiplyButton.setTitle("×", for: .normal)
        multiplyButton.setTitleColor(labelColor, for: .normal)
        multiplyButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        multiplyButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(multiplyButton)
        
        divideButton.frame = CGRect(x: buttonWidth * 3, y: height - 5 * buttonHeight, width: buttonWidth, height: buttonHeight)
        divideButton.setTitle("÷", for: .normal)
        divideButton.setTitleColor(labelColor, for: .normal)
        divideButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        divideButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(divideButton)
        
        pointButton.frame = CGRect(x: buttonWidth * 2, y: height - buttonHeight, width: buttonWidth, height: buttonHeight)
        pointButton.setTitle(".", for: .normal)
        pointButton.setTitleColor(labelColor, for: .normal)
        pointButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        pointButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(pointButton)
        
        threeButton.frame = CGRect(x: buttonWidth * 2, y: height - 2 * buttonHeight, width: buttonWidth, height: buttonHeight)
        threeButton.setTitle("3", for: .normal)
        threeButton.setTitleColor(labelColor, for: .normal)
        threeButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        threeButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(threeButton)
        
        sixButton.frame = CGRect(x: buttonWidth * 2, y: height - 3 * buttonHeight, width: buttonWidth, height: buttonHeight)
        sixButton.setTitle("6", for: .normal)
        sixButton.setTitleColor(labelColor, for: .normal)
        sixButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        sixButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(sixButton)
        
        nineButton.frame = CGRect(x: buttonWidth * 2, y: height - 4 * buttonHeight, width: buttonWidth, height: buttonHeight)
        nineButton.setTitle("9", for: .normal)
        nineButton.setTitleColor(labelColor, for: .normal)
        nineButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        nineButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(nineButton)
        
        percentSignButton.frame = CGRect(x: buttonWidth * 2, y: height - 5 * buttonHeight, width: buttonWidth, height: buttonHeight)
        percentSignButton.setTitle("%", for: .normal)
        percentSignButton.setTitleColor(labelColor, for: .normal)
        percentSignButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        self.view.addSubview(percentSignButton)
        
        zeroButton.frame = CGRect(x: buttonWidth * 1, y: height - buttonHeight, width: buttonWidth, height: buttonHeight)
        zeroButton.setTitle("0", for: .normal)
        zeroButton.setTitleColor(labelColor, for: .normal)
        zeroButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        zeroButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(zeroButton)
        
        twoButton.frame = CGRect(x: buttonWidth * 1, y: height - 2 * buttonHeight, width: buttonWidth, height: buttonHeight)
        twoButton.setTitle("2", for: .normal)
        twoButton.setTitleColor(labelColor, for: .normal)
        twoButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        twoButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(twoButton)
        
        fiveButton.frame = CGRect(x: buttonWidth * 1, y: height - 3 * buttonHeight, width: buttonWidth, height: buttonHeight)
        fiveButton.setTitle("5", for: .normal)
        fiveButton.setTitleColor(labelColor, for: .normal)
        fiveButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        fiveButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(fiveButton)
        
        eightButton.frame = CGRect(x: buttonWidth * 1, y: height - 4 * buttonHeight, width: buttonWidth, height: buttonHeight)
        eightButton.setTitle("8", for: .normal)
        eightButton.setTitleColor(labelColor, for: .normal)
        eightButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        eightButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(eightButton)
        
        deleteButton.frame = CGRect(x: buttonWidth * 1, y: height - 5 * buttonHeight, width: buttonWidth, height: buttonHeight)
        deleteButton.setTitle("←", for: .normal)
        deleteButton.setTitleColor(labelColor, for: .normal)
        deleteButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        deleteButton.addTarget(self, action: #selector(self.delete(button:)), for: .touchUpInside)
        self.view.addSubview(deleteButton)
        
        switchButton.frame = CGRect(x: 0, y: height - buttonHeight, width: buttonWidth, height: buttonHeight)
        switchButton.setTitle("±", for: .normal)
        switchButton.setTitleColor(labelColor, for: .normal)
        switchButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        switchButton.addTarget(self, action: #selector(self.reverseResult(button:)), for: .touchUpInside)
        self.view.addSubview(switchButton)
        
        oneButton.frame = CGRect(x: 0, y: height - 2 * buttonHeight, width: buttonWidth, height: buttonHeight)
        oneButton.setTitle("1", for: .normal)
        oneButton.setTitleColor(labelColor, for: .normal)
        oneButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        oneButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(oneButton)
        
        fourButton.frame = CGRect(x: 0, y: height - 3 * buttonHeight, width: buttonWidth, height: buttonHeight)
        fourButton.setTitle("4", for: .normal)
        fourButton.setTitleColor(labelColor, for: .normal)
        fourButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        fourButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(fourButton)
        
        sevenButton.frame = CGRect(x: 0, y: height - 4 * buttonHeight, width: buttonWidth, height: buttonHeight)
        sevenButton.setTitle("7", for: .normal)
        sevenButton.setTitleColor(labelColor, for: .normal)
        sevenButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        sevenButton.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
        self.view.addSubview(sevenButton)
        
        cleanButton.frame = CGRect(x: 0, y: height - 5 * buttonHeight, width: buttonWidth, height: buttonHeight)
        cleanButton.setTitle("C", for: .normal)
        cleanButton.setTitleColor(labelColor, for: .normal)
        cleanButton.titleLabel?.font = UIFont(name: self.fontName, size: 30)
        cleanButton.addTarget(self, action: #selector(self.cleanArithmetic(button:)), for: .touchUpInside)
        self.view.addSubview(cleanButton)
    }
    
    @objc func buttonTapped(button : UIButton) {
        tapic.prepare()
        tapic.impactOccurred()
        resultLabel.font = UIFont(name: self.fontName, size: 25)
        resultLabel.textColor = backgroundColor
        arithmeticLabel.font = UIFont(name: self.fontName, size: 30)
        arithmeticLabel.textColor = labelColor
        if button.titleLabel?.text == "." && arithmetic == "" {
            arithmetic += "0"
        }
        if (button.titleLabel?.text == "+" || button.titleLabel?.text == "-" || button.titleLabel?.text == "×" || button.titleLabel?.text == "÷") && (arithmetic.last == "+" || arithmetic.last == "-" ||
            arithmetic.last == "×" || arithmetic.last == "÷") {
            arithmetic.removeLast()
        }
        if button.titleLabel?.text == "." && pointButton.isEnabled == true {
            pointButton.isEnabled = false
        }
        if (button.titleLabel?.text == "+" || button.titleLabel?.text == "-" || button.titleLabel?.text == "×" || button.titleLabel?.text == "÷") &&
            pointButton.isEnabled == false {
            pointButton.isEnabled = true
        }
        if arithmetic == "0" {
            if button.titleLabel?.text == "+" || button.titleLabel?.text == "-" || button.titleLabel?.text == "×" || button.titleLabel?.text == "÷" ||
                button.titleLabel?.text == "." {
                arithmetic += button.titleLabel?.text! ?? ""
            } else {
                arithmetic = ""
                arithmetic += button.titleLabel?.text! ?? ""
            }
        } else {
            arithmetic += button.titleLabel?.text! ?? ""
        }
        if button.titleLabel?.text != "+" && button.titleLabel?.text != "-" && button.titleLabel?.text != "×" && button.titleLabel?.text != "÷" && button.titleLabel?.text != "."{
            let calculate = Calculate()
            curentResult = calculate.getResult(arithmetic: arithmetic + "=")
        }
        print(arithmetic)
    }
    
    @objc func cleanArithmetic(button : UIButton) {
        tapic.prepare()
        tapic.impactOccurred()
        resultLabel.font = UIFont(name: self.fontName, size: 25)
        resultLabel.textColor = backgroundColor
        arithmeticLabel.font = UIFont(name: self.fontName, size: 30)
        arithmeticLabel.textColor = labelColor
        arithmetic = "0"
        if pointButton.isEnabled == false {
            pointButton.isEnabled = true
        }
        resultLabel.text = "0"
        print(arithmetic)
    }
    
    @objc func delete(button : UIButton) {
        tapic.prepare()
        tapic.impactOccurred()
        let calculate = Calculate()
        if !arithmetic.isEmpty {
            if arithmetic.removeLast().isNumber {
                if arithmetic.last == "+" || arithmetic.last == "-" ||
                    arithmetic.last == "×" || arithmetic.last == "÷" {
                    var temp = arithmetic
                    temp.removeLast()
                    curentResult = calculate.getResult(arithmetic: temp + "=")
                } else {
                    curentResult = calculate.getResult(arithmetic: arithmetic + "=")
                }
            }
            print(arithmetic)
        }
    }
    
    @objc func equal(button: UIButton) {
        tapic.prepare()
        tapic.impactOccurred()
        resultLabel.font = UIFont(name: self.fontName, size: 30)
        resultLabel.textColor = labelColor
        arithmeticLabel.font = UIFont(name: self.fontName, size: 25)
        arithmeticLabel.textColor = backgroundColor
        arithmetic = curentResult
    }
    
    @objc func reverseResult(button: UIButton) {
        tapic.prepare()
        tapic.impactOccurred()
        if curentResult.first == "-" {
            curentResult.removeFirst()
        } else {
            curentResult = "-" + curentResult
        }
    }
}

