/// [Binary Tree Inorder Traversal](https://leetcode.com/problems/binary-tree-inorder-traversal/)
/// Given the `root` of a binary tree, return the inorder traversal of its nodes' values.
/// This implementation uses recursion to achieve an in-order (Left -> Node -> Right) traversal.
/// - Parameter root: The root node of the binary tree.
/// - Returns: An array of integers representing the inorder traversal sequence.
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        var result: [Int] = []
        result.append(contentsOf: inorderTraversal(root?.left))
        result.append(root!.val)
        result.append(contentsOf: inorderTraversal(root?.right))
        return result
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
