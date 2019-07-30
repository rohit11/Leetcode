

/*
 
 Algorithm
 
 Initialize the empty answer array where for a given index i, answer[i] would contain the product of all the numbers to the left of i.
 We construct the answer array the same way we constructed the L array in the previous approach. These two algorithms are exactly the same except that we are trying to save up on space.
 The only change in this approach is that we don't explicitly build the R array from before. Instead, we simply use a variable to keep track of the running product of elements to the right and we keep updating the answer array by doing
 
 answer[i]=answer[i]∗R. For a given index i, answer[i] contains the product of all the elements to the left and R would contain product of all the elements to the right. We then update R as
 asR
 =
 R
 ∗
 n
 u
 m
 s
 [
 i
 ]
 R=R∗nums[i]
 */


class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        
        var result = [Int](repeating : 0 , count :nums.count)
        var left = 1
        
        for i in 0..<nums.count {
            
            if i > 0 {
                
                left *= nums[i - 1]
            }
            
            result[i] = left
        }
        
        
        var right = 1
        var i = nums.count - 1
        while i >= 0 {
            
            if i < nums.count - 1 {
                right *= nums[i + 1]
            }
            
            result[i] = result[i] * right
            i = i - 1
        }
        
        
        return result
        
    }
}


/*
 Complexity analysis
 
 Time complexity :
 O
 (
 N
 )
 O(N) where
 N
 N represents the number of elements in the input array. We use one iteration to construct the array
 L
 L, one to update the array
 a
 n
 s
 w
 e
 r
 answer.
 Space complexity :
 O
 (
 1
 )
 O(1) since don't use any additional array for our computations. The problem statement mentions that using the
 a
 n
 s
 w
 e
 r
 answer array doesn't add to the space complexity.
 */
