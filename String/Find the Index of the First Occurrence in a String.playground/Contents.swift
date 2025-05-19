/// [Find the Index of the First Occurrence in a String](https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/)
///
/// Returns the index of the first occurrence of `needle` in `haystack`, or -1 if `needle` is not part of `haystack`.
///
/// This implementation manually checks each window of `haystack` for equality with `needle`.
/// It converts both strings to character arrays to access individual characters by index.
///
/// - Parameters:
///   - haystack: The main string to be searched.
///   - needle: The substring to find within the `haystack`.
/// - Returns: The index of the first occurrence of `needle`, or -1 if not found.
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let haystackCount = haystack.count
        let needleCount = needle.count

        if needleCount == 0 { return 0 }
        if haystackCount < needleCount { return -1 }

        let haystackArray = Array(haystack)
        let needleArray = Array(needle)

        for i in 0...(haystackCount - needleCount) {
            let window = haystackArray[i..<i + needleCount]
            if Array(window) == needleArray {
                return i
            }
        }

        return -1
    }
}
