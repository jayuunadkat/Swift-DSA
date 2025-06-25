/// [Populating Next Right Pointers in Each Node](https://leetcode.com/problems/populating-next-right-pointers-in-each-node/)
/// Connects each node with its next right node in a perfect binary tree.
class Solution {

    /// Solution 1: Level Order using Queue (BFS)
    func connect_LevelOrder(_ root: Node?) -> Node? {
        guard let root = root else { return nil }

        var queue: [Node] = [root]

        while !queue.isEmpty {
            let size = queue.count
            var prev: Node? = nil

            for _ in 0..<size {
                let current = queue.removeFirst()
                if let prevNode = prev {
                    prevNode.next = current
                }
                prev = current

                if let left = current.left {
                    queue.append(left)
                }
                if let right = current.right {
                    queue.append(right)
                }
            }
        }

        return root
    }

    /// Solution 2: Constant Space using next pointers (Optimized)
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }

        var leftmost: Node? = root

        while let currentLeft = leftmost?.left {
            var head = leftmost

            while let node = head {
                node.left?.next = node.right
                if let next = node.next {
                    node.right?.next = next.left
                }
                head = node.next
            }

            leftmost = currentLeft
        }

        return root
    }
}


public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

