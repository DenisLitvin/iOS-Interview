import UIKit

/*
 Given an input string, reverse the string word by word.
 
 Example:
 
 Input: "the sky is blue",
 Output: "blue is sky the".
 Note:
 
 A word is defined as a sequence of non-space characters.
 Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
 You need to reduce multiple spaces between two words to a single space in the reversed string.
 Follow up: For C programmers, try to solve it in-place in O(1) space.
 */

// O(n + m) - time complexity
// O(1) - space complexity
func swapWords(str: inout [Character]) {
    var left = 0
    var right = str.count - 1
    
    swapInside(str: &str, left: left, right: right)
    
    for i in 0 ..< str.count {
        if str[i] == " " {
            right = i - 1
            swapInside(str: &str, left: left, right: right)
            left = i + 1
        }
    }
    swapInside(str: &str, left: left, right: str.count - 1)
}

func swapInside(str: inout [Character], left: Int, right: Int) {
    var left = left
    var right = right
    
    while left <= right {
        str.swapAt(left, right)
        left += 1
        right -= 1
    }
}

var arr = Array("error or")
swapWords(str: &arr)
arr
