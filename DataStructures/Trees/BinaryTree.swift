//
//  BinaryTree.swift
//  DSA
//
//  Created by Gudkesh on 20/12/21.
//

import Foundation

extension Array {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

public class GenericTreeNode<T> {
     public var val: T
     public var left: GenericTreeNode<T>?
     public var right: GenericTreeNode<T>?
     public init(_ val: T) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }

/*
 
 Level order traversal
 */

func levelOrder<T>(_ root: GenericTreeNode<T>?) -> [[T]] {
        guard let root = root else {return []}
        var ans = [[T]]()
    var curLevel = [GenericTreeNode<T>?]()
        curLevel.append(root)
        
        while !curLevel.isEmpty {
            var nextLevel = [GenericTreeNode<T>]()
            var lev = [T]()
            for node in curLevel {
                lev.append((node?.val)!)
                if let left = node?.left {
                  nextLevel.append(left)
                }
                if let right = node?.right {
                  nextLevel.append(right)
                }
            }
            
            ans.append(lev)
            curLevel = nextLevel
            
        }
        
        return ans
        
    }

/*
 103. Binary Tree Zigzag Level Order Traversal
 Medium

 Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[20,9],[15,7]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -100 <= Node.val <= 100
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        guard let root = root else { return []}
        
        var stack = [TreeNode?]()
        stack.append(root)
        
        while !stack.isEmpty {
            let cur = stack.removeLast()
            ans.append((cur?.val)!)
            if let r = cur?.right {
                stack.append(r)
            }
            if let r = cur?.left {
                stack.append(r)
            }
        }
        
        return ans
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
            var st = [TreeNode?]()
            var ans = [Int]()
            
            var node = root
            
            while true {
                if let n = node {
                    st.append(n)
                    node = n.left
                    
                } else {
                    
                    if st.isEmpty {break}
                    let n = st.last!
                    st.removeLast()
                    ans.append((n?.val)!)
                    node = n?.right
                }
            }
            return ans
        }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
            var ans = [Int]()
            
            var stack = [TreeNode?]()
            
            stack.append(root)
            while !stack.isEmpty {
                if let node = stack.removeLast() {
                    ans.insert(node.val, at: 0)
                    if let left = node.left { stack.append(left) }
                    if let right = node.right { stack.append(right) }
                }
            }
                    
            return ans
        }
    
    func altpostorderTraversal(_ root: TreeNode?) -> [Int] {
            var ans = [Int]()
            guard let root = root else {return []}
            var cur: TreeNode? = root
            var temp: TreeNode? = nil
            var stack = [TreeNode?]()
            
            while cur != nil || !stack.isEmpty {
                
                if cur != nil {
                    stack.append(cur)
                    cur = cur?.left
                } else {
                    temp = stack.last??.right
                    
                    if temp == nil {
                        temp = stack.last as? TreeNode
                        stack.removeLast()
                        ans.append((temp?.val)!)
                        while stack.isEmpty && temp === stack.last??.right {
                            temp = stack.last as? TreeNode
                            stack.removeLast()
                            ans.append((temp?.val)!)
                        }
                        
                    } else {
                        cur = temp
                    }
                }
            }
            
            return ans
        }
    
    func combinedTraversal(_ root: TreeNode?)  {
        var pre = [Int]()
        var inOrd = [Int]()
        var post = [Int]()
        guard let root = root else {return}
        var stack = [(TreeNode?, Int)]()
        stack .append((root, 1))
        
        while !stack.isEmpty {
            var temp = stack.last!
            stack.removeLast()
            // in order
            if temp.1 == 1 {
                pre.append((temp.0?.val)!)
                temp.1 += 1
                stack.append((temp))
                
                if temp.0?.left != nil {
                    stack.append((temp.0?.left, 1))
                }
            } else if temp.1 == 2 {
                inOrd.append((temp.0?.val)!)
                temp.1 += 1
                stack.append((temp))
                
                if temp.0?.right != nil {
                    stack.append((temp.0?.right, 1))
                }
            } else {
                post.append((temp.0?.val)!)
            }
            
        }
        
    }
}


class ZigZagLevelOrderSolution {
    
    private enum Direction {
        case left
        case right
    }
    
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {return []}
        var ans = [[Int]]()
        var clev: [TreeNode?] = [root]
        var dir = Direction.left
        
        while !clev.isEmpty {
            
            var nlev = [TreeNode?]()
            var vals = [Int]()
            
            for node in clev {
                if let l = node?.left {
                    nlev.append(l)
                }
                if let l = node?.right {
                    nlev.append(l)
                }
                
                switch dir {
                case .left:
                    vals.append(node?.val ?? -1 )
                case .right:
                    vals.insert(node?.val ?? -1, at: 0)
                }
            }
            
            ans.append(vals)
            clev = nlev
            
            dir = dir == .left ? .right : .left
            
        }
        return ans
    }
}


/*
 107. Binary Tree Level Order Traversal II
 Medium
 Given the root of a binary tree, return the bottom-up level order traversal of its nodes' values. (i.e., from left to right, level by level from leaf to root).

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[15,7],[9,20],[3]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000
 */

func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {return []}
        
