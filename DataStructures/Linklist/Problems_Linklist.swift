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

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 */

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1: ListNode? = l1
        var l2: ListNode? = l2
        
        var result: ListNode? = ListNode(0)
        let head = result
        
        var carry = 0
        while l1 != nil || l2 != nil || carry > 0 {
            let firstValue = l1?.val ?? 0
            let secondValue = l2?.val ?? 0
            let sum = firstValue + secondValue + carry
            
            let value = sum % 10
            carry = sum / 10
            
            result?.next = ListNode(value)
            result = result?.next
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return head?.next
    }

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var l1 = 0
        var l2 = 0
        var headA = headA
        var headB = headB
        var k = headA
        while k != nil {
            l1 += 1
            k = k?.next
        }
        k = headB
        while k != nil {
            l2 += 1
            k = k?.next
        }
        if l1 > l2 {
            for _ in 0..<(l1-l2) {
                headA = headA?.next
            }
        }else if l2 > l1{
            for _ in 0..<(l2-l1) {
                headB = headB?.next
            }
        }
        while headA != nil {
            if headA === headB {
                return headA
            }
            headA = headA?.next
            headB = headB?.next
            
        }
        return nil
    }

/*
 Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.

  

 Example 1:


 Input: head = [1,2,3,3,4,4,5]
 Output: [1,2,5]
 */
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var slow = dummy
        var fast = head
        slow?.next = fast
        
        while fast != nil {
            while fast?.next != nil && fast?.val == fast?.next?.val {
                fast = fast?.next
            }
            
            if fast !== slow?.next {
                slow?.next = fast?.next
                fast = slow?.next
            } else {
                slow = slow?.next
                fast = fast?.next
            }
        }
        
        return dummy?.next
    }

func rdeleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var head = head
        
        if head?.next != nil && head?.val == head?.next?.val {
            while head?.next != nil && head?.val == head?.next?.val {
                head = head?.next
            }
            return rdeleteDuplicates(head?.next)
        } else {
            head?.next = rdeleteDuplicates(head?.next)
        }
        
        return head
    }

/*
 24. Swap Nodes in Pairs
 
 Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

 Example 1:

 Input: head = [1,2,3,4]
 Output: [2,1,4,3]
 */

func swapPairs(_ head: ListNode?) -> ListNode? {
       guard head != nil, head?.next != nil else {return head}
       let temp = head?.next
       let nHead = temp?.next
       
       temp?.next = head
       head?.next = swapPairs(nHead)
       return temp
   }
