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

// MARK: - Default Implementation

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


//MARK: - Problem: Nearest Smaller Element
/// Finds the nearest smaller element for each element in the given array.
///
/// - Parameter A: The input array of integers.
/// - Returns: An array where each element represents the nearest smaller element on the left. If no such element exists, it is `-1`.
///
/// - Link: [Nearest Smaller Element - InterviewBit] (https://www.interviewbit.com/problems/nearest-smaller-element/)

class Solution {
    func prevSmaller(_ A: inout [Int]) -> [Int] {
        var stack: Stack<Int> = Stack<Int>()
        var answers: [Int] = []

        let n = A.count
        for i in 0..<n {
            while !stack.isEmpty, (stack.top() ?? 0) >= A[i] {
                stack.pop()
            }

            answers.append(stack.isEmpty ? -1 : stack.top() ?? 0)
            stack.push(A[i])
        }

        return answers
    }
}
