//
//  Problems_Tree.swift
//  DSA
//
//  Created by Gudkesh on 24/02/22.
//

import Foundation

/*
 236. Lowest Common Ancestor of a Binary Tree
 Medium

 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

  

 Example 1:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 Output: 3
 Explanation: The LCA of nodes 5 and 1 is 3.
 */
func lowestCommonAncestor<T>(_ root: TreeNode<T>?, _ p: TreeNode<T>?, _ q: TreeNode<T>?) -> TreeNode<T>? {
        if root == nil || root === p || root === q {return root}
        let left = lowestCommonAncestor(root?.left,p,q)
        let right = lowestCommonAncestor(root?.right,p,q)
        
        if left == nil {
            return right
        } else if right == nil {
            return left
        } else {
            return root
        }
    }
