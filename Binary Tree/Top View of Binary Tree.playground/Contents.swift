/// [Top View of Binary Tree](https://www.geeksforgeeks.org/print-nodes-top-view-binary-tree/)
/// Given a binary tree, return the top view of it.
/// Top view includes the first node at each vertical level when viewed from the top.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: An array of integers representing the top view from left to right.
class Solution {
    func topView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var queue = Queue<(TreeNode, Int)>()
        var topNodes: [Int: Int] = [:] // [horizontal distance: node.val]
        var minHD = 0, maxHD = 0

        queue.push((root, 0))

        while !queue.isEmpty {
            let (node, hd) = queue.pop()!

            if topNodes[hd] == nil {
                topNodes[hd] = node.val
                minHD = min(minHD, hd) /// Minimum distance
                maxHD = max(maxHD, hd) /// Maximum distance
            }

            if let left = node.left {
                queue.push((left, hd - 1))
            }

            if let right = node.right {
                queue.push((right, hd + 1))
            }
        }

        var result: [Int] = []
        for hd in minHD...maxHD {
            if let val = topNodes[hd] {
                result.append(val)
            }
        }

        return result
    }
}

struct Queue<T> {
    private var elements: [T] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    mutating func push(_ value: T) {
        elements.append(value)
    }

    mutating func pop() -> T? {
        return isEmpty ? nil : elements.removeFirst()
    }

    func peek() -> T? {
        return elements.first
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
