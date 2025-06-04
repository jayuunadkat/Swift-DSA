/// [Lowest Common Ancestor of a Binary Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/)
/// Finds the lowest common ancestor (LCA) of two nodes in a binary tree.
/// - Parameters:
///   - root: The root of the binary tree.
///   - p: One of the target nodes.
///   - q: The other target node.
/// - Returns: The lowest common ancestor node of `p` and `q`.
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || root === p || root === q {
            return root
        }

        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)

        if left == nil {
            return right
        } else if right == nil {
            return left
        } else {
            return root
        }
    }

    /*
     // Solution 2: Path generation approach
     // 1. Find path from root to p and q.
     // 2. Compare both paths to find the last common node.

     func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
     var pathP: [TreeNode] = []
     var pathQ: [TreeNode] = []

     func findPath(_ node: TreeNode?, _ target: TreeNode?, _ path: inout [TreeNode]) -> Bool {
     guard let node = node else { return false }
     path.append(node)

     if node === target {
     return true
     }

     if findPath(node.left, target, &path) || findPath(node.right, target, &path) {
     return true
     }

     path.removeLast()
     return false
     }

     guard findPath(root, p, &pathP), findPath(root, q, &pathQ) else {
     return nil
     }

     var i = 0
     while i < pathP.count && i < pathQ.count && pathP[i] === pathQ[i] {
     i += 1
     }

     return pathP[i - 1]
     }
     */
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
