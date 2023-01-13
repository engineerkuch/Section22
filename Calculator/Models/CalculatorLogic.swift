//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Kelvin KUCH on 12.01.2023.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
                
            case "AC":
                return 0
                
            case "%":
                return n * 0.01
                
            case "=":
                return perfromTwoNumCalculation(n2: n)
                
            default:
                intermediateCalculation = (n1: n, operation: symbol)
            }
        }
        
        return nil
    }
    
    
    private func perfromTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.operation {
            
            switch operation {
            case "+":
                return n1 + n2
                
            case "-":
                return n1 - n2
                
            case "*", "×":
                return n1 * n2
                
            case "/", "÷":
                return n1 / n2

            default:
                fatalError("[!] Error: unknown operation.")
                
            }
        }
        
        return nil
    }
}
