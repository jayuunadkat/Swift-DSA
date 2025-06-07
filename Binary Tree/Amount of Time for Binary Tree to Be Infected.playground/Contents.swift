/// [Amount of Time for Binary Tree to Be Infected](https://leetcode.com/problems/amount-of-time-for-binary-tree-to-be-infected/)
/// Returns the time required to infect the entire binary tree from a starting node.
/// - Parameters:
///   - root: The root of the binary tree.
///   - start: The value of the starting node.
/// - Returns: The number of minutes to infect the entire tree.
class Solution {
    func amountOfTime(_ root: TreeNode?, _ start: Int) -> Int {
        guard let root = root else { return 0 }

        var parentMap = [ObjectIdentifier: TreeNode]()
        let startNode = mapParents(root, &parentMap, start)
        return findMaxDistance(from: startNode, using: parentMap)
    }

    private func findMaxDistance(from start: TreeNode?, using parentMap: [ObjectIdentifier: TreeNode]) -> Int {
        guard let start = start else { return 0 }

        var visited = Set<ObjectIdentifier>()
        var queue: [TreeNode] = [start]
        visited.insert(ObjectIdentifier(start))

        var maxDistance = 0

        while !queue.isEmpty {
            let levelSize = queue.count

            for _ in 0..<levelSize {
                let current = queue.removeFirst()
                let currentID = ObjectIdentifier(current)

                for neighbor in [current.left, current.right, parentMap[currentID]] {
                    if let node = neighbor {
                        let nodeID = ObjectIdentifier(node)
                        if !visited.contains(nodeID) {
                            visited.insert(nodeID)
                            queue.append(node)
                        }
                    }
                }
            }

            if !queue.isEmpty {
                maxDistance += 1
            }
        }

        return maxDistance
    }

    private func mapParents(_ root: TreeNode?, _ parentMap: inout [ObjectIdentifier: TreeNode], _ target: Int) -> TreeNode? {
        guard let root = root else { return nil }

        var queue: [TreeNode] = [root]
        var targetNode: TreeNode?

        while !queue.isEmpty {
            let current = queue.removeFirst()

            if current.val == target {
                targetNode = current
            }

            if let left = current.left {
                parentMap[ObjectIdentifier(left)] = current
                queue.append(left)
            }

            if let right = current.right {
                parentMap[ObjectIdentifier(right)] = current
                queue.append(right)
            }
        }

        return targetNode
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



