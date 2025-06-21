/// [Two Sum IV - Input is a BST](https://leetcode.com/problems/two-sum-iv-input-is-a-bst/)
/// Uses two BST iterators (inorder and reverse inorder) to simulate two-pointer approach on BST
/// - Time: O(n), Space: O(h)
class BSTIterator {
    private var stack: [TreeNode] = []
    private let isReversed: Bool

    init(_ root: TreeNode?, _ isReversed: Bool) {
        self.isReversed = isReversed
        pushAll(root)
    }

    func next() -> Int {
        let topNode = stack.removeLast()
        if isReversed {
            pushAll(topNode.left)
        } else {
            pushAll(topNode.right)
        }
        return topNode.val
    }

    func hasNext() -> Bool {
        return !stack.isEmpty
    }

    private func pushAll(_ node: TreeNode?) {
        var current = node
        while let unwrapped = current {
            stack.append(unwrapped)
            current = isReversed ? unwrapped.right : unwrapped.left
        }
    }
}

class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root = root else { return false }

        let leftIter = BSTIterator(root, false)
        let rightIter = BSTIterator(root, true)

        var i = leftIter.next()
        var j = rightIter.next()

        while i < j {
            let sum = i + j
            if sum == k {
                return true
            } else if sum < k {
                if leftIter.hasNext() {
                    i = leftIter.next()
                } else {
                    break
                }
            } else {
                if rightIter.hasNext() {
                    j = rightIter.next()
                } else {
                    break
                }
            }
        }

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
