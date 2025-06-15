/// [Floor in a Binary Search Tree](https://www.geeksforgeeks.org/problems/floor-in-bst/1)
/// Finds the floor of a given value in a Binary Search Tree.
/// The floor is the greatest value in the BST less than or equal to the target.
/// - Parameters:
///   - root: The root of the BST.
///   - x: The target value to find the floor for.
/// - Returns: The floor value, or -1 if it doesn't exist.

class Solution {
    func floor(_ root: TreeNode?, _ x: Int) -> Int {
        var node = root
        var floor = -1

        while let current = node {
            if current.val == x {
                return x
            } else if current.val > x {
                node = current.left
            } else {
                floor = current.val
                node = current.right
            }
        }

        return floor
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
