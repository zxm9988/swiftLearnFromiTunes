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
   
}

