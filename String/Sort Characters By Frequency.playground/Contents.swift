/**
 * Problem: Sort Characters By Frequency
 * Link: https://leetcode.com/problems/sort-characters-by-frequency/
 * Difficulty: Medium
 *
 * Approach:
 * 1. Count frequency of each character using a dictionary.
 * 2. Sort the characters by frequency in descending order.
 * 3. Build the result string by repeating each character based on its frequency.
 *
 * Time Complexity: O(n log n), due to sorting.
 * Space Complexity: O(n), for storing frequencies and the result.
 */

class Solution {
    func frequencySort(_ s: String) -> String {
        var freqMap: [Character: Int] = [:]

        for ch in s {
            freqMap[ch, default: 0] += 1
        }

        let sorted = freqMap.sorted { $0.value > $1.value }

        var result = ""
        for (ch, count) in sorted {
            result += String(repeating: ch, count: count)
        }

        return result
    }
}
