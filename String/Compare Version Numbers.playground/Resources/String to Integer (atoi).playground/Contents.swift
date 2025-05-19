/// [String to Integer (atoi)](https://leetcode.com/problems/string-to-integer-atoi/description/)
///
/// Converts a string to a 32-bit signed integer according to the rules of the C/C++ `atoi` function.
/// Handles optional leading whitespaces, sign, leading zeros, and digits, clamping values to Int32 range.
///
/// - Parameter s: The input string potentially containing a number.
/// - Returns: The parsed integer clamped within the range [Int32.min, Int32.max].
class Solution {
    func myAtoi(_ s: String) -> Int {
        let chars = Array(s)
        let n = chars.count
        var i = 0

        // Skip leading whitespaces
        while i < n && chars[i] == " " {
            i += 1
        }

        // Handle optional sign
        var sign = 1
        if i < n {
            if chars[i] == "-" {
                sign = -1
                i += 1
            } else if chars[i] == "+" {
                i += 1
            }
        }

        // Skip leading zeros
        while i < n && chars[i] == "0" {
            i += 1
        }

        var result: Int64 = 0
        while i < n, let digit = chars[i].wholeNumberValue {
            result = result * 10 + Int64(digit)

            let signedResult = result * Int64(sign)
            if signedResult > Int64(Int32.max) {
                return Int(Int32.max)
            } else if signedResult < Int64(Int32.min) {
                return Int(Int32.min)
            }

            i += 1
        }

        return Int(result) * sign
    }
}
