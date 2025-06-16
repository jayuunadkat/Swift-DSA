/// [Delete Node in a BST](https://leetcode.com/problems/delete-node-in-a-bst/description/)
/// Deletes a node with a given key from a Binary Search Tree.
/// - Parameters:
///   - root: The root of the BST.
///   - key: The value to delete.
/// - Returns: The root node of the updated BST.

class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }

        if root.val == key {
            return helper(root)
        }

        var current: TreeNode? = root

        while let node = current {
            if key < node.val {
                if let left = node.left, left.val == key {
                    node.left = helper(left)
                    break
                } else {
                    current = node.left
                }
            } else {
                if let right = node.right, right.val == key {
                    node.right = helper(right)
                    break
                } else {
                    current = node.right
                }
            }
        }

        return root
    }

    private func helper(_ node: TreeNode) -> TreeNode? {
        if node.left == nil { return node.right }
        if node.right == nil { return node.left }

        let rightChild = node.right
        let mostRight = findMostRight(node.left)
        mostRight?.right = rightChild
        return node.left
    }

    private func findMostRight(_ node: TreeNode?) -> TreeNode? {
        var current = node
        while current?.right != nil {
            current = current?.right
        }
        return current
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
