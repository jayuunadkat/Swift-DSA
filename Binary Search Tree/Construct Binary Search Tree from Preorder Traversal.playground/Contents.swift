/// [Construct Binary Search Tree from Preorder Traversal](https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/)
/// Constructs a BST from its preorder traversal.
/// - Parameter preorder: The preorder traversal of the BST.
/// - Returns: The root node of the constructed BST.

class Solution {
    private var index = 0

    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        index = 0
        return buildTree(preorder, Int.max)
    }

    private func buildTree(_ preorder: [Int], _ upperBound: Int) -> TreeNode? {
        if index >= preorder.count || preorder[index] > upperBound {
            return nil
        }

        let root = TreeNode(preorder[index])
        index += 1
        root.left = buildTree(preorder, root.val)
        root.right = buildTree(preorder, upperBound)

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
