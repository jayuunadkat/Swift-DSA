/// [Count Complete Tree Nodes](https://leetcode.com/problems/count-complete-tree-nodes/)
/// Returns the number of nodes in a complete binary tree using optimized height comparison.
/// - Parameter root: The root node of the complete binary tree.
/// - Returns: The total count of nodes in the tree.
class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let leftHeight = findLeftHeight(root)
        let rightHeight = findRightHeight(root)

        if leftHeight == rightHeight {
            return (1 << leftHeight) - 1
        }

        return 1 + countNodes(root.left) + countNodes(root.right)
    }

    private func findLeftHeight(_ root: TreeNode?) -> Int {
        var height = 0
        var node = root
        while node != nil {
            height += 1
            node = node?.left
        }
        return height
    }

    private func findRightHeight(_ root: TreeNode?) -> Int {
        var height = 0
        var node = root
        while node != nil {
            height += 1
            node = node?.right
        }
        return height
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
