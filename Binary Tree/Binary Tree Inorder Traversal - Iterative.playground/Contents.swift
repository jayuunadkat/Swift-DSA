/// [Binary Tree Inorder Traversal](https://leetcode.com/problems/binary-tree-inorder-traversal)
/// Given the `root` of a binary tree, return the inorder traversal of its nodes' values.
///
/// Inorder traversal order: Left -> Node -> Right
///
/// - Parameter root: The root of the binary tree.
/// - Returns: An array of integers representing the inorder traversal.
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        var stack: [TreeNode] = []
        var ans: [Int] = []
        var node: TreeNode? = root
        node = root
        while(true) {
            if node != nil {
                stack.append(node!)
                node = node?.left
            } else {
                if stack.isEmpty { break }

                let top = stack.last!
                stack.removeLast()
                ans.append(top.val)
                node = top.right
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
