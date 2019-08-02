/*
 Given a n x n matrix where each of the rows and columns are sorted in ascending order, find the kth smallest element in the matrix.
 
 Note that it is the kth smallest element in the sorted order, not the kth distinct element.
 
 Example:
 
 matrix = [
 [ 1,  5,  9],
 [10, 11, 13],
 [12, 13, 15]
 ],
 k = 8,
 
 return 13.
 Note:
 You may assume k is always valid, 1 ≤ k ≤ n2.
 
 */

class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var matrix = matrix
        var left:Int = matrix[0][0]
        var right:Int = matrix.last!.last!
        while (left < right)
        {
            let mid:Int = left + (right - left) / 2
            let cnt:Int = search_less_equal(&matrix, mid)
            if cnt < k
            {
                left = mid + 1
            }
            else
            {
                right = mid
            }
        }
        return left
    }
    
    func search_less_equal(_ matrix:inout [[Int]], _ target: Int) -> Int
    {
        let n:Int = matrix.count
        var i:Int = n - 1
        var j:Int = 0
        var res:Int = 0
        while(i >= 0 && j < n)
        {
            if matrix[i][j] <= target
            {
                res += i + 1
                j += 1
            }
            else
            {
                i -= 1
            }
        }
        return res
    }
}
