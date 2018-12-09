import Foundation

/*
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note:
 
 The solution set must not contain duplicate triplets.
 
 Example:
 
 Given array nums = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 */

//O(n^2) - time
//O(n) - space
func threeSum(_ nums: [Int]) -> [[Int]] {
    var nums = nums.sorted { (a, b) -> Bool in
        return a < b
    }
    guard nums.count > 2 else{
        return []
    }
    
    var solutions = [[Int]]()
    for i in 0..<nums.count - 2{
        let f1 = nums[i]
        if i > 0 && f1 == nums[i-1]{
            continue
        }
        if f1 > 0 {
            break
        }
        var leftPtr = i + 1,rightPtr = nums.count - 1,sum = 0 - f1
        while leftPtr < rightPtr{
            let s = nums[leftPtr] + nums[rightPtr]
            if  s == sum{
                solutions.append([f1,nums[leftPtr],nums[rightPtr]])
                while leftPtr < rightPtr && nums[leftPtr] == nums[leftPtr + 1]{
                    leftPtr += 1
                }
                while leftPtr < rightPtr && nums[rightPtr] == nums[rightPtr - 1]{
                    rightPtr -= 1
                }
                leftPtr += 1
                rightPtr -= 1
            }else{
                if s < sum{
                    leftPtr += 1
                }else{
                    rightPtr -= 1
                }
            }
        }
    }
    return solutions
}

threeSum([-13,5,13,12,-2,-11,-1,12,-3,0,-3,-7])
