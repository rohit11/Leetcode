//https://leetcode.com/problems/find-the-duplicate-number/
/*
 Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.
 
 Example 1:
 
 Input: [1,3,4,2,2]
 Output: 2
 Example 2:
 
 Input: [3,1,3,4,2]
 Output: 3
 Note:
 
 You must not modify the array (assume the array is read only).
 You must use only constant, O(1) extra space.
 Your runtime complexity should be less than O(n2).
 There is only one duplicate number in the array, but it could be repeated more than once.
 */

/*
 
 Steps
 
 1. check count is zero then return 0
 2. start i  with 0 and itrate till nums.count
 3. if num[i] - 1 != i && nums[nums[i] -1] == nums[i] then return nums[i]
 4. else nums[i] - 1 == i then i ++
 5. else swap i, num[i] - 1
 6. if not return then return -1
 
 */

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        
        var nums = nums
        if nums.count == 0 {
            return 0
        }
        
        var i = 0
        
        while  i < nums.count {
            
            if nums[i] - 1 != i && nums[i] - 1 == nums[i] {
                return nums[i]
            } else if nums[i] - 1 == i {
                i += 1
            } else {
                nums.swapAt(i, nums[i] - 1)
            }
        }
        
        return -1
    }
    
}
