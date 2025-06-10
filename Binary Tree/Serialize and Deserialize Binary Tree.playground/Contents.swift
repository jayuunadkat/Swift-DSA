/// [Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/)
/// Implements serialization and deserialization of a binary tree using level-order traversal.
/// - Serialize: Converts the tree to a comma-separated string (uses `#` for nulls).
/// - Deserialize: Parses the string and reconstructs the binary tree.
class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }

        var result: [String] = []
        var queue: [TreeNode?] = [root]

        while !queue.isEmpty {
            let node = queue.removeFirst()

            if let node = node {
                result.append("\(node.val)")
                queue.append(node.left)
                queue.append(node.right)
            } else {
                result.append("#")
            }
        }

        return result.joined(separator: ",")
    }

    func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty { return nil }

        let values = data.split(separator: ",").map { String($0) }
        var index = 1

        let root = TreeNode(Int(values[0])!)
        var queue: [TreeNode] = [root]

        while !queue.isEmpty && index < values.count {
            let current = queue.removeFirst()

            let leftVal = values[index]
            if leftVal != "#" {
                let leftNode = TreeNode(Int(leftVal)!)
                current.left = leftNode
                queue.append(leftNode)
            }
            index += 1

            if index < values.count {
                let rightVal = values[index]
                if rightVal != "#" {
                    let rightNode = TreeNode(Int(rightVal)!)
                    current.right = rightNode
                    queue.append(rightNode)
                }
                index += 1
            }
        }

        return root
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
