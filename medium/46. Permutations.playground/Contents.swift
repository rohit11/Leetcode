//https://leetcode.com/problems/permutations/
/*
 Given a collection of distinct integers, return all possible permutations.
 
 Example:
 
 Input: [1,2,3]
 Output:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]
 */

/*
 If the first integer to consider has index n that means that the current permutation is done.
 Iterate over the integers from index first to index n - 1.
 Place i-th integer first in the permutation, i.e. swap(nums[first], nums[i]).
 Proceed to create all permutations which starts from i-th integer : backtrack(first + 1).
 Now backtrack, i.e. swap(nums[first], nums[i]) back.
 */

//https://www.programcreek.com/2013/02/leetcode-permutations-java/

class Solution {


    func recPermutation(_ nums : [Int], begin: Int, result : inout [[Int]]) {
        
        var n = nums
        
        if begin >= n.count {
            result.append(n)
            return
        }
        
        for i in begin..<n.count {
            n.swapAt(i, begin)
            recPermutation(n,begin: begin + 1, result: &result)
            n.swapAt(i, begin)
        }
    }
    
     func permute(_ nums: [Int]) -> [[Int]] {
        
        var result = [[Int]] ()
        recPermutation(nums, begin: 0, result: &result)
        return result
        
    }
}

