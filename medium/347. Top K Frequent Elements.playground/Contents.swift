
/*Given a non-empty array of integers, return the k most frequent elements.

Example 1:

Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]
Example 2:

Input: nums = [1], k = 1
Output: [1]
Note:

You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
*/


/* Steps
 
 1. use Hashmap to store frequency of each element in array and store value as count
 2. get all keys for dictionary into array
 3. sort value using deasending order
 4. get Array for keys for zero to < k element
 */


class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
        var resultDict : Dictionary<Int,Int> = [Int : Int]()
        for num in nums {
            
            if let value = resultDict[num] {
                resultDict[num] = value + 1
            } else {
                resultDict[num] = 1
            }
        }
        
        var keys = Array(resultDict.keys)
        
        keys.sort {
          let value1 = resultDict[$0]
          let value2 = resultDict[$1]
          return value1! > value2!
        }
        
        return Array(keys[0..<k])
    }
}


/*
 Time complexity :
 O
 (
 N
 log
 ⁡
 (
 k
 )
 )
 O(Nlog(k)). The complexity of Counter method is
 O
 (
 N
 )
 O(N). To build a heap and output list takes
 O
 (
 N
 log
 ⁡
 (
 k
 )
 )
 O(Nlog(k)). Hence the overall complexity of the algorithm is
 O
 (
 N
 +
 N
 log
 ⁡
 (
 k
 )
 )
 =
 O
 (
 N
 log
 ⁡
 (
 k
 )
 )
 O(N+Nlog(k))=O(Nlog(k)).
 
 Space complexity :
 O
 (
 N
 )
 O(N) to store the hash map.
 */
