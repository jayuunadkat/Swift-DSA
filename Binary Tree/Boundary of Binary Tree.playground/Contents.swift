/// [Boundary of Binary Tree](https://leetcode.com/problems/boundary-of-binary-tree), (https://www.geeksforgeeks.org/boundary-traversal-of-binary-tree/)
/// Given the `root` of a binary tree, return the values of its boundary in anti-clockwise direction starting from the root.
/// The boundary includes the left boundary, leaves, and the right boundary (in reverse).
///
/// - Parameter root: The root of the binary tree.
/// - Returns: An array representing the boundary traversal of the tree.
class Solution {
    func boundary(_ root: TreeNode?) -> [Int] {
        var result = [Int]()

        guard let root = root else {
            return result
        }

        if !isLeaf(root) {
            result.append(root.val)
        }

        addLeftBoundary(root, &result)
        addLeaves(root, &result)
        addRightBoundary(root, &result)

        return result
    }

    private func addLeftBoundary(_ root: TreeNode, _ result: inout [Int]) {
        var curr = root.left
        while let node = curr {
            if !isLeaf(node) {
                result.append(node.val)
            }
            curr = node.left ?? node.right
        }
    }

    private func addRightBoundary(_ root: TreeNode, _ result: inout [Int]) {
        var curr = root.right
        var temp = [Int]()

        while let node = curr {
            if !isLeaf(node) {
                temp.append(node.val)
            }
            curr = node.right ?? node.left
        }

        // Append in reverse
        result.append(contentsOf: temp.reversed())
    }

    private func addLeaves(_ root: TreeNode?, _ result: inout [Int]) {
        guard let root = root else { return }

        if isLeaf(root) {
            result.append(root.val)
            return
        }

        addLeaves(root.left, &result)
        addLeaves(root.right, &result)
    }

    private func isLeaf(_ node: TreeNode?) -> Bool {
        guard let node = node else { return false }
        return node.left == nil && node.right == nil
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
