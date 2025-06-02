/// [Bottom View of Binary Tree](https://www.geeksforgeeks.org/problems/bottom-view-of-binary-tree/1)
/// Given a binary tree, return the bottom view of it.
/// Bottom view includes the last node at each vertical level when viewed from the bottom.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: An array of integers representing the bottom view from left to right.

func bottomView(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }

    var result: [Int] = []
    var queue: Queue<(TreeNode, Int)> = Queue()
    var levelMap: [Int: Int] = [:]

    queue.push((root, 0))

    while !queue.isEmpty {
        let (node, level) = queue.pop()!
        // Overwrite the value for each level to capture the bottommost node
        levelMap[level] = node.val

        if let left = node.left {
            queue.push((left, level - 1))
        }

        if let right = node.right {
            queue.push((right, level + 1))
        }
    }

    for key in levelMap.keys.sorted() {
        result.append(levelMap[key]!)
    }

    return result
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
