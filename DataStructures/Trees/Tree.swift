//
//  Tree.swift
//  DSA
//
//  Created by  Gudkesh on 28/12/21.
//

import Foundation


public class TreeNode<T> {
     public var val: T
     public var left: TreeNode<T>?
     public var right: TreeNode<T>?
     public init(_ val: T) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }
