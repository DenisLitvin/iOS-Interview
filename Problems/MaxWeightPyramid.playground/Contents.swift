import UIKit

/*
This problem was asked by Google.

You are given an array of arrays of integers, where each array corresponds to a row in a triangle of numbers. For example, [[1], [2, 3], [1, 5, 1]] represents the triangle:

1
2 3
1 5 1
We define a path in the triangle to start at the top and go down one row at a time to an adjacent value, eventually ending with an entry on the bottom row. For example, 1 -> 3 -> 5. The weight of the path is the sum of the entries.

Write a program that returns the weight of the maximum weight path.
*/

func maxWeightPath(row: Int = 0, idx: Int = 0, triangle: [[Int]], cache: inout [[Int]]) -> Int {
    if row > triangle.count - 1 { return 0 }
    let value = triangle[row][idx]
    let result: Int
    
    if cache[row][idx] != 0 {
        result = cache[row][idx]
    }
    else {
        result = value + max(
            maxWeightPath(row: row + 1, idx: idx, triangle: triangle, cache: &cache),
            maxWeightPath(row: row + 1, idx: idx + 1, triangle: triangle, cache: &cache)
        )
    }
    cache[row][idx] = result
    return result
}

let triangle =
    [
        [1],
        [2,3],
        [1,5,1],
        [2,3,1,9],
        [3,6,7,-5,4]
]
var cache = triangle.map { (row) in
    return row.map { _ in
        return 0
    }
}
maxWeightPath(triangle: triangle, cache: &cache)
