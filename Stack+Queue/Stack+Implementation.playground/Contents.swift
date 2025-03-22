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

///---------------------------------:::Example usage:::---------------------------------
var stack: Stack<Int> = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
print("Top element: \(String(describing: stack.top()))")
print("Popped element: \(String(describing: stack.pop()))")
print("Stack is empty: \(stack.isEmpty)")
