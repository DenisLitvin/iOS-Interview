//: Playground - noun: a place where people can play

import UIKit
//Implement atoi which converts a string to an integer.
//
//The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
//
//The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
//
//If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
//
//If no valid conversion could be performed, a zero value is returned.
//
//Note:
//
//Only the space character ' ' is considered as whitespace character.
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
//Example 1:
//
//Input: "42"
//Output: 42
//Example 2:
//
//Input: "   -42"
//Output: -42
//Explanation: The first non-whitespace character is '-', which is the minus sign.
//Then take as many numerical digits as possible, which gets 42.

class Solution {
    func myAtoi(_ str: String) -> Int {
        var isNegative = false
        var isStarted = false
        var currentNumber = 0;
        for char in str {
            switch (char) {
            case "+":
                if (!isStarted) {
                    isNegative = false
                    isStarted = true
                }
                else {
                    return 0
                }
            case "-":
                if (!isStarted) {
                    isNegative = true
                    isStarted = true
                }
                else {
                    return 0
                }
                
            case "0":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 0, isNegative: isNegative)
            case "1":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 1, isNegative: isNegative)
            case "2":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 2, isNegative: isNegative)
            case "3":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 3, isNegative: isNegative)
            case "4":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 4, isNegative: isNegative)
            case "5":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 5, isNegative: isNegative)
            case "6":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 6, isNegative: isNegative)
            case "7":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 7, isNegative: isNegative)
            case "8":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 8, isNegative: isNegative)
            case "9":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 9, isNegative: isNegative)
            default:
                if (isStarted) {
                    if (isNegative) {
                        return currentNumber * -1;
                    }
                    else {
                        return currentNumber
                    }
                }
                else if (char != " ") {
                    return 0
                }
            }
        }
        
        if (isNegative) {
            return currentNumber * -1;
        }
        else {
            return currentNumber
        }
    }
    
    func multiplyValue(value: Int, add: Int, isNegative: Bool) -> Int {
        var checkValue: Int
        if isNegative {
            checkValue = 2147483648
        }
        else {
            checkValue = 2147483647
        }
        
        
        if (((checkValue - add) / 10) >= value)
        {
            return (value * 10) + add
        }
        else {
            
            return checkValue
        }
    }
}
