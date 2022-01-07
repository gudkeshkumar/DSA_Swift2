//
//  LinkList.swift
//  DSA
//
//  Created by Gudkesh on 21/12/21.
//

import Foundation

class Node<Value> {
    
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

class LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init () {}
    
    var isEmpty: Bool {
        return head == nil
    }
    
    // copy on write
    
    //    private   func   {
    //        guard !isKnownUniquelyReferenced(&head) else { return }
    //        guard var oldNode = head else { return }
    //        head = Node(value: oldNode.value)
    //        var newNode = head
    //
    //        while let nextOldNode = oldNode.next {
    //            newNode?.next = Node(value: nextOldNode.value)
    //            newNode = newNode?.next
    //            oldNode = nextOldNode
    //        }
    //        tail = newNode
    //    }
    
    func push( _ value: Value) {
         
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    // append operation
    
    func append(_ value: Value) {
         
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while (currentNode != nil) && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    func insert( _ value: Value, after node: Node<Value>) -> Node<Value>? {
         
        guard tail !== node else {
            append(value)
            return tail
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next
    }
}

//Mark: Delte Methods
extension LinkedList {
    
    @discardableResult
    func pop() -> Value? {
         
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    func removeLast() -> Value? {
         
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    func remove(after node: Node<Value>) -> Value? {
         
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    var description: String {
        guard let head = head else {
            return "List is empty"
        }
        return String(describing: head)
    }
}

/*
 
 example(of: "using collection") {
 var list = LinkedList<Int>()
 for i in 1...10 {
 list.append(i)
 }
 
 print("List: \(list)")
 print("First element: \(list[list.startIndex])")
 print("Array of first 3: \(Array(list.prefix(3)))")
 print("Array of last 3: \(Array(list.suffix(3)))")
 
 let sum = list.reduce(0, +)
 print("Sum of list: \(sum)")
 
 }
 
 */
