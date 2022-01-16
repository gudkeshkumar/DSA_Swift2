//
//  CircularLinkList.swift
//  DSA
//
//  Created by Gudkesh on 07/01/22.
//

import Foundation

class CircularLinklist<T: Comparable> {
    typealias N = Node<T>
    var head: N?
    var tail: N?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func push(_ val: T) {
        head = N(value: val, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    func append(_ val: T) {
        guard !isEmpty else {
            push(val)
            return
        }
        tail?.next = N(value: val, next: head)
        tail = tail?.next
    }
    
    func node(at index: Int) -> N? {
        var currentNode = head
        var currentIndex = 0
        while !(currentNode?.next === head) && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    func insert(_ val: T, after node: N?) -> N? {
        guard node !== tail else {
            append(val)
            return tail
        }
        
        node?.next = N(value: val, next: node?.next)
        return node?.next
    }
    
    func display() {
            var nextNode = self.head
            repeat {
                print(nextNode?.value)
                nextNode = nextNode?.next
            } while !(nextNode === self.head)
        }
    
}

//MARK: Remove methods
extension CircularLinklist {
    
}
    
