//
//  ViewController.swift
//  Calculator
//
//  Created by Bangqiang.Xiao on 15/1/28.
//  Copyright (c) 2015年 com.BeeBubble. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber:Bool = false
    
    @IBAction func appendDigut(sender: UIButton) {
        //let between var means const never changed
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
        println("digit = \(digit)")
        
    }
   
    
    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber{
            enter()
        }
        switch operation{
//        case "×":preformOperation(multiply)
//        case "×":preformOperation({ (op1:Double,op2:Double) ->Double in
//            return op1 * op2 })
//        case "×":preformOperation({ (op1,op2) in return op1 * op2 })
//            case "×":preformOperation({ $0 * $1 })
        case "×":preformOperation { $0 * $1 }
        case "÷":preformOperation { $1 / $0 }
        case "+":preformOperation { $0 + $1 }
        case "−":preformOperation { $1 - $0 }
        case "√":preformOperation {sqrt($0)}
        default: break
        }
    }

    func preformOperation(operation:(Double,Double) -> Double){
    
        if operandStack.count >= 2{
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()

        }
    }
    
    
    func preformOperation(operation:(Double) -> Double){
        
        if operandStack.count >= 1{
            displayValue = operation(operandStack.removeLast())
            enter()
            
        }
    }
    
    
    func multiply(op1:Double,op2:Double) ->Double {
        return op1 * op2
    }
        
    var operandStack = Array<Double>()
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
        
    var displayValue: Double {
        get{
        
        return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    
    }
}

