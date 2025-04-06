import UIKit

/// A protocol defining the fundamental operations of a stack.
protocol StackProtocol {
    /// The type of elements stored in the stack.
    associatedtype Element

    /// Adds an element to the top of the stack.
    /// - Parameter element: The element to push onto the stack.
    mutating func push(_ element: Element)

    /// Removes and returns the top element of the stack.
    /// - Returns: The removed element, or `nil` if the stack is empty.
    @discardableResult mutating func pop() -> Element?

    /// Returns the top element of the stack without removing it.
    /// - Returns: The top element, or `nil` if the stack is empty.
    func top() -> Element?

    /// A Boolean value indicating whether the stack is empty.
    var isEmpty: Bool { get }
}
extension StackProtocol {
    /// A computed property that returns `true` if the stack has no elements.
    var isEmpty: Bool {
        return top() == nil
    }
}

/// A generic stack implementation that conforms to `StackProtocol`.
/// - Note: This implementation uses an internal array to store elements.
/// - Note: `Element: Equatable` is optional and only needed if stack comparison is required.
struct Stack<Element>: StackProtocol where Element: Equatable {
    /// The underlying array that stores the stack elements.
    private var elements: [Element] = []

    /// Pushes an element onto the top of the stack.
    /// - Parameter element: The element to add.
    mutating func push(_ element: Element) {
        elements.append(element)
    }

    /// Removes and returns the top element of the stack.
    /// - Returns: The last added element, or `nil` if the stack is empty.
    mutating func pop() -> Element? {
        guard !isEmpty else { return nil }
        return elements.removeLast()
    }

    /// Retrieves the top element of the stack without modifying it.
    /// - Returns: The top element, or `nil` if the stack is empty.
    func top() -> Element? {
        return elements.last
    }
}


/// Computes the largest rectangular area in a histogram using a stack-based approach.
/// - Approach:
///   - Uses indices as stack values to calculate Previous Smaller Element (PSE) and Next Smaller Element (NSE).
///   - Area is computed as `height * (NSE - PSE - 1)` for each popped element.
///   - Ensures each bar is considered once for maximum area calculation.
/// - Complexity:
///   - Time: O(n)
///   - Space: O(n)
///
/// - Link: [LeetCode - Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/)


//MARK: - Solution 2
///We need to keep track of previous smaller element and, the next smaller element will be calculated on the go
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxArea: Int = 0
        var stack: Stack<Int> = Stack<Int>()
        for i in 0..<heights.count {
            while !stack.isEmpty && heights[stack.top()!] >= heights[i] {
                let height = heights[stack.top()!]
                stack.pop()
                let pse = stack.top() ?? -1
                let nse = i

                let area = height * (nse - pse - 1)
                maxArea = max(area, maxArea)
            }

            stack.push(i)
        }

        while !stack.isEmpty {
            let height = heights[stack.top()!]
            stack.pop()
            let nse = heights.count
            let pse = stack.top() ?? -1

            let area = height * (nse - pse - 1)
            maxArea = max(area, maxArea)
        }

        return maxArea
    }
}

/*
//MARK: - Solution 1
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let pse = computePreviousSmallerElement(heights)
        let nse = computeNextSmallerElement(heights)

        var maxArea = 0
        let n = heights.count
        for i in 0..<n {
            let width = nse[i] - pse[i] - 1
            let height = heights[i]
            maxArea = max(maxArea, width * height)
        }
        return maxArea
    }

    func computePreviousSmallerElement(_ heights: [Int]) -> [Int] {
        //[2,1,5,6,2,3]
        var result: [Int] = []
        var stack: [(index: Int, value: Int)] = []

        for (index, height) in heights.enumerated() {
            while(!stack.isEmpty && (stack.last!.value >= height)) {
                stack.popLast()
            }

            result.append(stack.isEmpty ? -1 : stack.last!.index)
            stack.append((index, height))
        }
        return result
    }

    func computeNextSmallerElement(_ heights: [Int]) -> [Int] {
        //[2,1,5,6,2,3]
        var result: [Int] = []
        var stack: [(index: Int, value: Int)] = []
        for (index, height) in heights.enumerated().reversed() {
            while(!stack.isEmpty && stack.last!.value >= height) {
                stack.popLast()
            }

            result.append(stack.isEmpty ? heights.count : stack.last!.index)
            stack.append((index, height))
        }

        return result.reversed()
    }
}
*/
let heights = [2,1,5,6,2,3]
let s = Solution()
print("Largest area: \(s.largestRectangleArea(heights))")

