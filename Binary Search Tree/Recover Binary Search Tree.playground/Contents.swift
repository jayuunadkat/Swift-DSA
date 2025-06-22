/// [Recover Binary Search Tree](https://leetcode.com/problems/recover-binary-search-tree/)
/// Recovers a BST where two nodes are swapped by mistake using Morris Inorder Traversal.
/// - Time: O(n)
/// - Space: O(1)
class Solution {
    private var first: TreeNode?
    private var middle: TreeNode?
    private var last: TreeNode?
    private var prev: TreeNode?

    func recoverTree(_ root: TreeNode?) {
        first = nil
        middle = nil
        last = nil
        prev = TreeNode(Int.min)

        inorder(root)

        if let first = first, let last = last {
            swap(&first.val, &last.val)
        } else if let first = first, let middle = middle {
            swap(&first.val, &middle.val)
        }
    }

    private func inorder(_ root: TreeNode?) {
        guard let root = root else { return }

        inorder(root.left)

        if let prev = prev, let current = root as TreeNode?, current.val < prev.val {
            if first == nil {
                first = prev
                middle = current
            } else {
                last = current
            }
        }

        prev = root
        inorder(root.right)
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
