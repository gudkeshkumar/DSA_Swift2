//
//  Tree.swift
//  DSA
//
//  Created by  Gudkesh on 28/12/21.
//

import Foundation

class TreeNode<T> {
    let value: T
    var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
}
