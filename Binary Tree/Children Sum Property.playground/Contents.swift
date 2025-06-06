/// [Children Sum Property](https://www.naukri.com/code360/problems/childrensumproperty_790723)
/// Modifies the binary tree such that every node's value becomes equal to the sum of its children's values if they exist.
/// - Parameter root: The root of the binary tree to transform.

func changeTree(_ root: TreeNode?) {
    guard let root = root else { return }

    var childSum = 0

    if let left = root.left {
        childSum += left.val
    }

    if let right = root.right {
        childSum += right.val
    }

    if childSum > root.val {
        root.val = childSum
    } else {
        if let left = root.left {
            left.val = root.val
        }

        if let right = root.right {
            right.val = root.val
        }
    }

    changeTree(root.left)
    changeTree(root.right)

    var total = 0
    if let left = root.left {
        total += left.val
    }

    if let right = root.right {
        total += right.val
    }

    if root.left != nil || root.right != nil {
        root.val = total
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
