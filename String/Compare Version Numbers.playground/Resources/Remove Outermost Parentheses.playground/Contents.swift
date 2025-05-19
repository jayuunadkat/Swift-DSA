/// Removes the outermost parentheses of every primitive valid parentheses string in the input.
///
/// A primitive valid parentheses string cannot be split into two non-empty valid parentheses strings.
///
/// - Parameter s: A valid parentheses string.
/// - Returns: The string after removing the outermost parentheses of each primitive part.
///
/// - Link: [LeetCode 1021 - Remove Outermost Parentheses](https://leetcode.com/problems/remove-outermost-parentheses/)
class Solution {
    func removeOuterParentheses(_ s: String) -> String {
        var result = ""
        var count = 0

        for char in s {
            if char == "(" {
                if count > 0 {
                    result.append(char)
                }
                count += 1
            } else if char == ")" {
                count -= 1
                if count > 0 {
                    result.append(char)
                }
            }
        }

        return result
    }
}
