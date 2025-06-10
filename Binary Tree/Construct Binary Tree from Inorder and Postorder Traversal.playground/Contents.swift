/// [Construct Binary Tree from Inorder and Postorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/)
///
/// Constructs a binary tree using inorder and postorder traversal arrays.
/// - Parameters:
///   - inorder: The inorder traversal of the tree.
///   - postorder: The postorder traversal of the tree.
/// - Returns: The root node of the constructed binary tree.
class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var inorderIndexMap = [Int: Int]()
        for (index, value) in inorder.enumerated() {
            inorderIndexMap[value] = index
        }

        return build(
            postorder, 0, postorder.count - 1,
            inorder, 0, inorder.count - 1,
            inorderIndexMap
        )
    }

    private func build(
        _ postorder: [Int], _ postStart: Int, _ postEnd: Int,
        _ inorder: [Int], _ inStart: Int, _ inEnd: Int,
        _ inorderIndexMap: [Int: Int]
    ) -> TreeNode? {
        if postStart > postEnd || inStart > inEnd {
            return nil
        }

        let rootVal = postorder[postEnd]
        let root = TreeNode(rootVal)

        guard let inRootIndex = inorderIndexMap[rootVal] else { return nil }
        let numsOnRight = inEnd - inRootIndex

        root.left = build(
            postorder, postStart, postEnd - numsOnRight - 1,
            inorder, inStart, inRootIndex - 1,
            inorderIndexMap
        )

        root.right = build(
            postorder, postEnd - numsOnRight, postEnd - 1,
            inorder, inRootIndex + 1, inEnd,
            inorderIndexMap
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
