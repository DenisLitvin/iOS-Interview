import UIKit

/*
This problem was asked by Google.

Given a sorted list of integers, square the elements and give the output in sorted order.

For example, given [-9, -2, 0, 2, 3], return [0, 4, 4, 9, 81].

*/

//O(n) - time complexity
//O(n) - space complexity
func squaredSort(elements: [Int]) -> [Int] {
    
    var negative = [Int]()
    var positive = [Int]()
    var result = [Int]()
    
    for i in elements {
        if i < 0 {
            negative.append(i * i)
        }
        else if i > 0 {
            positive.append(i * i)
        }
        else {
            result.append(i)
        }
    }
    negative.reverse()
    
    while !negative.isEmpty && !positive.isEmpty {
        if negative[0] < positive[0] {
            result.append(negative.removeFirst())
        }
        else {
            result.append(positive.removeFirst())
        }
    }
    
    return result + positive + negative
}

squaredSort(elements: [-10,-2,-2,0,1,5,100])
