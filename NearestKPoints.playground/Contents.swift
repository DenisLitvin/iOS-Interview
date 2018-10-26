//: Playground - noun: a place where people can play

import Foundation

/*
 This problem was asked by LinkedIn.
 
 Given a list of points, a central point, and an integer k, find the nearest k points from the central point.
 
 For example, given the list of points [(0, 0), (5, 4), (3, 1)], the central point (1, 2), and k = 2, return [(0, 0), (3, 1)].
 */

typealias Point = (x: Int, y: Int)
typealias Item = (offset: Int, element: Int)

func nearest(in array: [Point], pivot: Point, k: Int) -> [Point] {
    var left = k
    var result = [Point]()
    let pivotSqr = pivot.x * pivot.x + pivot.y * pivot.y
    let arraySqr = array.map { $0.x * $0.x + $0.y * $0.y }
    
    var heap = Heap<(offset: Int, element: Int)> {
        return abs($0.element - pivotSqr) < abs($1.element - pivotSqr)
    }
    arraySqr.enumerated().forEach { heap.insert($0) }
    
    while !heap.isEmpty, left > 0 {
        result.append(array[heap.remove()!.offset])
        left -= 1
    }
    return result
}

let points = [
    (x: 2, y: 10),
    (x: 7, y: 3),
    (x: 9, y: 3),
    (x: 18, y: 4),
    (x: 5, y: 3)
]

nearest(in: points, pivot: (x: 11, y: 13), k: 3)
