/// A stack that supports retrieving the minimum element in constant time.
/// - Operations:
///   - `push(_:)`: Adds an element to the top of the stack.
///   - `pop()`: Removes the top element.
///   - `top()`: Returns the top element without removing it.
///   - `getMin()`: Retrieves the minimum element in the stack.
/// - Note:
///   - Internally uses a stack of pairs `(value, currentMin)` to track the minimum at each level.
/// - Complexity:
///   - Time: O(1) for all operations
///
/// - Link: [LeetCode 155 - Min Stack](https://leetcode.com/problems/min-stack/)
class MinStack {

    private var stack: [(value: Int, currentMin: Int)] = []

    init() {}

    func push(_ val: Int) {
        if stack.isEmpty {
            stack.append((val, val))
        } else {
            let currentMin = min(stack.last!.currentMin, val)
            stack.append((val, currentMin))
        }
    }

    func pop() {
        _ = stack.popLast()
    }

    func top() -> Int {
        return stack.last?.value ?? -1
    }

    func getMin() -> Int {
        return stack.last?.currentMin ?? -1
    }
}
