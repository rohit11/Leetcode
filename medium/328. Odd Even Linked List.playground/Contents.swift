/*
 Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.
 
 You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.
 
 Example 1:
 
 Input: 1->2->3->4->5->NULL
 Output: 1->3->5->2->4->NULL
 Example 2:
 
 Input: 2->1->3->5->6->4->7->NULL
 Output: 2->3->6->7->1->5->4->NULL
 Note:
 
 The relative order inside both the even and odd groups should remain as it was in the input.
 The first node is considered odd, the second node even and so on ...
 */

/*
 
 Steps
 1. check head is nil or head.next is nil if yes then return head
 2. create oddhead = head even = head.next and evenHead = even
 3. while even !=nil && even.next != nil then
 4. oddHead.next = even.next , oddhead = oddhead.next even.next = oddHead.next even = even.next
 5. oddHead.next = evenHead.next
 6. return head
 */


public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        
        guard head != nil  && head?.next != nil else {
            return head
        }
        
        var oddHead = head
        var even = head?.next
        let evenHead = even
        
        while even != nil && even?.next != nil {
            
            oddHead?.next = even?.next
            oddHead = oddHead?.next
            even?.next = oddHead?.next
            even = even?.next
        }
        
        oddHead?.next = evenHead
        return head
    }
}


