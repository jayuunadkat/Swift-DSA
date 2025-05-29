/// [Balanced Binary Tree](https://leetcode.com/problems/balanced-binary-tree)
/// Given a binary tree, determine if it is height-balanced.
/// A binary tree is height-balanced if the depths of the two subtrees of every node never differ by more than one.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: A boolean indicating whether the tree is height-balanced.
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return findBalancedHeight(root) != -1
    }

    private func findBalancedHeight(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        var leftHeight = findBalancedHeight(root?.left)
        var rightHeight = findBalancedHeight(root?.right)

        if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 {
            return -1
        }

        return max(leftHeight, rightHeight) + 1
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
