/// [Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree)
/// Given the `root` of a binary tree, return its maximum depth.
/// The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: The maximum depth as an integer.
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let left = maxDepth(root?.left)
        let right = maxDepth(root?.right)

        return max(left, right) + 1
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
