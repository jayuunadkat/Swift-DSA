/// [Construct Binary Tree from Preorder and Inorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/)
///
/// Constructs a binary tree from preorder and inorder traversal arrays.
/// - Parameters:
///   - preorder: The preorder traversal of the tree.
///   - inorder: The inorder traversal of the tree.
/// - Returns: The root node of the constructed binary tree.
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inOrderIndexMap = [Int: Int]()
        for (index, value) in inorder.enumerated() {
            inOrderIndexMap[value] = index
        }

        return build(preorder, 0, preorder.count - 1,
            inorder, 0, inorder.count - 1,
            inOrderIndexMap
        )
    }

    private func build(
        _ preorder: [Int], _ preStart: Int, _ preEnd: Int,
        _ inorder: [Int], _ inStart: Int, _ inEnd: Int,
        _ inOrderIndexMap: [Int: Int]
    ) -> TreeNode? {
        if preStart > preEnd || inStart > inEnd {
            return nil
        }

        let rootVal = preorder[preStart]
        let root = TreeNode(rootVal)

        guard let inRootIndex = inOrderIndexMap[rootVal] else { return nil }
        let numsLeft = inRootIndex - inStart

        root.left = build(
            preorder, preStart + 1, preStart + numsLeft,
            inorder, inStart, inRootIndex - 1,
            inOrderIndexMap
        )

        root.right = build(
            preorder, preStart + numsLeft + 1, preEnd,
            inorder, inRootIndex + 1, inEnd,
            inOrderIndexMap
        )

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
