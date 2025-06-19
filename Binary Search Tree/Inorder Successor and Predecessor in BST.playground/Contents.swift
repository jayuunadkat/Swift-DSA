/// [Inorder Successor and Predecessor in BST](https://www.geeksforgeeks.org/problems/predecessor-and-successor/1)
/// Finds the inorder predecessor and successor of a given key in a BST.
/// - Parameters:
///   - root: The root of the BST.
///   - key: The value for which we want to find predecessor and successor.
/// - Returns: A tuple (predecessor, successor) of TreeNode?
class Solution {
    func findPreSuc(_ root: TreeNode?, _ key: Int) -> (TreeNode?, TreeNode?) {
        var predecessor: TreeNode? = nil
        var successor: TreeNode? = nil

        var temp = root
        while let node = temp {
            if node.val <= key {
                temp = node.right
            } else {
                successor = node
                temp = node.left
            }
        }

        temp = root
        while let node = temp {
            if node.val < key {
                predecessor = node
                temp = node.right
            } else {
                temp = node.left
            }
        }

        return (predecessor, successor)
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
