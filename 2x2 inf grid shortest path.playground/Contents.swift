//: Playground - noun: a place where people can play

import UIKit

/*
You are in an infinite 2D grid where you can move in any of the 8 directions:

(x,y) to
(x+1, y),
(x - 1, y),
(x, y+1),
(x, y-1),
(x-1, y-1),
(x+1,y+1),
(x-1,y+1),
(x+1,y-1)
You are given a sequence of points and the order in which you need to cover the points. Give the minimum number of steps in which you can achieve it. You start from the first point.

Example:

Input: [(0, 0), (1, 1), (1, 2)]
Output: 2
It takes 1 step to move from (0, 0) to (1, 1). It takes one more step to move from (1, 1) to (1, 2).

*/

let input = [(0, 0), (1, 1), (1, 2)]
func shortest(current: Int, visited: inout [Bool], score: Int) -> Int {
    
    var min: Int?
    
    for i in 0 ..< input.count {
        if visited[i] == true { continue }
        visited[i] = true
        let x = abs(input[i].0 - input[current].0)
        let y = abs(input[i].1 - input[current].1)
        let currentDistance = sqrt(Double(x * x + y * y))
        let possible = Int(currentDistance) + shortest(current: i, visited: &visited, score: score)
        if possible < min ?? Int.max {
            min = possible
        }
    }
    return score + (min ?? 0)
}

var visited = Array(repeating: false, count: input.count)
visited[0] = true
print(shortest(current: 0, visited: &visited, score: 0))
