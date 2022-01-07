//
//  DoublyLinkedList.swift
//  DSA
//
//  Created by  Gudkesh on 03/01/22.
//

import Foundation

class DLNode<T: Comparable> {
    var value: T
    var next: DLNode?
    weak var prev: DLNode?
    
    init(val: T, next: DLNode? = nil, prev: DLNode? = nil ) {
        self.value = val
        self.next = next
        self.prev = prev
    }
}

extension DLNode: CustomStringConvertible {
    var description: String {
        guard let next = self.next else {
            return "\(value)"
        }
        return "\(value) <->" + String(describing: next) + " "
    }
    
    
}

class DLList<T: Comparable> {
    
    var head: DLNode<T>?
    var tail: DLNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    //    private    func   {
    //        guard isKnownUniquelyReferenced(&head) else { return }
    //        guard var oldNode = head else { return }
    //        head = DLNode(val: oldNode.value, next: oldNode.next, prev: oldNode.prev)
    //        var newNode = head
    //
    //        while let nextOldNode = oldNode.next {
    //            newNode?.next = DLNode(val: nextOldNode.value, prev: newNode)
    //            newNode = newNode?.next
    //            oldNode = nextOldNode
    //
    //        }
    //        tail = newNode
    //    }
    
    func push(_ val: T) {
        
        let newNode = DLNode(val: val, next: head)
        head?.prev = newNode
        head = newNode
        if tail == nil {
            tail = head
        }
    }
    
    func append( _ val: T) {
        
        guard !isEmpty else {
            push(val)
            return
        }
        
        tail?.next = DLNode(val: val, prev: tail)
        tail = tail?.next
    }
    
    func node(at index: Int) -> DLNode<T>? {
        var currentNode = head
        var currentIndex = 0
        
        while let node = currentNode, currentIndex < index {
            currentNode = node.next
            currentIndex += 1
        }
        return currentNode
    }
    
    func insert(_ val: T, after node: DLNode<T>? ) {
        guard let node = node, node !== tail else {
            append(val)
            return
        }
        let temp = node
        let newNode = DLNode(val: val)//, next: temp.next, prev: temp)
        newNode.next = temp.next
        newNode.prev = temp
        temp.next?.prev = newNode
        temp.next = newNode
    }
    
}

//MARK: Deletion
extension DLList {
    
    @discardableResult
    func pop() -> T? {
        
        defer {
            head = head?.next
            head?.prev = nil
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    func removeLast() -> T? {
        guard head?.next != nil else {
            return pop()
        }
        tail = tail?.prev
        tail?.next = nil
        return tail?.value
    }
    
    @discardableResult
    func removeNode(after node: DLNode<T>?) -> T? {
        guard node?.next != nil else {
            return nil
        }
        defer {
            node?.next = node?.next?.next
            if node?.next?.next == nil {
                tail = node
            } else {
                node?.next?.prev = node
            }
        }
        return node?.next?.value
    }
}

extension DLList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return ("List is empty")
        }
        return String(describing: head)
    }
}

