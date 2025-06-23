/// [Largest BST](https://www.geeksforgeeks.org/problems/largest-bst/1)
/// Finds the size of the largest BST subtree within a binary tree.
/// - Returns: The size of the largest BST.
/// - Complexity: O(n) time, O(n) space (due to recursion stack)
class Solution {
    class NodeValue {
        var minNode: Int
        var maxNode: Int
        var maxSize: Int

        init(_ minNode: Int, _ maxNode: Int, _ maxSize: Int) {
            self.minNode = minNode
            self.maxNode = maxNode
            self.maxSize = maxSize
        }
    }

    func largestBst(_ root: TreeNode?) -> Int {
        return findLargestBST(root).maxSize
    }

    private func findLargestBST(_ root: TreeNode?) -> NodeValue {
        guard let root = root else {
            return NodeValue(Int.max, Int.min, 0)
        }

        let left = findLargestBST(root.left)
        let right = findLargestBST(root.right)

        if left.maxNode < root.val && root.val < right.minNode {
            return NodeValue(
                min(left.minNode, root.val),
                max(right.maxNode, root.val),
                left.maxSize + right.maxSize + 1
            )
        }

        return NodeValue(Int.min, Int.max, max(left.maxSize, right.maxSize))
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
