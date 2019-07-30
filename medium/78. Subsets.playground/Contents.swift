/*
 
 
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 Example:
 
 Input: nums = [1,2,3]
 Output:
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 
 */

/*
 
 steps:
 1. create result array of int array to hold subset
 2. create stack array if Int
 3. create recurseive function which accept number of element, result, stack, poisition as 0
 4. if position == nums.count then append stack into result and return
 5. append position into stack
 6. call recurseive function which accept number of element, result, stack, poisition + 1
 7. remove last element from stack
 8. call recurseive function which accept number of element, result, stack, poisition + 1
 
 
 */


class Solution {
    
    func subsets(_ nums: [Int]) -> [[Int]] {
     
        var result = [[Int]] ()
        var path = [Int]()
        recurse(nums, result: &result, path: &path, position: 0)
        return result
        
    }
        
        func recurse(_ nums : [Int], result : inout [[Int]], path : inout [Int], position : Int){
            
            if position == nums.count {
                result.append(Array(path))
                return
            }
            
            path.append(nums[position])
            recurse(nums, result: &result, path: &path, position: position + 1)
            path.removeLast()
            recurse(nums, result: &result, path: &path, position: position + 1)

        }
    
}
