//230. Kth Smallest Element in a BST

/*
 Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.
 
 Note:
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
 
 Example 1:
 
 Input: root = [3,1,4,null,2], k = 1
 3
 / \
 1   4
 \
 2
 Output: 1
 Example 2:
 
 Input: root = [5,3,6,2,4,null,null,1], k = 3
 5
 / \
 3   6
 / \
 2   4
 /
 1
 Output: 3
 Follow up:
 What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?
 
 */

/*
 
 * Primary idea: use stack to do inorder traverse and track k to find answer
 * Time Complexity: O(n), Space Complexity: O(n)
 
 Steps
 1.  create stack with hold TreeNode?, assign k and current as root node variable
 2.  while !stack.isEmpty or current not nil
 3. if current!= nil then add current into stack and current to current left node
 4. else remove node from stack and decrement k by 1
 5. if k is zero then return node.val
 6. current = node of right
 */

  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
          self.val = val
         self.left = nil
         self.right = nil
     }
  }

class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        
        var stack = [TreeNode?](), k = k , current = root
        
        
        if !stack.isEmpty || current != nil {
            
            if current != nil {
                stack.append(current!)
                current = current?.left
            } else {
                let node = stack.removeLast()
                k -= 1
                
                if k == 0 {
                    return (node?.val)!
                }
                current = node?.right
            }
        }
        
        return -1
    }
}

