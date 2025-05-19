/// [Integer to Roman](https://leetcode.com/problems/integer-to-roman/)
///
/// Converts an integer to its Roman numeral representation.
/// Iterates over a predefined mapping of Roman numerals to integer values,
/// subtracting values from the input number while appending corresponding Roman strings.
///
/// - Parameter num: An integer between 1 and 3999.
/// - Returns: A Roman numeral string that represents the given integer.
class Solution {
    func intToRoman(_ num: Int) -> String {
        var mutatingNum = num
        let integerMap: [(String, Int)] = [
            ("I", 1),
            ("IV", 4),
            ("V", 5),
            ("IX", 9),
            ("X", 10),
            ("XL", 40),
            ("L", 50),
            ("XC", 90),
            ("C", 100),
            ("CD", 400),
            ("D", 500),
            ("CM", 900),
            ("M", 1000)
        ]

        var result: String = ""
        for (roman, value) in integerMap.reversed() {
            while mutatingNum >= value {
                mutatingNum -= value
                result += roman
            }
        }

        return result
    }
}
