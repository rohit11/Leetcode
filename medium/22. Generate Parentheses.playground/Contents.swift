import UIKit

/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 
 */

/*
 nstead of adding '(' or ')' every time as in Approach 1, let's only add them when we know it will remain a valid sequence. We can do this by keeping track of the number of opening and closing brackets we have placed so far.
 
 We can start an opening bracket if we still have one (of n) left to place. And we can start a closing bracket if it would not exceed the number of opening brackets.
 
 */

// Steps
// 1. create func accept str, number of element n , open 0 and close as 0
// 2. if both open and close zero then append into result and return
// 3. if open < n then append '(' and open + 1 and call resursive func
// 4. if close < open then append ')' and close + 1  and call resursive func


class Solution {
    
    func helper(arr: inout [String], current: String, n: Int, open: Int, close : Int) {
        if current.count == n * 2  {
            arr.append(current)
            return
        }
        if open < n {
            helper(arr: &arr, current: str + "(", n : n,open: open + 1, close : close)

        }
        if close > open {
            helper(arr: &arr, current: str + ")", n : n,open: open, close : close + 1)
        }
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        var arr: [String] = []
        helper(arr: &arr, current: "", n: n, open: 0, close : 0)
        return arr
    }
}
