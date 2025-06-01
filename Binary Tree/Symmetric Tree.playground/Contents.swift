/// [Symmetric Tree](https://leetcode.com/problems/symmetric-tree)
/// Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).
///
/// - Parameter root: The root of the binary tree.
/// - Returns: A boolean indicating whether the tree is symmetric.
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return checkIfSymetric(root.left, root.right)
    }

    func checkIfSymetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil || right == nil {
            return left == nil && right == nil
        }

        if left!.val != right!.val {
            return false
        }

        return checkIfSymetric(left?.left, right?.right) && checkIfSymetric(left?.right, right?.left)
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
