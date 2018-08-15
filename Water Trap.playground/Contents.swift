//: Playground - noun: a place where people can play

import UIKit

/*
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
 */

//O(n*m) m - height
    func rainDrops(in array: [Int]) -> Int {
    var l = true
    var r = true
    var dropsCountTotal = 0
    var layer = 1
    
    let max = array.max() ?? 0
    while layer <= max {
        r = false
        l = false
        var dropsCount = 0
        
        for i in array {
            if i >= layer {
                if !l { l = true }
                else if !r { r = dropsCount == 0 ? false : true }
            }
            
            if l, r, dropsCount > 0 {
//                print(l, r, dropsCount, "in layer -", layer, "position -", i)
                dropsCountTotal += dropsCount
                dropsCount = 0
                r = false
            }
            else if i < layer, l || r {
                dropsCount += 1
            }
        }
        layer += 1
    }
    return dropsCountTotal
}

//O(n)
func rainDrops2(in array: [Int]) -> Int {
    guard array.count > 0 else { return 0 }
    
    var left = 0
    var right = array.count - 1
    var moveLeft = true
    var level: (Int, Int) = (0, 0)
    var count = 0
    
    while left != right {
        let value = moveLeft ? array[left] : array [right]
        let oppositeLevel = moveLeft ? level.1 : level.0
        let selfLevel = moveLeft ? level.0 : level.1
        
        if value > oppositeLevel {
            if moveLeft { level.0 = value } else { level.1 = value } //increment
            moveLeft = !moveLeft //switch side
//            print(value, "move left - ", !moveLeft)
            continue
        }
        if value > selfLevel {
            if moveLeft { level.0 = value } else { level.1 = value } //increment
        }
        else if value < min(level.0, level.1) {
            count += min(level.0, level.1) - value
        }
        if moveLeft {
            left += 1
        }
        else {
            right -= 1
        }
    }
    return count
}
rainDrops2(in: [0,1,0,2,1,0,1,3,2,1,2,1])
