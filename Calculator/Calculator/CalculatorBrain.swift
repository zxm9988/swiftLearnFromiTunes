//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by new on 15/2/3.
//  Copyright (c) 2015年 com.BeeBubble. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    enum Op{
        case Operand(Double)
        case UnaryOperation(String,Double -> Double)
        case BinaryOperation(String,(Double,Double) -> Double)
    }
    
    var opStack = [Op]()
    
    var knownOps = [String:Op]()

    init() {
        knownOps["×"] = Op.BinaryOperation("×", *)
        knownOps["÷"] = Op.BinaryOperation("÷"){ $1 / $0 }
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["−"] = Op.BinaryOperation("−"){ $1 - $0 }
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    

    
    func pushOperand(operand:Double){
        opStack.append(Op.Operand(operand))
    }
    
    func performOperation(symbol:String){
        
    
    }
    
}