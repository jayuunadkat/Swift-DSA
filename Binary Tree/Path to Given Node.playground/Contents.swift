/// [Path to Given Node](https://www.interviewbit.com/problems/path-to-given-node/)
/// Returns the path from root to the node with value `B`, if it exists.
/// - Parameters:
///   - root: The root of the binary tree.
///   - B: The target value to find.
/// - Returns: An array of integers representing the path from root to B.
class Solution {
    func solve(_ root: TreeNode?, _ B: Int) -> [Int] {
        var path: [Int] = []
        hasPath(root, &path, B)
        return path
    }

    private func hasPath(_ node: TreeNode?, _ path: inout [Int], _ target: Int) -> Bool {
        guard let node = node else { return false }

        path.append(node.val)

        if node.val == target {
            return true
        }

        if hasPath(node.left, &path, target) || hasPath(node.right, &path, target) {
            return true
        }

        path.removeLast()
        return false
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
