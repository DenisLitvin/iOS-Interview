//: Playground - noun: a place where people can play

import UIKit

//
//Minimum insertions to form a palindrome | DP-28
//Given a string, find the minimum number of characters to be inserted to convert it to palindrome.
//
//Before we go further, let us understand with few examples:
//
//ab: Number of insertions required is 1 i.e. bab
//aa: Number of insertions required is 0 i.e. aa
//abcd: Number of insertions required is 3 i.e. dcbabcd
//abcda: Number of insertions required is 2 i.e. adcbcda which is same as number of insertions in the substring bcd(Why?).
//abcde: Number of insertions required is 4 i.e. edcbabcde
//

//Let the input string be str[l……h]. The problem can be broken down into three parts:
//1. Find the minimum number of insertions in the substring str[l+1,…….h].
//2. Find the minimum number of insertions in the substring str[l…….h-1].
//3. Find the minimum number of insertions in the substring str[l+1……h-1].
//
//Recursive Solution
//The minimum number of insertions in the string str[l…..h] can be given as:
//
//minInsertions(str[l+1…..h-1]) if str[l] is equal to str[h]
//min(minInsertions(str[l…..h-1]), minInsertions(str[l+1…..h])) + 1 otherwise

//Naive approach
//O(2^n) time
func minToPalindrom(str: Array<Character>, left: Int, right: Int) -> Int {
    
    if left > right { return Int.max }
    if left == right { return 0 }
    if left == right - 1 { return str[left] == str[right] ? 0 : 1 }
    
    return str[left] == str[right]
        ? minToPalindrom(str: str, left: left + 1, right: right - 1)
        : min(
            minToPalindrom(str: str, left: left + 1, right: right),
            minToPalindrom(str: str, left: left, right: right - 1)
        ) + 1
}
let str = "abqaa"
minToPalindrom(str: Array(str), left: 0, right: str.count - 1)


//Dynamic Programming based Solution
//If we observe the above approach carefully, we can find that it exhibits overlapping subproblems.
//Suppose we want to find the minimum number of insertions in string “abcde”:
//
//                  abcde
//           /            |      \
//          /             |        \
//        bcde           abcd    bcd  <- case 3 is discarded as str[l] != str[h]
//     /   |   \       /   |   \
//    /    |    \     /    |    \
//  cde   bcd  cd   bcd abc bc
// / | \  / | \ /|\ / | \
//de cd d cd bc c………………….
//The substrings in bold show that the recursion to be terminated and the recursion tree cannot originate from there. Substring in the same color indicates overlapping subproblems.
//
//How to reuse solutions of subproblems?
//We can create a table to store results of subproblems so that they can be used directly if same subproblem is encountered again.
//
//The below table represents the stored values for the string abcde.
//
//a b c d e
//----------
//0 1 2 3 4
//0 0 1 2 3
//0 0 0 1 2
//0 0 0 0 1
//0 0 0 0 0
//How to fill the table?
//The table should be filled in diagonal fashion. For the string abcde, 0….4, the following should be order in which the table is filled:
//
//Gap = 1:
//(0, 1) (1, 2) (2, 3) (3, 4)
//
//Gap = 2:
//(0, 2) (1, 3) (2, 4)
//
//Gap = 3:
//(0, 3) (1, 4)
//
//Gap = 4:
//(0, 4)
