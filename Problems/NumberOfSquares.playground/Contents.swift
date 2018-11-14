//: Playground - noun: a place where people can play

import Foundation

/*
This problem was asked by Facebook.

Given a positive integer n, find the smallest number of squared integers which sum to n.

For example, given n = 13, return 2 since 13 = 32 + 22 = 9 + 4.

Given n = 27, return 3 since 27 = 32 + 32 + 32 = 9 + 9 + 9.
*/

//time complexity - O(n^n)
func numOfSquares(in int: Int) -> Int {
    if isSquared(int) { return 1 }
    var min = Int.max
    
    for i in 1 ..< int {
        let potential = int - i
        if isSquared(potential) {
            let num = 1 + numOfSquares(in: i)
            if num == 2 { return num }
            if num < min { min = num }
        }
    }
    return min
}

//func numOfSquaresHelper(in int: Int, current: Int) -> Int {
//    return 0
//}

func isSquared(_ int: Int) -> Bool {
    return Int(exactly: sqrt(Double(int))) != nil
}

numOfSquares(in: 3899)
