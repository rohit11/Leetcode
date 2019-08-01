//https://leetcode.com/problems/4sum-ii/
/*
 Given four lists A, B, C, D of integer values, compute how many tuples (i, j, k, l) there are such that A[i] + B[j] + C[k] + D[l] is zero.
 
 To make problem a bit easier, all A, B, C, D have same length of N where 0 ≤ N ≤ 500. All integers are in the range of -228 to 228 - 1 and the result is guaranteed to be at most 231 - 1.
 
 Example:
 
 Input:
 A = [ 1, 2]
 B = [-2,-1]
 C = [-1, 2]
 D = [ 0, 2]
 
 Output:
 2
 
 Explanation:
 The two tuples are:
 1. (0, 0, 0, 1) -> A[0] + B[0] + C[0] + D[1] = 1 + (-2) + (-1) + 2 = 0
 2. (1, 1, 0, 0) -> A[1] + B[1] + C[0] + D[0] = 2 + (-1) + (-1) + 0 = 0
 
 */


// Steps (A + B ) = - ( C + D)
// 1. check A or B or C or D is nil if Yes then return 0
// 2. check for i 0 to a.count & j for 0 to b.count
// 3. if hashmap contains A[i] + B[j] then increase value by 1 for A[i] + B[j] else A[i] + B[j] = 1
// 4. heck for i 0 to c.count & j for 0 to d.count  get sum = - 1 * (c[i] + d[j])  check hashmap containing key sum or not.
// 5. if it present then increment counter by hashmap of sum key value


// O(N*2)

class Solution {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        
        if A.count == 0 || B.count  == 0 || C.count  == 0 || D.count  == 0 {
            return 0
        }
        
        var result : [ Int : Int] = [Int : Int] ()
        
        var count = 0
        
        for i in 0..<A.count {
            
            for j in 0..<B.count {
                
                let sum = A[i] + B[j]
                if result.keys.contains(sum) {
                    result[sum] = result[sum]! + 1
                }else {
                    result[sum] = 1
                }
            }
        }
        
        for i in 0..<C.count {
            
            for j in 0..<D.count {
                
                let sum = -1 * (C[i] + D[j])
                
                if result.keys.contains(sum){
                    count += result[sum]!
                }
            }
        }
        
        return count
    }
}
