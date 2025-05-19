/// [Repeated String Match](https://leetcode.com/problems/repeated-string-match/)
///
/// Given two strings `a` and `b`, this function finds the minimum number of times `a` needs
/// to be repeated such that `b` is a substring of the repeated string. If it is not possible,
/// it returns -1.
///
/// The approach is to keep repeating `a` until the repeated string’s length is at least equal to `b`.
/// Then, check once more after an additional repetition to account for any overlaps.
///
/// - Parameters:
///   - a: The base string to be repeated.
///   - b: The target string to be a substring of the repeated base string.
/// - Returns: The minimum number of repetitions required, or -1 if `b` cannot be a substring.
class Solution {
    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
        var repeated = a
        var count = 1

        while repeated.count < b.count {
            repeated += a
            count += 1
        }

        if repeated.contains(b) {
            return count
        }

        repeated += a
        if repeated.contains(b) {
            return count + 1
        }

        return -1
    }
}
