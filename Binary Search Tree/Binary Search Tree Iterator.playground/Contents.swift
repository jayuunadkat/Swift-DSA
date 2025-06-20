/// [Binary Search Tree Iterator](https://leetcode.com/problems/binary-search-tree-iterator/)
/// Implements an iterator over a binary search tree (BST).
/// - Provides `next()` and `hasNext()` in average O(1) time using stack-based inorder traversal.
class BSTIterator {
    private var stack: [TreeNode] = []

    init(_ root: TreeNode?) {
        pushAll(root)
    }

    func next() -> Int {
        let topNode = stack.removeLast()
        pushAll(topNode.right)
        return topNode.val
    }

    func hasNext() -> Bool {
        return !stack.isEmpty
    }

    private func pushAll(_ node: TreeNode?) {
        var current = node
        while let unwrapped = current {
            stack.append(unwrapped)
            current = unwrapped.left
        }
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
