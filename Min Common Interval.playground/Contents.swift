import Foundation

/*(
This problem was asked by Google.

Given a set of closed intervals, find the smallest set of numbers that covers all the intervals. If there are multiple smallest sets, return any of them.

For example, given the intervals [0, 3], [2, 6], [3, 4], [6, 9], one set of numbers that covers all these intervals is {3, 6}.
*/

func interval(intervals: [[Int]]) -> (Int, Int){
    
    var min = Int.max
    var max = Int.min
    
    for pair in intervals {
        if pair[0] > max {
            max = pair[0]
        }
        if pair[1] < min {
            min = pair[1]
        }
    }
    return (min,max)
}

interval(intervals: [[0, 3], [2, 6], [3, 4], [6, 9]])
