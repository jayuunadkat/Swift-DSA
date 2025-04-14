import Foundation

/// Converts a Roman numeral string to its integer equivalent.
///
/// - Approach:
///   - Create a lookup dictionary for Roman symbol values.
///   - Traverse the string from left to right.
///   - If a character's value is less than the next, subtract it (e.g., IV = 4).
///   - Otherwise, add it to the result.
///
/// - Complexity:
///   - Time: O(n), where `n` is the length of the Roman string.
///   - Space: O(1), constant space for the lookup table.
///
/// - Link: [LeetCode 13 - Roman to Integer](https://leetcode.com/problems/roman-to-integer/)
class Solution {
    func romanToInt(_ s: String) -> Int {
        let roman: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        let chars = Array(s)
        var result = 0

        for i in 0..<chars.count - 1 {
            if roman[chars[i]]! < roman[chars[i + 1]]! {
                result -= roman[chars[i]]!
            } else {
                result += roman[chars[i]]!
            }
        }

        result += roman[chars.last!]!
        return result
    }
}
