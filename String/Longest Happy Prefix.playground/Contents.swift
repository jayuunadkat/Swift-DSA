/// [Longest Happy Prefix](https://leetcode.com/problems/longest-happy-prefix/description/)
///
/// Finds the longest prefix of the given string which is also a suffix, but not equal to the entire string itself.
/// This is essentially computing the LPS (Longest Prefix Suffix) array from the KMP algorithm.
///
/// - Parameter s: A string to analyze.
/// - Returns: The longest prefix which is also a suffix (excluding the full string itself).
class Solution {
    func longestPrefix(_ s: String) -> String {
        let lpsValue = findLPS(s)
        return String(s.prefix(lpsValue))
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
