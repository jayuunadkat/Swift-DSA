/// [Binary Tree Postorder Traversal](https://leetcode.com/problems/binary-tree-postorder-traversal/)
/// Given the `root` of a binary tree, return the postorder traversal of its nodes' values.
/// This implementation uses recursion to follow the postorder pattern: Left -> Right -> Node.
/// - Parameter root: The root node of the binary tree.
/// - Returns: An array of integers representing the postorder traversal sequence.
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        var result: [Int] = []
        result.append(contentsOf: postorderTraversal(root?.left))
        result.append(contentsOf: postorderTraversal(root?.right))
        result.append(root!.val)
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
