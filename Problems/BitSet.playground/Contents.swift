import UIKit

/*
 For [1, 2, 3], all possible subsets are {1},
 {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3}
 print them
 */

func bitSet(of array: [String]) {
    let m = Int(pow(Double(2), Double(array.count)))
    let BITS = Int.bitWidth
    for i in 1 ..< m {
        var current = [String]()
        for b in 0 ..< BITS {
            if 1 << b & i > 0 {
                current.append(array[b])
            }
        }
        print(current.reversed().joined())
    }
}

bitSet(of: ["0","1","2", "3"])
