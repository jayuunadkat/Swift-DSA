import Foundation

/// Reverses the words in a given string, removing extra spaces and ensuring a single space between words.
/// - Approach:
///   - First reverses the entire string.
///   - Then processes each word: moves characters to the correct position and reverses the word.
///   - Removes leading/trailing and extra spaces between words.
/// - Complexity:
///   - Time: O(n)
///   - Space: O(1) (in-place modification)
///
/// - Link: [LeetCode 151 - Reverse Words in a String](https://leetcode.com/problems/reverse-words-in-a-string/)
class Solution {
    func reverseWords(_ s: String) -> String {
        var chars = Array(s)
        chars.reverse()

        let n = chars.count
        var left = 0
        var right = 0
        var i = 0

        while i < n {
            /// Skip spaces
            while i < n && chars[i] == " " {
                i += 1
            }

            if i >= n { break }

            /// Start of word
            left = right

            // Copy word
            while i < n && chars[i] != " " {
                chars[right] = chars[i]
                right += 1
                i += 1
            }

            /// Reverse the word in place
            reverse(&chars, left, right - 1)

            /// Add space after the word
            if right < n {
                chars[right] = " "
                right += 1
            }

            left = right
        }

        /// Remove trailing space if present
        if right > 0 && chars[right - 1] == " " {
            right -= 1
        }

        return String(chars[0..<right])
    }

    /// Helper to reverse a portion of a character array in place
    private func reverse(_ chars: inout [Character], _ start: Int, _ end: Int) {
        var l = start
        var r = end
        while l < r {
            chars.swapAt(l, r)
            l += 1
            r -= 1
        }
    }
}

//Solution - 2
/**
 class Solution {
    func reverseWords(_ s: String) -> String {
        let str = s.trimmingCharacters(in: .whitespacesAndNewlines)
        return str.split(separator: " ").reversed().joined(separator: " ")
    }
}
*/
