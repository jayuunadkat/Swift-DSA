/// Finds the largest-valued odd number that is a non-empty prefix of the input string.
/// - Parameter num: A numeric string consisting of digits only.
/// - Returns: The longest prefix of `num` that forms an odd number. If no such prefix exists, returns an empty string.
/// - Link: [LeetCode 1903 - Largest Odd Number in String](https://leetcode.com/problems/largest-odd-number-in-string/)

class Solution {
    func largestOddNumber(_ num: String) -> String {
        if let idx = num.lastIndex(where: {
            switch $0 {
            case "1", "3", "5", "7", "9":
                return true
            default:
                return false
            }
        }) {
            return String(num.prefix(through: idx))
        } else {
            return ""
        }
    }
}
