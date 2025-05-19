/// [13. Roman to Integer](https://leetcode.com/problems/roman-to-integer/)
///
/// Converts a Roman numeral string to its corresponding integer value.
///
/// This method processes a Roman numeral string by checking if each numeral
/// should be added or subtracted based on the value of the numeral that follows it.
///
/// Example:
/// ```swift
/// romanToInt("MCMXCIV") // Returns 1994
/// ```
///
/// - Parameter s: A string representing a Roman numeral (e.g., "IX", "LVIII").
/// - Returns: The integer value corresponding to the Roman numeral.
class Solution {
    func romanToInt(_ s: String) -> Int {
        let roman: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]

        let characters = Array(s)
        let n = characters.count
        var ans = 0

        for i in 0..<n-1 {
            if roman[characters[i]]! < roman[characters[i + 1]]! {
                ans -= roman[characters[i]]!
            } else {
                ans += roman[characters[i]]!
            }
        }

        ans += roman[characters[n - 1]]!
        return ans
    }
}
