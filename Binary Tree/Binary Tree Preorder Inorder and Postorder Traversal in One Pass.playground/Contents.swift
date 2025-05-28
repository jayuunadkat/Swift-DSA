/// [Binary Tree Preorder, Inorder, and Postorder Traversal in One Pass](https://www.geeksforgeeks.org/preorder-postorder-and-inorder-traversal-of-a-binary-tree-using-a-single-stack/)
/// Perform all three tree traversals (preorder, inorder, postorder) in a single iterative traversal using a stack.
/// Each node is pushed with a state counter that tracks which traversal stage it's in.
///
/// - Parameter root: The root of the binary tree.
/// - Returns: A tuple containing three arrays: preorder, inorder, and postorder traversal results respectively.

class Solution {
    func allTraversals(_ root: TreeNode?) -> ([Int], [Int], [Int]) {
        guard let root = root else { return ([], [], []) }

        var preOrder: [Int] = []
        var inOrder: [Int] = []
        var postOrder: [Int] = []

        var stack: [(TreeNode, Int)] = [(root, 1)]

        while !stack.isEmpty {
            var (node, state) = stack.removeLast() //Pop the last element

            if state == 1 {
                preOrder.append(node.val)
                stack.append((node, 2))

                if let left = node.left {
                    stack.append((left, 1))
                }
            } else if state == 2 {
                inOrder.append(node.val)
                stack.append((node, 3))

                if let right = node.right {
                    stack.append((right, 1))
                }
            } else {
                postOrder.append(node.val)
            }
        }
        return (preOrder, inOrder, postOrder)
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

