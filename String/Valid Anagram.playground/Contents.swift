/**
 * Problem: Valid Anagram
 * Link: https://leetcode.com/problems/valid-anagram/
 * Difficulty: Easy
 * Topics: Hash Table, Sorting
 * Companies: Google, Amazon, Microsoft, Apple
 *
 * Approach:
 * The approach involves counting the frequency of characters in both strings using an array.
 * If the frequency counts match for every character, the strings are anagrams; otherwise, they are not.
 * Alternatively, we can also use sorting to compare the two strings.
 *
 * Time Complexity: O(n), where n is the length of the string.
 * Space Complexity: O(1), since we are only using an array of size 26 to count characters.
 */

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }

        var arr = [Int](repeating: 0, count: 26)

        for c in s {
            arr[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
        }

        for c in t {
            arr[Int(c.asciiValue! - Character("a").asciiValue!)] -= 1
        }

        for num in arr {
            if num != 0 { return false }
        }

        return true
    }
}

/**
 // Solution - 2
 *
 * class Solution {
 *     func isAnagram(_ s: String, _ t: String) -> Bool {
 *         let sSorted = String(s.sorted())
 *         let tSorted = String(t.sorted())
 *
 *         return sSorted == tSorted
 *     }
 * }
*/
