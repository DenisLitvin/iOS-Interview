import UIKit


let arr = [1,2,3,4,5,6,7]
let sum = 10

func count(s: [Int], n: Int, idx: Int, str: String) -> Int {
    if n == 0 {
        print(str)
        return 1
    }
    if n < 0 {
        return 0
    }
    var idx = idx
    
    while idx < s.count && s[idx] <= n {
        let c = count(s: s, n: n - s[idx], idx: idx, str: str + "\(s[idx])")
        idx += 1
    }
    return 0
}

count(s: arr, n: sum, idx: 0, str: "")

func count2(_ S: [Int],_ m: Int, _ n: Int ) -> Int {
    // If n is 0 then there is 1 solution
    // (do not include any coin)
    if (n == 0) {
        return 1
    }
    
    // If n is less than 0 then no
    // solution exists
    if (n < 0) {
        return 0
    }
    // If there are no coins and n
    // is greater than 0, then no
    // solution exist
    if (m <= 0 && n >= 1) {
    return 0
    }
    // count is sum of solutions (i)
    // including S[m-1] (ii) excluding S[m-1]
    return count2( S, m - 1, n ) + count2( S, m, n-S[m-1] );
}

count2(arr, arr.count, sum)

func count3(_ S: [Int], _ m: Int,_ n: Int ) -> Int {
    var x, y: Int
    
    // We need n+1 rows as the table
    // is constructed in bottom up
    // manner using the base case 0
    // value case (n = 0)
    var table = Array(repeating: Array(repeating: 0, count: m), count: n + 1)
    
    // Fill the enteries for 0
    // value case (n = 0)
    for i in 0 ..< m {
        table[0][i] = 1
    }
    
    // Fill rest of the table entries
    // in bottom up manner
    for i in 1 ..< n + 1 {
        for j in 0 ..< m {
            // Count of solutions including S[j]
            x = (i-S[j] >= 0) ? table[i - S[j]][j] : 0
            
            // Count of solutions excluding S[j]
            y = (j >= 1) ? table[i][j - 1] : 0
            
            // total count
            table[i][j] = x + y
        }
    }
    return table[n][m - 1]
}

count3(arr, arr.count, sum)
