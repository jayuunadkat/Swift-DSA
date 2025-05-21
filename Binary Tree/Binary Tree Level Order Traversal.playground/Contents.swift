/// [Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/description/)
///
/// Given the `root` of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).
///
/// - Parameter root: The root node of the binary tree.
/// - Returns: A 2D array where each subarray contains the values of the tree nodes at that level.
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans: [[Int]] = []

        if root == nil {
            return ans
        }

        var queue: Queue<TreeNode> = Queue()
        queue.push(root!)

        while !queue.isEmpty {
            var level: [Int] = []
            let levelSize: Int = queue.count

            for _ in 0..<levelSize {
                let node: TreeNode? = queue.pop()
                
                if let node = node {
                    level.append(node.val)
                }

                if let leftNode = node?.left {
                    queue.push(leftNode)
                }

                if let rightNode = node?.right {
                    queue.push(rightNode)
                }
            }
            ans.append(level)
        }

        return ans
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


let node4 = TreeNode(4)
let node5 = TreeNode(5)
let node6 = TreeNode(6)
let node2 = TreeNode(2, node4, nil)
let node3 = TreeNode(3, node5, node6)
let root = TreeNode(1, node2, node3)

let solution = Solution()
let result = solution.levelOrder(root)
print(result)
