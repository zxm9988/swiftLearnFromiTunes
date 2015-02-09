//
//  CalulatorBrain.swift
//  Calculator
//
//  Created by XiaoBangqiang on 15/2/9.
//  Copyright (c) 2015年 com.BeeBubble. All rights reserved.
//

import Foundation

class CalulatorBrain
{
   private enum Op{
        case Operand(Double)
        case UniaryOperation(String,Double -> Double)
        case BinaryOperation(String,(Double,Double) -> Double)

    }
    
    private var opStatck = [Op]() //Array
    private var knownOps = [String:Op]() //Dictoary
    
    init(){
        knownOps["×"] = Op.BinaryOperation("×",*)
        knownOps["+"] = Op.BinaryOperation("+",+)
        knownOps["-"] = Op.BinaryOperation("-") { $1 - $0 }
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
        knownOps["√"] = Op.UniaryOperation("√",sqrt)
    
    }
    
    func pushOprand(oprand:Double){
        opStatck.append(Op.Operand(oprand))
    
    }
    
    func evalutate(ops : [Op]) -> (result: Double?,remainingOps: [Op]){
        if !ops.isEmpty{
            var remainingOps = ops
            let op = remainingOps.removeLast()
            switch op{
            case  .Operand(let operand):
                return(operand,remainingOps)
            // _ 忽略
            case  .UniaryOperation(_, let opertioan):
                let opeationEvalutaion = evalutate(remainingOps)
                let 
                return (opertioan(op))
                
            
            }
        
        
        }
    
        return (nil,ops)
    }
    
    func evalutate() -> Double? {
    
    
    }
    
    
    func performOperation(symbol:String){
       if let operation = knownOps[symbol]{
            opStatck.append(operation)
            
        }
        
    }
    
    
}

