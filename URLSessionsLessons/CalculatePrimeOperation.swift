//
//  CalculatePrimeOperation.swift
//  URLSessionsLessons
//
//  Created by Shadrach Mensah on 13/02/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation


class CalculatePrimeOperation:Operation{
    
    override func main() {
        
        for num in  0...100_000_000{
            let isPrimenum = isPrime(number: num)
            print("\(num) is prime: \(isPrimenum)")
        }
        
    }
    
    func isPrime(number:Int)->Bool{
        if number <= 1{
            return false
        }
        
        if number <= 3 {
            return true
        }
        
        var i = 2
        while i * 1 <= number {
            if number % i == 0 {
                return false
            }
            
            i = i + 2
        }
        return true
    }
    
}
