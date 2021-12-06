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
    var secondNumber = 0.0
    var inDecimal = false
    var afterOperator = false
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
            findResult(operators: "=")
            break
        case 12:
            findResult(operators: "+")
            break
        case 13:
            findResult(operators: "-")
            break
        case 14:
            findResult(operators: "*")
            break
        case 15:
            findResult(operators: "/")
            break
        case 16:
            showedNumber.text = "\((Double(showedNumber.text ?? "") ?? -1) / 100)"
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
            afterOperator = false
            secondNumberEntered = false
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
        }
        else{
            showedNumber.text = "\(showedNumber.text ?? "")\(number)"
        }
    }
    
    func findResult(operators: String){
        if secondNumberEntered && !inDecimal{
            secondNumber = Double(showedNumber.text ?? "") ?? -1
            switch operators{
            case "=":
                findResult(operators: currentOperator)
                firstNumber = 0.0
                return
            case "+":
                showedNumber.text = String(firstNumber + secondNumber)
            case "-":
                if firstNumber == 0.0{
                    secondNumber *= -1
                }
                showedNumber.text = String(firstNumber - secondNumber)
            case "*":
                if firstNumber == 0.0{
                    firstNumber = 1
                }
                showedNumber.text = String(firstNumber * secondNumber)
            case "/":
                if firstNumber == 0.0{
                    firstNumber = secondNumber
                    secondNumber = 1
                }
                if secondNumber == 0.0{
                    showedNumber.text = "Error"
                    return
                }
                showedNumber.text = String(firstNumber / secondNumber)
            default:
                showedNumber.text = "Error"
            }
            currentOperator = operators
            secondNumberEntered = false
            afterOperator = true
        }
        else if !inDecimal && operators != "="{
            currentOperator = operators
            afterOperator = true
        }
        firstNumber = Double(showedNumber.text ?? "") ?? -1
    }
}
