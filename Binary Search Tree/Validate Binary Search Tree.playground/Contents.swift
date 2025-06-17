/// [Validate Binary Search Tree](https://leetcode.com/problems/validate-binary-search-tree/)
/// Determines whether a binary tree is a valid Binary Search Tree (BST).
/// - Parameter root: The root node of the binary tree.
/// - Returns: True if the tree is a valid BST, false otherwise.

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValid(root, minVal: Int.min, maxVal: Int.max)
    }

    private func isValid(_ node: TreeNode?, minVal: Int, maxVal: Int) -> Bool {
        guard let node = node else {
            return true
        }

        if node.val <= minVal || node.val >= maxVal {
            return false
        }

        return isValid(node.left, minVal: minVal, maxVal: node.val) &&
        isValid(node.right, minVal: node.val, maxVal: maxVal)
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
