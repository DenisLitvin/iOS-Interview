import Foundation

/*
 Find the length of largest subarray with 0 sum
 Given an array of integers, find length of the largest subarray with sum equals to 0.
 
 Examples :
 
 Input: arr[] = {15, -2, 2, -8, 1, 7, 10, 23};
 Output: 5
 The largest subarray with 0 sum is -2, 2, -8, 1, 7
 
 Input: arr[] = {1, 2, 3}
 Output: 0
 There is no subarray with 0 sum
 
 Input: arr[] = {1, 0, 3}
 Output: 1
 */

func find(in array: [Int]) -> Int {
//    var
    var max = 0
    var sum = 0
    var store = Dictionary<Int, Int>()
    
    for i in 0 ..< array.count {
        sum += array[i]
        if max == 0, array[i] == 0 {
            max = 1
        }
        if sum == 0 {
            max = i + 1
        }
        if let saved = store[sum] {
            let new = i - saved
            if new > max { max = new }
        }
        else {
            store[sum] = i
        }
    }
    return max
}

find(in: [15, -2, 2, -8, 1, 7, 10, 23])
