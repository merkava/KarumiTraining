//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Marcos on 11/12/19.
//  Copyright © 2019 Mobgen. All rights reserved.
//

import UIKit

enum ErrorsToThrow: Error {
case negativeNumber
}

class StringCalculator: NSObject {
    func add(number: String) throws -> Int {
        if number.count == 0 {
            return 0
        }
        
        let numbers = number.split(separator: ",")
        if numbers.count == 0 {
            return 0
        } else if numbers.count == 1 {
            let current = Int(numbers[0].trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
            if current < 0 {
                throw ErrorsToThrow.negativeNumber
            }
            return Int(numbers[0]) ?? 0
        } else if numbers.count > 1 {
            var total = 0
            for num in numbers {
                let current = Int(num.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
                if current < 0 {
                    throw ErrorsToThrow.negativeNumber
                } else {
                    total += Int(num.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
                }
            }
            return total
        } else {
            return 0
        }
        
        
    }
}
