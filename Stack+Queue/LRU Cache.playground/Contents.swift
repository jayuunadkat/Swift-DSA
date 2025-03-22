import UIKit

/// `LRU Cache` Implementation using a Doubly Linked List and Hash Map.
/// - Operations:
///   - `get(key)`: Returns the value of the key if it exists, otherwise `-1`.
///   - `put(key, value)`: Inserts or updates the key-value pair.
///   - Maintains LRU order, removing the least recently used element when capacity is exceeded.
/// - Complexity: O(1) time for `get` and `put`.
///
/// - Link: [LeetCode 146 - LRU Cache](https://leetcode.com/problems/lru-cache/)

class Node {
    var key: Int
    var value: Int

    var prev: Node?
    var next: Node?

    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {

    var head: Node = Node(key: -1, value: -1)
    var tail: Node = Node(key: -1, value: -1)
    var capacity: Int
    var map: [Int: Node] = [:]

    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        if let node = map[key] {
            deleteNode(node)
            insertAtHead(node)
            return node.value
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            deleteNode(node)
            node.value = value
            insertAtHead(node)
        } else {
            if map.count == capacity {
                if let lastNode = tail.prev {
                    deleteNode(lastNode)
                    map[lastNode.key] = nil
                }
            }

            let newNode = Node(key: key, value: value)
            insertAtHead(newNode)
            map[key] = newNode
        }
    }

    private func deleteNode(_ node: Node) {
        let prev: Node? = node.prev
        let next: Node? = node.next
        prev?.next = next
        next?.prev = prev
    }

    private func insertAtHead(_ node: Node) {
        let headNext: Node? = self.head.next

        node.next = headNext
        node.prev = self.head

        head.next = node
        headNext?.prev = node
    }
}

/// - Note: LRUCache lRUCache = new LRUCache(2);
/// - Note: lRUCache.put(1, 1); // cache is {1=1}
/// - Note: lRUCache.put(2, 2); // cache is {1=1, 2=2}
/// - Note: lRUCache.get(1);    // return 1
/// - Note: lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
/// - Note: lRUCache.get(2);    // returns -1 (not found)
/// - Note: lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
/// - Note: lRUCache.get(1);    // return -1 (not found)
/// - Note: lRUCache.get(3);    // return 3
/// - Note: lRUCache.get(4);    // return 4

