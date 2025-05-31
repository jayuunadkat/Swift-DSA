/// [Binary Tree Zigzag Level Order Traversal](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal)
/// Given the `root` of a binary tree, return the zigzag level order traversal of its nodes' values.
/// (i.e., from left to right, then right to left for the next level and alternate between).
///
/// - Parameter root: The root of the binary tree.
/// - Returns: A 2D array representing the zigzag level order traversal.
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }

        var result: [[Int]] = []
        var queue: Queue<TreeNode> = Queue()
        queue.push(root!)
        var reverseDirection: Bool = false

        while !queue.isEmpty {
            var currentLevel: [Int] = []
            let levelSize = queue.count
            
            for _ in 0..<levelSize {
                guard let node = queue.pop() else { continue }
                currentLevel.append(node.val)
                
                if let leftNode = node.left {
                    queue.push(leftNode)
                }

                if let rightNode = node.right {
                    queue.push(rightNode)
                }
            }

            if reverseDirection {
                currentLevel = currentLevel.reversed()
            }

            result.append(currentLevel)
            reverseDirection.toggle()
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
