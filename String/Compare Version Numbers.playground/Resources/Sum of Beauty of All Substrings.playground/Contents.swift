/// [Sum of Beauty of All Substrings](https://leetcode.com/problems/sum-of-beauty-of-all-substrings/)
///
/// Calculates the total beauty of all substrings in a given string.
/// The beauty of a substring is defined as the difference between the highest and lowest frequency of characters present in that substring.
///
/// - Parameter s: The input string.
/// - Returns: The total beauty sum of all possible substrings.
class Solution {
    func beautySum(_ s: String) -> Int {
        var result = 0
        let chars = Array(s)
        let n = chars.count

        for i in 0..<n {
            var freq = [Character: Int]()
            for j in i..<n {
                freq[chars[j], default: 0] += 1
                result += getBeautyNumber(freq)
            }
        }

        return result
    }

    private func getBeautyNumber(_ freq: [Character: Int]) -> Int {
        let counts = freq.values
        guard let maxCount = counts.max(), let minCount = counts.min() else {
            return 0
        }
        return maxCount - minCount
    }
}
