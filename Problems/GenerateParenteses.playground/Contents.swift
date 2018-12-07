import Foundation


/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 */

func generateParenthesis(_ n: Int) -> [String] {
    var result = [String]()
    parenthesesHelper(n: n, openLeft: 0, stream: "", result: &result)
    return result
}

func parenthesesHelper(n: Int, openLeft: Int, stream: String, result: inout [String]) {
    if n != 0 {
        parenthesesHelper(n: n - 1, openLeft: openLeft + 1, stream: stream + "(", result: &result)
    }
    if openLeft > 0 {
        let newS = stream + ")"
        parenthesesHelper(n: n, openLeft: openLeft - 1, stream: newS, result: &result)
    }
    if n == 0 && openLeft == 0 {
        result.append(stream)
    }
    return
}

generateParenthesis(2)
