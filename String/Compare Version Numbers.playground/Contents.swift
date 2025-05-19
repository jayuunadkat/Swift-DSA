/// [Compare Version Numbers](https://leetcode.com/problems/compare-version-numbers/)
///
/// Compares two version strings `version1` and `version2`.
/// Versions are compared by their revision numbers split by dots. Trailing zeroes are treated as equal revisions (e.g., 1.0 == 1).
///
/// - Parameters:
///   - version1: A string representing the first version (e.g., "1.01").
///   - version2: A string representing the second version (e.g., "1.001").
/// - Returns: `-1` if `version1` < `version2`, `1` if `version1` > `version2`, `0` if they are equal.
func compareVersion(_ version1: String, _ version2: String) -> Int {
    var arrVersion1 = version1.components(separatedBy: ".")
    var arrVersion2 = version2.components(separatedBy: ".")

    while arrVersion1.count != arrVersion2.count {
        if arrVersion1.count < arrVersion2.count {
            arrVersion1.append("0")
        } else {
            arrVersion2.append("0")
        }
    }

    var i: Int = 0
    let n: Int = arrVersion1.count

    while i < n {
        let v1 = Int(arrVersion1[i]) ?? 0
        let v2 = Int(arrVersion2[i]) ?? 0
        if v1 < v2 {
            return -1
        } else if v1 > v2 {
            return 1
        }
        i += 1
    }

    return 0
}


