//
//  BinaryTree.swift
//  DSA
//
//  Created by Gudkesh on 20/12/21.
//

import Foundation


class Tree<T: Hashable> {
    class Node<T: Equatable> {
        var label: T
        var children: [Node] = [Node]()
        init(lable: T) {
            self.label = lable
        }
        
        func getChildren() -> [Node] {
            return children
        }
        
        func addChild(child: Node) {
            children.append(child)
        }
        
        func find(with lable: T, parent: Node? = nil) -> Node {
            if (self.label == lable) {
                return self
            }
            for  _ in self.getChildren() {
               
            }
            
            return self
        }
                
    }
    
    
}

enum Color {
    case Yellow, Grey, Black
}

class PathFinder<T: Hashable> {
    var tree: Tree<T>;
    var path: [T] = [T]()
    var nodeColor: [T: Color]
    init(tree_: Tree<T>) {
        tree = tree_
        nodeColor = [T: Color]()
    }
    
    func findPath() {
    }
}
