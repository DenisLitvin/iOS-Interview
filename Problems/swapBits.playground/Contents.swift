import Foundation

/*
 This problem was asked by Facebook.
 
 Given a 32-bit integer, return the number with its bits reversed.
 
 For example, given the binary number 1111 0000 1111 0000 1111 0000 1111 0000, return 0000 1111 0000 1111 0000 1111 0000 1111.
 */

func reverse(_ int: Int32) -> Int32 {
    var newInt: Int32 = 0
    var offset = 0
    while offset <= 24 {
        for i in 0 ..< 4 {
            reverseHelper(shift: offset + i + 4, offset: offset + i, newInt: &newInt, oldInt: int)
        }
        for i in 4 ..< 8 {
            reverseHelper(shift: offset + i - 4, offset: offset + i, newInt: &newInt, oldInt: int)
        }
        offset += 8
    }
   
    return newInt
}

func reverseHelper(shift: Int, offset: Int, newInt: inout Int32, oldInt: Int32) {
    if 1 << (offset) & oldInt > 0 {
        newInt |= 1 << shift
    }
}



reverse(1 << 4) == 1

reverse(1) == 1 << 4

reverse(1 << 27) == 1 << 31
