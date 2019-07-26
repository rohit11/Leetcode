import UIKit

/*Given a binary tree, return the inorder traversal of its nodes' values.

Example:

Input: [1,null,2,3]
1
\
2
/
3

Output: [1,3,2]
Follow up: Recursive solution is trivial, could you do it iteratively?*/

// Morise Traversals
/*step 1: Initialize current as root

Step 2: While current is not NULL,

If current does not have left child

a. Add current’s value

b. Go to the right, i.e., current = current.right

Else

a. In current's left subtree, make current the right child of the rightmost node

b. Go to this left child, i.e., current = current.left*/


 // Definition for a binary tree node.
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var result : [Int] = [Int] ()
        
        var current = root
        
        if current == nil {
            return result
        }
        
        while current != nil {
            
            if current?.left == nil {
                result.append((current?.val)!)
                current = current?.right
            } else {
                
                var prev = current?.left
                
                while prev?.right != nil && (prev?.right)! !== current! {
                    prev = prev?.right
                }
                
                if prev?.right == nil {
                    prev?.right = current
                    current = current?.left
                } else {
                    prev?.right  = nil
                    result.append((current?.val)!)
                    current = current?.right
                }
                
            }
        }
        
        return result
    }
}
