/// [Minimum Add to Make Parentheses Valid](https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/)
///
/// Given a string `s` of `'('` and `')'` parentheses, this function returns the minimum number of parentheses
/// that must be added to make the string valid.
///
/// A valid parentheses string is one where each opening parenthesis `'('` has a corresponding closing parenthesis `')'`.
///
/// - Parameter s: A string consisting of only `'('` and `')'`.
/// - Returns: The minimum number of parentheses needed to make the string valid.
class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        var open = 0
        var close = 0

        for ch in s {
            if ch == "(" {
                open += 1
            } else {
                if open > 0 {
                    open -= 1
                } else {
                    close += 1
                }
            }
        }

        return open + close
    }
}
