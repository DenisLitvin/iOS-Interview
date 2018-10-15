import Foundation

/*
 Given a string containing just the characters '(' and ')',
 find the length of the longest valid (well-formed)
 parentheses substring.
 */



//O(n) - time
//O(n) - space
func longestValidParentheses(in string: String) -> Int {
    let array = Array(string)
    if array.count < 2 { return 0 }
    
    var history = Array(repeating: false, count: array.count)
    var stack: [(char: Character, index: Int)] = []
    
    for i in 0 ..< array.count {
        if array[i] == "(" {
            stack.append((char: array[i], index: i))
        }
        else if array[i] == ")",
            let last = stack.last,
            last.char == "(" {
            
            history[last.index] = true
            history[i] = true
            stack.removeLast()
        }
    }
    var max = 0
    var count = 0
    
    history.forEach { valid in
        count = valid ? count + 1 : 0
        if count > max { max = count }
    }
    return max
}

var str = "()(()"
longestValidParentheses(in: str)