        var ans = [[Int]]()
        
        var clev: [TreeNode?] = [root]
        
        while !clev.isEmpty {
            var nlev = [TreeNode?]()
            var vals = [Int]()
            for node in clev {
                if let l = node?.left {
                    nlev.append(l)
                }
                if let l = node?.right {
                    nlev.append(l)
                }
                
                vals.append(node?.val ?? -1001)
            }
            
            ans.insert(vals, at: 0)
            clev = nlev
        }
        
        return ans
    }

/*
 
 429. N-ary Tree Level Order Traversal
 Medium

 Given an n-ary tree, return the level order traversal of its nodes' values.

 Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).


 Example 1:

 Input: root = [1,null,3,2,4,null,5,6]
 Output: [[1],[3,2,4],[5,6]]
 Example 2:

 Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 Output: [[1],[2,3,4,5],[6,7,8,9,10],[11,12,13],[14]]
  

 Constraints:

 The height of the n-ary tree is less than or equal to 1000
 The total number of nodes is between [0, 104]
 
 /**
  * Definition for a Node.
  * public class Node {
  *     public var val: Int
  *     public var children: [Node]
  *     public init(_ val: Int) {
  *         self.val = val
  *         self.children = []
  *     }
  * }
  */

 class Solution {
     func levelOrder(_ root: Node?) -> [[Int]] {
         guard let root = root else {return []}
         var ans = [[Int]]()
         var clev: [Node?] = [root]
         
         while !clev.isEmpty {
             var nlev = [Node?]()
             var vals = [Int]()
             
             for node in clev {
                 nlev += node?.children ?? []
                 vals.append(node?.val ?? -1)
             }
             ans.append(vals)
             clev = nlev
         }
         
         return ans
     }
 }
 */

/*
 1161. Maximum Level Sum of a Binary Tree
 Medium

 Given the root of a binary tree, the level of its root is 1, the level of its children is 2, and so on.

 Return the smallest level x such that the sum of all the values of nodes at level x is maximal.

  

 Example 1:


 Input: root = [1,7,0,7,-8,null,null]
 Output: 2
 Explanation:
 Level 1 sum = 1.
 Level 2 sum = 7 + 0 = 7.
 Level 3 sum = 7 + -8 = -1.
 So we return the level with the maximum sum which is level 2.
 Example 2:

 Input: root = [989,null,10250,98693,-89388,null,null,null,-32127]
 Output: 2
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -105 <= Node.val <= 105
 */

class MaxLevelSumSolution {
    func maxLevelSum(_ root: TreeNode?) -> Int {
        var ml = 1
        var l = 0
        var lsum = Int.min
        
        var clev: [TreeNode?] = [root]
        
        while !clev.isEmpty {
            var nlev = [TreeNode?]()
            var sum = 0
             l += 1
            for node in clev {
                let val = (node?.val)!
                sum += val
                
                if let l = node?.left {
                    nlev.append(l)
                }
                
                if let l = node?.right {
                    nlev.append(l)
                }
            }
            if sum > lsum {
                lsum = sum
                ml = l
            }
            clev = nlev
        }
        
        return ml
    }
}

/*
 104. Maximum and Minimum Depth of Binary Tree
 Easy

 Given the root of a binary tree, return its maximum depth.

 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: 3
 Example 2:

 Input: root = [1,null,2]
 Output: 2
 */

class DepthSolution {
    func maxDepthRecursive(_ root: TreeNode?) -> Int {
       guard let root = root else { return 0}
        let l = maxDepthRecursive(root.left)
        let r = maxDepthRecursive(root.right)
        
        return 1 + max(l, r)
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0}
        var lev = 1
        var clev: [TreeNode?] = [root]
        
        while clev.isNotEmpty {
            var nlev: [TreeNode?] = []
            for n in clev {
                if let l = n?.left {
                    nlev.append(l)
                }
                
                if let l = n?.right {
                    nlev.append(l)
                }
            }
            
            if nlev.isNotEmpty {
                lev += 1
            }
            clev = nlev
        }
        
        return lev
    }
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        var minLev = Int.max
        var lev = 1
        
        var clev: [TreeNode?] = [root]
        
        while clev.isNotEmpty {
            var nlev: [TreeNode?] = []
            
            for node in clev {
                if node?.left == nil && node?.right == nil {
                    minLev = min(minLev, lev)
                    return minLev
                } else {
                    if let l = node?.left {
                        nlev.append(l)
                    }
                    
                    if let l = node?.right {
                        nlev.append(l)
                    }
                }
            }
            
            if nlev.isNotEmpty {
                lev += 1
            }
            
            clev = nlev
        }
        
        
        return minLev
    }
    func minDepthRec(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        let l = minDepthRec(root.left)
        let r = minDepthRec(root.right)
        
        if l == 0 || r==0 {
            return l+1+r
        }
        
        return min(l,r)+1
    }
}
