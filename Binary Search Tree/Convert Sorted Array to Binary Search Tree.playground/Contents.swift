/// [Convert Sorted Array to Binary Search Tree](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/)
/// Converts a sorted array into a height-balanced binary search tree.
/// - Parameter nums: The sorted array of integers.
/// - Returns: The root of the height-balanced BST.
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return createBST(nums, 0, nums.count - 1)
    }

    private func createBST(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }

        let mid = left + (right - left) / 2
        let root = TreeNode(nums[mid])
        root.left = createBST(nums, left, mid - 1)
        root.right = createBST(nums, mid + 1, right)

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
