import Foundation

class Calculate {
    var optr: [Character] = []
    var opnd: [NSDecimalNumber] = []

    var operatorRelationship: [Character: Int] = ["+": 3,
                                                  "-": 3,
                                                  "×": 5,
                                                  "÷": 5,
                                                  "=": 0]
    var error = false

    func getOperatorRelationship(optr: Character, order: Int) -> Int {
        if optr == "=" {
            return 0
        }
        if order == 1 {
            return operatorRelationship[optr]!
        } else {
            return operatorRelationship[optr]! - 1
        }
    }

    func judgeOperatorRelationship(optr1: Character, optr2: Character) -> Int {
        if(getOperatorRelationship(optr: optr1,order: 1) ==
            getOperatorRelationship(optr: optr2,order: 2)){
            return 0
        }
        else if(getOperatorRelationship(optr: optr1,order: 1) >
            getOperatorRelationship(optr: optr2,order: 2)) {
            
            return 1
        }
        else {
            return 2
        }
    }

    func calculateArithmetic() {
        let num2 = opnd.removeLast()
        let num1 = opnd.removeLast()
        let optr1 = optr.removeLast()
        var temp: NSDecimalNumber?
        if optr1 == "+" {
            temp = num1.adding(num2)
        } else if optr1 == "-" {
            temp = num1.subtracting(num2)
        } else if optr1 == "×" {
            temp = num1.multiplying(by: num2)
        } else {
            if num2 == 0 {
                temp = num1
                error = true
            } else {
                temp = num1.dividing(by: num2)
            }
        }
        opnd.append(temp!)
    }

    func getResult(arithmetic: String) -> String {
        var isNegativeNum = false
        if arithmetic == "=" {
            return "0"
        }
        optr = ["="]
        opnd = []
        error = false
        var countDecimalPlaces: Double = 1
        var passDecimalPoint = false
        var temp: NSDecimalNumber = 0
        var result: NSDecimalNumber = 0
        var i: Int = 0
        if arithmetic.first == "-" {
            isNegativeNum = true
            opnd.append(0)
        }
        while i < arithmetic.count {
            let char = arithmetic[arithmetic.index(arithmetic.startIndex,offsetBy: i)]
            if char.isNumber || char == "." {
                repeat {
                    if passDecimalPoint {
                        countDecimalPlaces *= 10
                    }
                    if arithmetic[arithmetic.index(arithmetic.startIndex,offsetBy: i)] == "." {
                        passDecimalPoint = true
                        i += 1
                        continue
                    }
                    temp = temp.multiplying(by: 10)
                    temp = temp.adding(NSDecimalNumber(value: arithmetic[arithmetic.index(arithmetic.startIndex,offsetBy: i)].wholeNumberValue!))
                    i += 1
                }
                while arithmetic[arithmetic.index(arithmetic.startIndex,offsetBy: i)].isNumber ||
                    arithmetic[arithmetic.index(arithmetic.startIndex,offsetBy: i)] == "."
                temp = temp.dividing(by: NSDecimalNumber(value: countDecimalPlaces))
                countDecimalPlaces = 1
                passDecimalPoint = false
                opnd.append(temp)
                temp = 0
                i -= 1
            }
            else{
                if judgeOperatorRelationship(optr1: optr.last!, optr2: char) == 0
                        && char == "=" {
                    result = opnd.last!
                }
                else if judgeOperatorRelationship(optr1: optr.last!, optr2: char) == 2 {
                    optr.append(char)
                }
                else if judgeOperatorRelationship(optr1: optr.last!, optr2: char) == 1 {
                    calculateArithmetic()
                    if error == true {
                        return "不能除以0"
                    }
                    i -= 1
                }
                else if judgeOperatorRelationship(optr1: optr.last!, optr2: char) == 0 {
                    optr.removeLast()
                }
            }
            i += 1
        }
        if isNegativeNum {
            result.multiplying(by: -1)
        }
        return result.stringValue
    }
}
