import UIKit

/*
Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:

Any left parenthesis '(' must have a corresponding right parenthesis ')'.
Any right parenthesis ')' must have a corresponding left parenthesis '('.
Left parenthesis '(' must go before the corresponding right parenthesis ')'.
'*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
An empty string is also valid.
Example 1:

Input: "()"
Output: True
Example 2:

Input: "(*)"
Output: True
Example 3:

Input: "(*))"
Output: True
Note:

The string size will be in the range [1, 100].
*/

func checkValidString(_ s: String) -> Bool {
    guard s.count > 0 else {return true}
    var lower = 0
    var upper = 0
    for c in s {
        switch c {
        case "(":
            lower += 1
            upper += 1
        case "*":
            lower -= 1
            upper += 1
        case ")":
            upper -= 1
            lower -= 1

        default:
            fatalError()
        }
        lower = max(0,lower)
        guard upper >= 0 else {return false}
    }
    return lower == 0 && upper >= 0
}
checkValidString("(*)(*)")

