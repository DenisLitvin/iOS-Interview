import Foundation

/*
This problem was asked by Facebook.

Given an array of numbers representing the stock prices of a company in chronological order and an integer k, return the maximum profit you can make from k buys and sells. You must buy the stock before you can sell it, and you must sell the stock before you can buy it again.

For example, given k = 2 and the array [5, 2, 4, 0, 1], you should return 3.
*/

func trade(_ array: [Int]) -> Int {
    var count = 0
    var canSell = false
    var boughtFor = 0
    for index in 0 ..< array.count {
        if isPeak(index: index, in: array), canSell {
            canSell.toggle()
            count += array[index] - boughtFor
        }
        else if isLow(index: index, in: array), !canSell {
            canSell.toggle()
            boughtFor = array[index]
        }
    }
    return count
}

func isPeak(index: Int, in array: [Int]) -> Bool{
    if index + 1 < array.count {
        return array[index + 1] < array[index]
    }
    return true
}

func isLow(index: Int, in array: [Int]) -> Bool {
    if index + 1 < array.count {
        return array[index + 1] > array[index]
    }
    return false
}

trade([0,4,1,3,4,4,2,3])
