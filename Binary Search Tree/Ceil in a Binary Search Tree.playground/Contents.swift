/// [Ceil in a Binary Search Tree](https://www.geeksforgeeks.org/problems/implementing-ceil-in-bst/1)
/// Given a Binary Search Tree and a number, find the ceil of that number in BST.
/// Ceil is the smallest number in BST greater than or equal to the given number.
/// - Parameters:
///   - root: The root node of the BST.
///   - input: The value to find the ceil for.
/// - Returns: The ceil value if found, otherwise -1.
class Solution {
    func findCeil(_ root: TreeNode?, _ input: Int) -> Int {
        var root = root
        var ceil = -1

        while let node = root {
            if node.val == input {
                return node.val
            }

            if node.val < input {
                root = node.right
            } else {
                ceil = node.val
                root = node.left
            }
        }

        return ceil
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
