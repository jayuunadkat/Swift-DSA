/// [Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst/)
/// Finds the kth smallest element in a Binary Search Tree.
/// - Parameters:
///   - root: The root of the BST.
///   - k: The rank of the smallest element to find.
/// - Returns: The value of the kth smallest node.

class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        var result: TreeNode? = nil
        inorder(root, k, &count, &result)
        return result?.val ?? -1
    }

    private func inorder(_ node: TreeNode?, _ k: Int, _ count: inout Int, _ result: inout TreeNode?) {
        guard let node = node, result == nil else { return }

        inorder(node.left, k, &count, &result)
        count += 1

        if count == k {
            result = node
            return
        }

        inorder(node.right, k, &count, &result)
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
