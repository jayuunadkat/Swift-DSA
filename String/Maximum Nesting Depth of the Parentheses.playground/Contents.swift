/**
 * Problem: Maximum Nesting Depth of the Parentheses
 * Link: https://leetcode.com/problems/maximum-nesting-depth-of-the-parentheses/
 * Difficulty: Easy
 * Topics: String, Stack
 *
 * Approach:
 * Iterate through the string and track the current depth of parentheses using a counter.
 * Increase the counter when encountering '(', and decrease it at ')'.
 * Update the result with the maximum depth encountered during traversal.
 */

class Solution {
    func maxDepth(_ s: String) -> Int {
        var result = 0
        var count = 0

        for ch in s {
            if ch == "(" {
                count += 1
                result = max(result, count)
            } else if ch == ")" {
                count -= 1
            }
        }

        return result
    }
}
