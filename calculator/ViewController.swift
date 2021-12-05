//
//  ViewController.swift
//  calculator
//
//  Created by admin on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showedNumber: UILabel!
    @IBOutlet weak var decimalButton: UIButton!
    
    var firstNumber = 0.0
    var didEqual = false
    var inDecimal = false
    var afterOperator = false
    var didOperator = false
    var secondNumberEntered = false
    var currentOperator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedButton(_ sender: UIButton) {
        switch sender.tag{
        case 0:
            addNumber(number: 0)
            break
        case 1:
            addNumber(number: 1)
            break
        case 2:
            addNumber(number: 2)
            break
        case 3:
            addNumber(number: 3)
            break
        case 4:
            addNumber(number: 4)
            break
        case 5:
            addNumber(number: 5)
            break
        case 6:
            addNumber(number: 6)
            break
        case 7:
            addNumber(number: 7)
            break
        case 8:
            addNumber(number: 8)
            break
        case 9:
            addNumber(number: 9)
            break
        case 10:
            showedNumber.text = "\(showedNumber.text ?? "")."
            sender.isEnabled = false
            sender.backgroundColor = .lightGray
            inDecimal = true
            break
        case 11:
            if didEqual && didOperator{
                findResult(operators: currentOperator)
                secondNumberEntered = false
                didEqual = true
            }
            else if didEqual{
                break
            }
            else if didOperator{
                findResult(operators: currentOperator)
                secondNumberEntered = false
                didEqual = true
            }
            break
        case 12:
            calculate(operators: "+")
            break
        case 13:
            calculate(operators: "-")
            break
        case 14:
            calculate(operators: "*")
            break
        case 15:
            calculate(operators: "/")
            break
        case 16:
            calculate(operators: "%")
            break
        case 17:
            showedNumber.text = "\((Double(showedNumber.text ?? "") ?? -1) * -1)"
            if firstNumber != 0.0{
                firstNumber *= -1
            }
            break
        case 18:
            showedNumber.text = "0"
            firstNumber = 0.0
            decimalButton.isEnabled = true
            didOperator = false
            didEqual = false
            break
        default:
            showedNumber.text = "Error"
        }
    }
    
    func addNumber(number: Int){
        inDecimal = false
        if  afterOperator{
            showedNumber.text = String(number)
            afterOperator = false
            secondNumberEntered = true
        }
        else if showedNumber.text == "0" || showedNumber.text == "Error"{
            showedNumber.text = String(number)
            afterOperator = false
        }
        else{
            showedNumber.text = "\(showedNumber.text ?? "")\(number)"
        }
    }
    
    func calculate(operators: String){
        if !inDecimal{
            if showedNumber.text == "Error"{
                return
            }
            else if !didOperator && firstNumber == 0.0{
                didOperator = true
                currentOperator = operators
                firstNumber = Double(showedNumber.text ?? "") ?? -1
            }
            else if !didOperator{
                findResult(operators: currentOperator)
                currentOperator = operators
            }
            else if didOperator && secondNumberEntered{
                findResult(operators: currentOperator)
                currentOperator = operators
            }
            afterOperator = true
        }
    }
    
    func findResult(operators: String){
        let secondNumebr = Double(showedNumber.text ?? "") ?? -1
        switch operators{
        case "+":
            showedNumber.text = String(firstNumber + secondNumebr)
        case "-":
            showedNumber.text = String(firstNumber - secondNumebr)
        case "*":
            showedNumber.text = String(firstNumber * secondNumebr)
        case "/":
            if secondNumebr == 0.0{
                showedNumber.text = "Error"
                break
            }
            showedNumber.text = String(firstNumber / secondNumebr)
        case "%":
            break
        default:
            showedNumber.text = "Error"
        }
        firstNumber = Double(showedNumber.text ?? "") ?? -1
        didEqual = false
    }
}

