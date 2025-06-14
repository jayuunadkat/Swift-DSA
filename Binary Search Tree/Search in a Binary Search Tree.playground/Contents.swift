/// [Search in a Binary Search Tree](https://leetcode.com/problems/search-in-a-binary-search-tree/)
/// Searches for a node with a given value in a Binary Search Tree.
/// - Parameters:
///   - root: The root of the BST.
///   - val: The value to search for.
/// - Returns: The TreeNode containing the given value, or nil if not found.

class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var node = root

        while let current = node, current.val != val {
            node = val < current.val ? current.left : current.right
        }

        return node
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
