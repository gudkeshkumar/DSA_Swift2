//
//  QUE_Linklist.swift
//  DSA
//
//  Created by  Gudkesh on 30/12/21.
//

import Foundation

/*
 Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null.

 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to (0-indexed). It is -1 if there is no cycle. Note that pos is not passed as a parameter.

 Do not modify the linked list.
 */

func detectCycle<T>(_ head: Node<T>?) -> Node<T>? {
        guard head != nil else { return nil }
        var slow = head
        var fast = head
        var isLoop = false
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                isLoop = true
                break
            }
        }
        if !isLoop {
            return nil
        }
        slow = head
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }

func lengthOfCycle<T>(_ head: Node<T>?) -> Int? {
        guard head != nil else { return nil }
        var slow = head
        var fast = head
        var isLoop = false
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                isLoop = true
                break
            }
        }
        if !isLoop {
            return nil
        }
        var count = 0
        fast = fast?.next
        while slow !== fast {
            fast = fast?.next
            count += 1
        }
        
        return count
    }

//func reverseList<T>(_ head: Node<T>?) -> Node<T>? {
//        guard let head = head else { return nil }
//        guard let temp = head.next else { return head }
//
//        head.next = nil
//        let revRest = reverseList(temp)
//        temp.next = head
//        return revRest
//    }

func reverseList<T>(_ head: Node<T>?) -> Node<T>? {
    var temp: Node<T>? = nil
    var nextNode: Node<T>? = nil
    var head = head
    
    while head?.next != nil {
        nextNode = head?.next
        head?.next = temp
        temp = head
        head = nextNode
    }
    temp = temp?.next
    return temp
}

func reverseBetween<T>(_ head: Node<T>?, _ left: Int, _ right: Int) -> Node<T>? {
    let dummyHead: Node<T>? = Node<T>(value: 0 as! T)
        dummyHead?.next = head
        
        var prev = dummyHead
        
        for _ in 0..<left - 1 {
            prev = prev?.next
        }
        
        let newHead = prev?.next
        var nextNode = newHead?.next
        
        for _ in 0..<(right - left) {
           newHead?.next = nextNode?.next;
        nextNode?.next = prev?.next;
        prev?.next = nextNode;
        nextNode = newHead?.next;
        }   
        return dummyHead?.next
    
    }
