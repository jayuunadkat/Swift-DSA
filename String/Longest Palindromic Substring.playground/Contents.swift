import Foundation

/// Finds the longest palindromic substring in the given string.
///
/// - Parameter s: The input string.
/// - Returns: The longest palindromic substring found in `s`.
///
/// - Link: [LeetCode 5 - Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let characters = Array(s)
        let n = characters.count
        var maxLength = 1
        var start = 0

        for i in 0..<n {
            var right = i

            // Expand the right pointer for consecutive duplicates
            while right < n && characters[right] == characters[i] {
                right += 1
            }

            var left = i - 1

            // Expand both left and right pointers outward while they match
            while left >= 0 && right < n && characters[left] == characters[right] {
                left -= 1
                right += 1
            }

            let currentLength = right - left - 1
            if currentLength > maxLength {
                maxLength = currentLength
                start = left + 1
            }
        }

        return String(characters[start..<start + maxLength])
    }
}

