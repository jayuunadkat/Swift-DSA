/// [Insert into a Binary Search Tree](https://leetcode.com/problems/insert-into-a-binary-search-tree/description/)
/// Inserts a new value into the Binary Search Tree while maintaining BST properties.
/// - Parameters:
///   - root: The root of the BST.
///   - val: The value to insert.
/// - Returns: The root node of the updated BST.

class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return TreeNode(val)
        }

        var current: TreeNode? = root
        while let node = current {
            if val < node.val {
                if node.left == nil {
                    node.left = TreeNode(val)
                    break
                } else {
                    current = node.left
                }
            } else {
                if node.right == nil {
                    node.right = TreeNode(val)
                    break
                } else {
                    current = node.right
                }
            }
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
