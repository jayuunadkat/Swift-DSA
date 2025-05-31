/// [Binary Tree Maximum Path Sum](https://leetcode.com/problems/binary-tree-maximum-path-sum)
/// Given the `root` of a binary tree, return the maximum path sum.
/// A path is defined as any sequence of nodes from some starting node to any node in the tree
/// along the parent-child connections. The path must contain at least one node and does not need to go through the root.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: The maximum path sum among all paths in the tree.
class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        findMaxPathSum(root, &maxSum)
        return maxSum
    }

    private func findMaxPathSum(_ root: TreeNode?, _ maxSum: inout Int) -> Int {
        guard let node = root else { return 0 }

        var leftDepth = max(0, findMaxPathSum(root?.left, &maxSum))
        var rightDepth = max(0, findMaxPathSum(root?.right, &maxSum))
        maxSum = max(maxSum, leftDepth + rightDepth + (node.val))
        return max(leftDepth, rightDepth) + (node.val)
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
