//
//  Experiments.swift
//  DSA
//
//  Created by Gudkesh on 10/02/22.
//

import Foundation

protocol MyProtocol {
    static var pop2: String{get set}
    var prop: String {get set}
    init()
    func myfun()
}

extension MyProtocol {
    var age: Int {
        return 22
    }
    
    func fun2() {
        print("Default")
    }
}

class MyClass: MyProtocol {
    static var pop2: String = ""
    
    var prop: String = "Name"
    required init() {
        
    }
    
    var age: Int {
        return 10
    }
    
    func myfun() {
        print(self.age)
        print("my fun")
    }
    
    func fun2() {
        print("Class imp")
    }
    
}
