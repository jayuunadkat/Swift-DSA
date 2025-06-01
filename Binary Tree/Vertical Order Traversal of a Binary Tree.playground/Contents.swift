/// [Vertical Order Traversal of a Binary Tree](https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree)
/// Given the root of a binary tree, return the vertical order traversal of its nodes' values.
/// Nodes are reported column by column from left to right, and within each column from top to bottom.
/// If two nodes are in the same row and column, they are ordered by their value.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: A 2D array where each subarray represents one vertical level's node values.

class Solution {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }

        //Queue(Node, vertical index or X-axis, level index or Y-axis
        var queue: Queue<(TreeNode, Int, Int)> = Queue()

        //[X-axis: [Y-axis: [TreeNode's value in sorted order]]]
        //[X: [Y: [Int] ] ]
        var nodes: [Int: [Int: [Int]]] = [:]

        queue.push((root, 0, 0))
        while !queue.isEmpty {
            let (node, x, y) = queue.pop()!
            nodes[x, default: [:]][y, default: []].append(node.val)

            if let left = node.left {
                queue.push((left, x - 1, y + 1))
            }
            if let right = node.right {
                queue.push((right, x + 1, y + 1))
            }
        }

        var result: [[Int]] = []

        for (x, yDictionary) in nodes.sorted(by: { $0.key < $1.key }) {
            var rowLevel: [Int] = []
            for (y, levelValues) in yDictionary.sorted(by: { $0.key < $1.key }) {
                rowLevel.append(contentsOf: levelValues.sorted())
            }
            result.append(rowLevel)
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

    func top() -> T? {
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
