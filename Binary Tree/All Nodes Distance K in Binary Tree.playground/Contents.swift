/// [All Nodes Distance K in Binary Tree](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/)
/// Returns all nodes at distance `k` from the target node in the binary tree.
/// - Parameters:
///   - root: The root of the binary tree.
///   - target: The target node from which distance is measured.
///   - k: The required distance.
/// - Returns: Array of node values at distance `k` from target.

class Solution {
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let root = root, let target = target else { return [] }

        var parentMap: [TreeNode: TreeNode] = [:]
        markParents(root, &parentMap)

        var visited: Set<TreeNode> = [target]
        var queue: [TreeNode] = [target]
        var currentLevel = 0

        while !queue.isEmpty {
            if currentLevel == k { break }

            var levelSize = queue.count
            for _ in 0..<levelSize {
                let node = queue.removeFirst()

                if let left = node.left, !visited.contains(left) {
                    visited.insert(left)
                    queue.append(left)
                }

                if let right = node.right, !visited.contains(right) {
                    visited.insert(right)
                    queue.append(right)
                }

                if let parent = parentMap[node], !visited.contains(parent) {
                    visited.insert(parent)
                    queue.append(parent)
                }
            }

            currentLevel += 1
        }

        return queue.map { $0.val }
    }

    private func markParents(_ root: TreeNode, _ parentMap: inout [TreeNode: TreeNode]) {
        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            let node = queue.removeFirst()

            if let left = node.left {
                parentMap[left] = node
                queue.append(left)
            }

            if let right = node.right {
                parentMap[right] = node
                queue.append(right)
            }
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

extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val &&
        lhs.left == rhs.left &&
        lhs.right == rhs.right
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        if let left = left {
            hasher.combine(left)
        }

        if let right = right {
            hasher.combine(right)
        }
    }
}
