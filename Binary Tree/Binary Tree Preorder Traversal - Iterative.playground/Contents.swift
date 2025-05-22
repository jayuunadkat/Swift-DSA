/// [Binary Tree Preorder Traversal](https://leetcode.com/problems/binary-tree-preorder-traversal/)
/// Returns the preorder traversal of a binary tree's node values using an iterative approach.
/// Preorder traversal visits the current node before its child nodes: root → left → right.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: An array of integers representing the preorder traversal.
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        var stack: [TreeNode] = []
        var ans: [Int] = []

        stack.append(root!)

        while !stack.isEmpty {
            let node = stack.removeLast()
            ans.append(node.val)

            if let right = node.right {
                stack.append(right)
            }
            if let left = node.left {
                stack.append(left)
            }
        }

        return ans
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
