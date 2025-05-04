/// https://leetcode.com/problems/isomorphic-strings/
///
/// Time Complexity: O(n)
/// Space Complexity: O(n)
///
/// Given two strings s and t, determine if they are isomorphic.
/// Two strings s and t are isomorphic if the characters in s can be replaced to get t.
///

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var map: [Character: Character] = [:]
        var used: Set<Character> = []

        let sArray = Array(s)
        let tArray = Array(t)

        for i in 0..<sArray.count {
            let sc = sArray[i]
            let tc = tArray[i]

            if let mapped = map[sc] {
                if mapped != tc {
                    return false
                }
            } else {
                if used.contains(tc) {
                    return false
                }
                map[sc] = tc
                used.insert(tc)
            }
        }

        return true
    }
}

/*
 /// Time Complexity: O(n)
 /// Space Complexity: O(1) — since the mapping involves only constant-sized character sets

//Solution 1:
extension StringProtocol {
    subscript(_ offset: Int) -> Element {
        self[index(startIndex, offsetBy: offset)]
    }

    subscript(_ range: Range<Int>) -> SubSequence {
        prefix(range.lowerBound + range.count).suffix(range.count)
    }

    subscript(_ range: ClosedRange<Int>) -> SubSequence {
        prefix(range.lowerBound + range.count).suffix(range.count)
    }
}

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var charMap = [Character: Character]()    // Maps from s -> t
        var valueMap = Set<Character>()           // Tracks already used characters in t

        for i in 0..<s.count {
            let key = s[i]
            let value = t[i]

            if let mappedChar = charMap[key] {
                if mappedChar != value {
                    return false
                }
            } else {
                if valueMap.contains(value) {
                    return false
                }
                charMap[key] = value
                valueMap.insert(value)
            }
        }

        return true
    }
}

*/
