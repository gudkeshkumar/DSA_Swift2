//
//  Problems_Stacks.swift
//  DSA
//
//  Created by  Gudkesh on 30/12/21.
//

import Foundation

/*
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

 Implement the MinStack class:

 MinStack() initializes the stack object.
 void push(int val) pushes the element val onto the stack.
 void pop() removes the element on the top of the stack.
 int top() gets the top element of the stack.
 int getMin() retrieves the minimum element in the stack.
  

 Example 1:

 Input
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 Output
 [null,null,null,null,-3,null,0,-2]
 */

class MinStack {

    private var head: MinStackNode?
    
    private var isEmpty: Bool {
        return head == nil
    }

    /** initialize your data structure here. */
    init() {
       head = nil
    }
    
    func push(_ x: Int) {
        let node = MinStackNode(x)
        if isEmpty {
            node.min = x
            head = node
        } else {
            let minV = min(x,  (head?.min)!)
            node.min = minV
            node.next = head
            head = node
        }
    }
    
    func pop() {
        head = head?.next
    }
    
    func top() -> Int {
        return (head?.value)!
    }
    
    func getMin() -> Int {
        return (head?.min)!
    }
}

class MinStackNode {
    let value: Int
    var min: Int
    var next: MinStackNode?
    
    init(_ x: Int) {
        value = x
        min = x
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

/*
 1249. Minimum Remove to Make Valid Parentheses
 
 Given a string s of '(' , ')' and lowercase English characters.

 Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

 Formally, a parentheses string is valid if and only if:

 It is the empty string, contains only lowercase characters, or
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.
  

 Example 1:

 Input: s = "lee(t(c)o)de)"
 Output: "lee(t(c)o)de"
 Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
 */

func minRemoveToMakeValid(_ s: String) -> String {
        var arr = Array(s)
        var stack = [Int]()
        
        for (i, char) in arr.enumerated() {
            if char == "(" {
                stack.append(i)
            }
            
            if char == ")" {
                if !stack.isEmpty {
                    stack.removeLast()
                } else {
                    arr[i] = "*"
                }
            }
        }
        
        while !stack.isEmpty {
            let i = stack.removeLast()
            arr[i] = "*"
        }
        
        let str = String(arr).replacingOccurrences(of: "*", with: "")
        return str
        
    }

/*
 1823. Find the Winner of the Circular Game

 There are n friends that are playing a game. The friends are sitting in a circle and are numbered from 1 to n in clockwise order. More formally, moving clockwise from the ith friend brings you to the (i+1)th friend for 1 <= i < n, and moving clockwise from the nth friend brings you to the 1st friend.

 The rules of the game are as follows:

 Start at the 1st friend.
 Count the next k friends in the clockwise direction including the friend you started at. The counting wraps around the circle and may count some friends more than once.
 The last friend you counted leaves the circle and loses the game.
 If there is still more than one friend in the circle, go back to step 2 starting from the friend immediately clockwise of the friend who just lost and repeat.
 Else, the last friend in the circle wins the game.
 Given the number of friends, n, and an integer k, return the winner of the game.

  

 Example 1:


 Input: n = 5, k = 2
 Output: 3
 Explanation: Here are the steps of the game:
 1) Start at friend 1.
 2) Count 2 friends clockwise, which are friends 1 and 2.
 3) Friend 2 leaves the circle. Next start is friend 3.
 4) Count 2 friends clockwise, which are friends 3 and 4.
 5) Friend 4 leaves the circle. Next start is friend 5.
 6) Count 2 friends clockwise, which are friends 5 and 1.
 7) Friend 1 leaves the circle. Next start is friend 3.
 8) Count 2 friends clockwise, which are friends 3 and 5.
 9) Friend 5 leaves the circle. Only friend 3 is left, so they are the winner.
 Example 2:

 Input: n = 6, k = 5
 Output: 1
 Explanation: The friends leave in this order: 5, 4, 6, 2, 3. The winner is friend 1.
 */

func findTheWinner(_ n: Int, _ k: Int) -> Int {
        var arr = [Int]()
        for i in 0..<n{
           arr.append(i+1)
        }
        eleminate(k, 0, &arr)
        return arr[0]
    }
    
    func eleminate(_ k: Int, _ index: Int, _ arr: inout [Int]){
        if arr.count == 1{
            return
        }
        let i = (index + k - 1) % arr.count
         arr.remove(at: i)
         eleminate(k, i, &arr)
    }
