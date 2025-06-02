/// [Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)
/// Given a binary tree, return the values of the nodes visible from the right side.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: An array of integers representing the right side view of the tree.
func rightSideView(_ root: TreeNode?) -> [Int] {
    func dfs(_ node: TreeNode?, _ level: Int) {
        guard let node = node else { return }
        if level == result.count {
            result.append(node.val)
        }
        dfs(node.right, level + 1)
        dfs(node.left, level + 1)
    }
    
    var result: [Int] = []
    dfs(root, 0)
    return result
}

/// [Binary Tree Left Side View](https://leetcode.com/problems/binary-tree-right-side-view/)
/// Given a binary tree, return the values of the nodes visible from the left side.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: An array of integers representing the left side view of the tree.
func leftSideView(_ root: TreeNode?) -> [Int] {
    func dfs(_ node: TreeNode?, _ level: Int) {
        guard let node = node else { return }
        if level == result.count {
            result.append(node.val)
        }
        dfs(node.left, level + 1)
        dfs(node.right, level + 1)
    }

    var result: [Int] = []
    dfs(root, 0)
    return result
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
