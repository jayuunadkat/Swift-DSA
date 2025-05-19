/// https://leetcode.com/problems/rotate-string/
///
/// Time Complexity: O(n)
/// Space Complexity: O(n)
///
/// A string s can be rotated to become goal if and only if goal is a substring of s + s.
/// First, we check if their lengths are equal, then use `.contains()` to determine rotation.
///

class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        if s.count != goal.count { return false }
        return (s + s).contains(goal)
    }
}
