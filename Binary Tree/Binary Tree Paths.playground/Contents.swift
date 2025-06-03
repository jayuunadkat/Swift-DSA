/// [Binary Tree Paths](https://leetcode.com/problems/binary-tree-paths/description/)
/// Given a binary tree, return all root-to-leaf paths in any order.
/// Each path should be represented as a string with nodes joined by `"->"`.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: An array of strings representing all root-to-leaf paths.
class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var ans: [String] = []
        if let root = root {
            findPaths(root, "", &ans)
        }
        return ans
    }

    private func findPaths(_ node: TreeNode?, _ path: String, _ paths: inout [String]) {
        guard let node else { return }
        var currentPath = path + "\(node.val)"

        if let left = node.left {
            findPaths(left, currentPath + "->", &paths)
        }

        if let right = node.right {
            findPaths(right, currentPath + "->", &paths)
        }

        if node.left == nil && node.right == nil {
            paths.append(currentPath)
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
