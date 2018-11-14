import Foundation

struct Index: Hashable {
    let row: Int
    let column: Int
    
    func right() -> Index {
        return Index(row: row, column: column + 1)
    }
    func left() -> Index {
        return Index(row: row, column: column - 1)
    }
    func bottom() -> Index {
        return Index(row: row + 1, column: column)
    }
    func top() -> Index {
        return Index(row: row - 1, column: column)
    }
}
/*
This question was asked by Google.

Given an N by M matrix consisting only of 1's and 0's, find the largest rectangle containing only 1's and return its area.

For example, given the following matrix:

[[1, 0, 0, 0],
[1, 0, 1, 1],
[1, 0, 1, 1],
[0, 1, 0, 0]]
 Return 4
*/

func largest(in matrix: [[Int]]) -> Int {
    var visited = Set<Index>()
    var max = 0
    for row in 0 ..< matrix.count {
        for column in 0 ..< matrix[row].count {
            var rect = 0
            largestHelper(index: Index(row: row, column: column), in: matrix, visited: &visited, count: &rect)
            if rect > max { max = rect }
        }
    }
    return max
}

func largestHelper(index: Index, in matrix: [[Int]], visited: inout Set<Index>, count: inout Int) {
    if matrix[index.row][index.column] == 0
        || visited.contains(index) { return }

    count += 1
    visited.insert(index)
    
    if withinBounds(index: index.right(), in: matrix) {
        largestHelper(index: index.right(), in: matrix, visited: &visited, count: &count)
    }
    if withinBounds(index: index.left(), in: matrix) {
        largestHelper(index: index.left(), in: matrix, visited: &visited, count: &count)
    }
    if withinBounds(index: index.top(), in: matrix) {
        largestHelper(index: index.top(), in: matrix, visited: &visited, count: &count)
    }
    if withinBounds(index: index.bottom(), in: matrix) {
        largestHelper(index: index.bottom(), in: matrix, visited: &visited, count: &count)
    }
    return
}

func withinBounds(index: Index, in matrix: [[Int]]) -> Bool {
    return index.row < matrix.count
        && index.row >= 0
        && index.column < matrix[index.row].count
        && index.column >= 0
}

largest(in: [[1, 0, 0, 0],
             [1, 0, 1, 1],
             [1, 0, 1, 1],
             [1, 0, 0, 0]])
