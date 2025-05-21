/// [Binary Tree Preorder Traversal](https://leetcode.com/problems/binary-tree-preorder-traversal/)
/// Given the `root` of a binary tree, return the preorder traversal of its nodes' values.
/// This implementation uses recursion to follow the preorder pattern: Node -> Left -> Right.
/// - Parameter root: The root node of the binary tree.
/// - Returns: An array of integers representing the preorder traversal sequence.
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        var result: [Int] = []
        result.append(root!.val)
        result.append(contentsOf: preorderTraversal(root?.left))
        result.append(contentsOf: preorderTraversal(root?.right))
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
