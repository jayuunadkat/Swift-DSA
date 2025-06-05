/// [Maximum Width of Binary Tree](https://leetcode.com/problems/maximum-width-of-binary-tree/)
/// Calculates the maximum width of a binary tree where the width is the length between the leftmost and rightmost non-null nodes at any level.
/// - Parameter root: The root of the binary tree.
/// - Returns: The maximum width of the binary tree.
class Solution {
    typealias LevelEntry = (node: TreeNode, index: Int)

    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var maxWidth = 0
        var queue: [LevelEntry] = [(root, 0)]

        while !queue.isEmpty {
            let levelSize = queue.count
            let levelStartIndex = queue.first!.index
            var first = 0, last = 0

            for i in 0..<levelSize {
                let (node, index) = queue.removeFirst()
                let normalizedIndex = index - levelStartIndex

                if i == 0 { first = normalizedIndex }
                if i == levelSize - 1 { last = normalizedIndex }

                if let left = node.left {
                    queue.append((left, 2 * normalizedIndex + 1))
                }
                if let right = node.right {
                    queue.append((right, 2 * normalizedIndex + 2))
                }
            }

            maxWidth = max(maxWidth, last - first + 1)
        }

        return maxWidth
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
