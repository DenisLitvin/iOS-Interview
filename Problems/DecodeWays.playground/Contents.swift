import Foundation
/*
A message containing letters from A-Z is being encoded to numbers using the following mapping:

'A' -> 1
'B' -> 2
...
'Z' -> 26
Given a non-empty string containing only digits, determine the total number of ways to decode it.

Example 1:

Input: "12"
Output: 2
Explanation: It could be decoded as "AB" (1 2) or "L" (12).
Example 2:

Input: "226"
Output: 3
Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
*/

//O(n)
func numDecodings(_ s: String) -> Int {
    guard !s.starts(with: "0") else { return 0}
    var cache = [String.Index: Int]()
    return decodeHelper(s, idx: s.startIndex, cache: &cache)
}

func decodeHelper(_ s: String, idx: String.Index, cache: inout [String.Index: Int]) -> Int {
    guard idx < s.endIndex else { return 1 }
    var res = 0
    let nextIdx = s.index(after: idx)
    
    if let saved = cache[idx] { return saved }
    
    if s[idx] > "0" {
        res += decodeHelper(s, idx: nextIdx, cache: &cache)
        if  idx < s.index(before: s.endIndex) {
            if s[idx] == "1" {
                res += decodeHelper(s, idx: s.index(after: nextIdx), cache: &cache)
            }
            else if s[idx] == "2",
                s[nextIdx] <= "6" {
                res += decodeHelper(s, idx: s.index(after: nextIdx), cache: &cache)
            }
        }
    }
    
    cache[idx] = res
    
    return res
}

numDecodings("121212121212121212121212121212121212121121212121212")
