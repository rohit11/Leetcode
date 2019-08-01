
//https://leetcode.com/problems/shuffle-an-array/

/*
 huffle a set of numbers without duplicates.
 
 Example:
 
 // Init an array with set 1, 2, and 3.
 int[] nums = {1,2,3};
 Solution solution = new Solution(nums);
 
 // Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must equally likely to be returned.
 solution.shuffle();
 
 // Resets the array back to its original configuration [1,2,3].
 solution.reset();
 
 // Returns the random shuffling of array [1,2,3].
 solution.shuffle();
 */

/*
 - steps 1. create local array variable which hold original array
        2. reset function return original array
        3. shuffle function return shuffle array
        4. hold original array into temp variable & get length
        5. iterate all element get ramdom number using Int.random
        6. if ramdom number is not equal to legnth - 1 then swap element
        7. return temp array
 */
class Solution {
    
    var nums: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return self.nums
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var copy = self.nums
        var length = copy.count
        for _ in copy {
            let randomIndex = Int.random(in: 0..<length)
            if randomIndex != length - 1 {
                copy.swapAt(randomIndex, length - 1)
            }
            length -= 1
        }
        return copy
    }
}

