
//https://leetcode.com/problems/binary-tree-level-order-traversal/

/*
 
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
 
 3
 / \
 9  20
 /  \
 15   7
 return its level order traversal as:
 
 [
 [3],
 [9,20],
 [15,7]
 ]
 
 */


/**
 
 Steps : 1. create result and queue which store Int TreeNode
 2. if root then append into queue
 3. while queue.count > 0 then
 4. get size of queue and create Level which Int array node value element
 5. run forloop till size from 1 as root aleady added
 6. get node from queue from 0 element and remove node from zero index
 7. append into level array with node val
 8. check left node then add into queue
 9. check right node then add into queue
 10. once size reach then append level into result
 11. return return result
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        var result = [[Int]]()
        var queue = [TreeNode]()
        
        if let root = root {
            queue.append(root)
        }
        
        while queue.count > 0 {
            
            let size = queue.count
            var level = [Int]()
            
            for _ in 1...size {
                
                let node = queue[0]
                queue.remove(at: 0)
                
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            result.append(level)
        }
        
        return result
    }
}
