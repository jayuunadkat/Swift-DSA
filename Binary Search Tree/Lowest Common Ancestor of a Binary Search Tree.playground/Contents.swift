/// [Lowest Common Ancestor of a Binary Search Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/)
/// Finds the lowest common ancestor (LCA) of two nodes in a Binary Search Tree.
/// - Parameters:
///   - root: The root of the BST.
///   - p: The first target node.
///   - q: The second target node.
/// - Returns: The LCA node of `p` and `q`.

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }

        if p.val < root.val && q.val < root.val {
            return lowestCommonAncestor(root.left, p, q)
        }

        if p.val > root.val && q.val > root.val {
            return lowestCommonAncestor(root.right, p, q)
        }

        return root
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
