import Foundation
/*
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 You may assume nums1 and nums2 cannot be both empty.
 
 Example 1:
 
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 Example 2:
 
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 */

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var i = 0, j = 0
    var m = nums1.count, n = nums2.count
    var arr1 = nums1, arr2 = nums2
    if m > n {
        swap(&m, &n)
        swap(&arr1, &arr2)
    }
    let half = (m + n) / 2
    
    var leftMax = 0, rightMin = 0

    var min = 0, max = m
    while min <= max {
        i = (min + max) / 2
        j = half - i
        if i > 0 && arr1[i-1] > arr2[j] {
            max = i - 1
        } else if i < m && arr2[j-1] > arr1[i] {
            min = i + 1
        } else {
            if i == m {
                rightMin = arr2[j]
            } else if j == n {
                rightMin = arr1[i]
            } else {
                rightMin = arr1[i] > arr2[j] ? arr2[j] : arr1[i]
            }
            
            if (m + n) % 2 == 1 {
                return Double(rightMin)
            }
            
            if i == 0 {
                leftMax = arr2[j - 1]
            } else if j == 0 {
                leftMax = arr1[i - 1]
            } else {
                leftMax = arr1[i-1] > arr2[j-1] ? arr1[i-1] : arr2[j-1]
            }
            return Double(leftMax + rightMin) / 2.0
        }
    }
    return 0
}
