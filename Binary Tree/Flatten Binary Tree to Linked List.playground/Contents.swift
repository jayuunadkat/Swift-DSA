/// [Flatten Binary Tree to Linked List](https://leetcode.com/problems/flatten-binary-tree-to-linked-list/)
/// Converts a binary tree into a right-skewed "linked list" using preorder traversal order.
/// - Two solutions provided: Iterative (Morris-style) and Recursive (Reverse Postorder).
/// - Parameters:
///   - root: The root node of the binary tree.

/// Solution 1: Iterative (Morris-style traversal)
class Solution {
    func flatten(_ root: TreeNode?) {
        var curr = root

        while let current = curr {
            if let left = current.left {
                var prev = left
                while let right = prev.right {
                    prev = right
                }

                prev.right = current.right
                current.right = current.left
                current.left = nil
            }
            curr = current.right
        }
    }
}

/// Solution 2: Recursive (Reverse Postorder traversal)
class SolutionRecursive {
    func flatten(_ root: TreeNode?) {
        var prev: TreeNode? = nil
        flattenTree(root, &prev)
    }

    private func flattenTree(_ node: TreeNode?, _ prev: inout TreeNode?) {
        guard let node = node else { return }

        flattenTree(node.right, &prev)
        flattenTree(node.left, &prev)

        node.right = prev
        node.left = nil
        prev = node
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
