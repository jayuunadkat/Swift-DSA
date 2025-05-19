/// [Shortest Palindrome](https://leetcode.com/problems/shortest-palindrome/description/)
///
/// Returns the shortest palindrome that can be formed by adding characters in front of the given string.
///
/// The solution uses the KMP (Knuth–Morris–Pratt) preprocessing to find the longest palindromic prefix
/// by analyzing the combined string `s + "#" + reversed(s)`. The LPS (Longest Prefix Suffix) array helps
/// determine the largest prefix of `s` which is also a suffix in the reversed string, indicating the
/// largest palindromic prefix.
///
/// - Parameter s: The input string.
/// - Returns: The shortest palindrome string formed by adding characters in front of `s`.
class Solution {
    func shortestPalindrome(_ s: String) -> String {
        let reversed = String(s.reversed())
        let combined = s + "#" + reversed
        let prefixLength = findLPS(combined)

        let suffixToAdd = reversed.prefix(s.count - prefixLength)
        return String(suffixToAdd) + s
    }

    private func findLPS(_ str: String) -> Int {
        let chars = Array(str)
        let n = chars.count
        var lps = [Int](repeating: 0, count: n)

        var length = 0
        var i = 1

        while i < n {
            if chars[i] == chars[length] {
                length += 1
                lps[i] = length
                i += 1
            } else {
                if length != 0 {
                    length = lps[length - 1]
                } else {
                    lps[i] = 0
                    i += 1
                }
            }
        }

        return lps[n - 1]
    }
}
