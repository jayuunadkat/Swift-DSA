/// Finds the longest common prefix string among an array of strings.
/// - Parameter strs: An array of strings.
/// - Returns: The longest common prefix shared by all strings. If there is none, returns an empty string.
/// - Link: [LeetCode 14 - Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)
///  - (1 <= strs.length <= 200)

extension StringProtocol {
    subscript(_ offset: Int) -> Element {
        self[index(startIndex, offsetBy: offset)]
    }

    subscript(_ range: Range<Int>) -> SubSequence {
        prefix(range.lowerBound+range.count).suffix(range.count)
    }

    subscript(_ range: ClosedRange<Int>) -> SubSequence {
        prefix(range.lowerBound+range.count).suffix(range.count)
    }
}

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var mutatingStrs = strs.sorted(by: {$0 < $1})

        var index = 0

        while index < mutatingStrs.first!.count && index < mutatingStrs.last!.count && mutatingStrs.first![index] == mutatingStrs.last![index] {
            index += 1
        }

        return String(mutatingStrs.first!.prefix(index))
    }
}
