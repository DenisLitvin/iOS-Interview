//: Playground - noun: a place where people can play

import UIKit


//Longest Palindromic Substring
//Given a string, find the longest substring which is palindrome. For example, if the given string is “forgeeksskeegfor”, the output should be “geeksskeeg”.

//O(n^2) time and O(1) space
func longestPalindrom(str: Array<Character>) -> String {
    
    //helper
    let longest: (Int, Int, Array<Character>)  -> (length: Int, start: Int) = { (left: Int, right: Int, str: Array<Character>) -> (Int, Int) in
        
        var maxLength = 0
        var maxStart = 0
        var left = left
        var right = right
        
        while left >= 0,
            right < str.count,
            str[left] == str[right] {
                let length = right - left + 1
                maxLength = length
                maxStart = left
                left -= 1
                right += 1
        }
        return (maxLength, maxStart)
    }
    
    var maxLength = 1
    var maxStart = 0
    
    for i in 1 ..< str.count {
        
        //case 'aba'
        var left = i - 1
        var right = i + 1
        var result = longest(left, right, str)
        if result.length > maxLength {
            maxLength = result.length
            maxStart = result.start
        }
        
        //case 'aa'
        left = i - 1
        right = i
        result = longest(left, right, str)
        if result.length > maxLength {
            maxLength = result.length
            maxStart = result.start
        }
    }
    return String(str[maxStart ..< maxStart + maxLength])
}

longestPalindrom(str: Array("bbacbabb"))
