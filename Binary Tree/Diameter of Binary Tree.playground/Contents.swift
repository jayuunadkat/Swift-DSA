/// [Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree)
/// Given the `root` of a binary tree, return the length of the diameter of the tree.
/// The diameter is the length of the longest path between any two nodes in a tree.
/// This path may or may not pass through the root.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: The diameter as an integer (number of edges).
class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var maxDiameter = 0
        dfs(root, &maxDiameter)
        return maxDiameter
    }

    private func dfs(_ root: TreeNode?, _ maxDiameter: inout Int) -> Int {
        if root == nil {
            return 0
        }

        var leftDepth = dfs(root?.left, &maxDiameter)
        var rightDepth = dfs(root?.right, &maxDiameter)

        maxDiameter = max(maxDiameter, leftDepth + rightDepth)

        return max(leftDepth, rightDepth) + 1
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
