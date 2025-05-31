/// [Same Tree](https://leetcode.com/problems/same-tree)
/// Given the roots of two binary trees `p` and `q`, write a function to check if they are the same or not.
/// Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
///
/// - Parameters:
///   - p: Root of the first binary tree.
///   - q: Root of the second binary tree.
/// - Returns: A boolean indicating whether the two trees are the same.

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil || q == nil {
            return p?.val == q?.val
        }

        return (p?.val == q?.val) &&
        isSameTree(p?.left, q?.left) &&
        isSameTree(p?.right, q?.right)
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
