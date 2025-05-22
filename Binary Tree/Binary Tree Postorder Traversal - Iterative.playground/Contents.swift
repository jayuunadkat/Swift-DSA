/// [Binary Tree Preorder Traversal](https://leetcode.com/problems/binary-tree-postorder-traversal/)
/// Returns the preorder traversal of a binary tree's node values using an iterative approach.
/// Preorder traversal visits the current node before its child nodes: root → left → right.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: An array of integers representing the preorder traversal.

///`Solution: 2`
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        var stack1: [TreeNode] = []
        var ans: [Int] = []

        stack1.append(root!)

        while !stack1.isEmpty {
            let top = stack1.last
            stack1.removeLast()

            ans.append(top!.val)

            if let left = top?.left {
                stack1.append(left)
            }

            if let right = top?.right {
                stack1.append(right)
            }
        }

        return ans.reversed()
    }
}

/*
///`Solution: 1`
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }

        var stack1: [TreeNode] = []
        var stack2: [TreeNode] = []
        var ans: [Int] = []

        stack1.append(root!)

        while !stack1.isEmpty {
            let top = stack1.last
            stack1.removeLast()

            stack2.append(top!)

            if let left = top?.left {
                stack1.append(left)
            }

            if let right = top?.right {
                stack1.append(right)
            }
        }

        while !stack2.isEmpty {
            ans.append(stack2.removeLast().val)
        }

        return ans
    }
}
*/

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

