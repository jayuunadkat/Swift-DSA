/// [Binary Tree Preorder Traversal](https://leetcode.com/problems/binary-tree-preorder-traversal/)
/// Preorder traversal of a binary tree using Morris Traversal (no recursion or stack).
/// - Parameter root: The root of the binary tree.
/// - Returns: An array of node values in preorder sequence.
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var curr = root
        var preorder: [Int] = []

        while curr != nil {
            if curr!.left == nil {
                preorder.append(curr!.val)
                curr = curr!.right
            } else {
                var pre = curr!.left
                while pre!.right != nil && pre!.right !== curr {
                    pre = pre!.right
                }

                if pre!.right == nil {
                    pre!.right = curr
                    preorder.append(curr!.val)
                    curr = curr!.left
                } else {
                    pre!.right = nil
                    curr = curr!.right
                }
            }
        }

        return preorder
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
