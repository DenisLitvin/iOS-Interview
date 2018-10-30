//: Playground - noun: a place where people can play

import Foundation

/*
 Find an efficient algorithm to find the smallest distance (measured in number of words) between any two given words in a string.
 
 For example, given words "hello", and "world" and a text content of "dog cat hello cat dog dog hello cat world",
 return 1 because there's only one word "cat" in between the two words.
 */

func distanceBetweenClosest(pair: (String, String), in string: String) -> Int {
    let words = string.components(separatedBy: " ")
    var bitArray = Array(repeating: UInt8(0), count: words.count)
    
    words.enumerated().forEach {
        if $0.element == pair.0 {
            bitArray[$0.offset] = 1
        }
        else if $0.element == pair.1 {
            bitArray[$0.offset] = 2
        }
    }
    let index = bitArray.index { $0 == 1 || $0 == 2 }!
    let type = bitArray[index]
    return distanceHelper(for: type, startIdx: index + 1, in: bitArray)
}

func distanceHelper(for type: UInt8, startIdx: Int, in array: [UInt8]) -> Int {
    
    for i in startIdx ..< array.count {
        let element = array[i]
        
        if element == type {
            return distanceHelper(for: type, startIdx: i + 1, in: array)
        }
        if element == 0 {
            continue
        }
        return min(i - startIdx, distanceHelper(for: element, startIdx: i + 1, in: array))
    }
    return Int.max
}

distanceBetweenClosest(pair: ("cat", "dog"), in: "cat and dadd dog bb j j kj dog 1 cat")
