//
//  Graph.swift
//  DSA
//
//  Created by Gudkesh on 15/01/22.
//

import Foundation

enum EdgeType {
    case directed
    case undirected
}

class Vertex<T> {
    let index: Int
    let data: T
    var isVisited = false
    
    init(index: Int, data: T) {
        self.index = index
        self.data = data
    }
}

extension Vertex: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(index)
    }
    
    static func == (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        lhs.index == rhs.index
    }
}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(index) : \(data)"
    }
}

class Edge<T, U> {
    let source: Vertex<T>
    let destination: Vertex<T>
    
    let weight: U?
    
    init(source: Vertex<T>, destination: Vertex<T>, weight: U? = nil) {
        self.source = source
        self.destination = destination
        self.weight = weight
    }
}

extension Edge: CustomStringConvertible {
    var description: String {
        return "Source: " + String(describing: source) + "Destination: " + String(describing: destination) + " Weight: \(String(describing: weight))"
    }

}


protocol Graph: AnyObject {
    associatedtype Element
    associatedtype EdgeElement
    
    func createVertex(_ data: Element) -> Vertex<Element>
    func addDirectedEdge( from source: Vertex<Element>, to destination: Vertex<Element>, weight: EdgeElement?)
    func addUndirectedEdge( between source: Vertex<Element>, and destination: Vertex<Element>, weight: EdgeElement?)
    func add(_ edge: EdgeType, between source: Vertex<Element>, and destination: Vertex<Element>, weight: EdgeElement?)
    func edges(from source: Vertex<Element>) -> [Edge<Element, EdgeElement>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> EdgeElement?
}

class AdjacencyList<T, U>: Graph {
   
    
    typealias Element = T
    typealias EdgeElement = U
    
    private var adjacencies: [Vertex<T>: [Edge<T, U>] ] = [:]
    
    func createVertex(_ data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }
    
    
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: U?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    func addUndirectedEdge(between source: Vertex<T>, and destination: Vertex<T>, weight: U?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    func add(_ edge: EdgeType, between source: Vertex<T>, and destination: Vertex<T>, weight: U?) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T, U>] {
        return adjacencies[source] ?? []
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> U? {
        return edges(from: source).first { $0.destination == destination}?.weight
    }
}

extension AdjacencyList: CustomStringConvertible {
    
    var description: String {
        var results = ""
        
        for (vertex, edgeList) in adjacencies {
            var edgeString = ""
            for (index, edge) in edgeList.enumerated() {
                
                if index != edgeList.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            
            results.append("\(vertex) ---> [\(edgeString)]\n")
        }
        
        return results
    }
    
}

func createSampleGraph() -> AdjacencyList<String, Double> {
    let graph = AdjacencyList<String, Double>()
    
    let A = graph.createVertex("A")
    let B = graph.createVertex("B")
    let C = graph.createVertex("C")
    let D = graph.createVertex("D")
    let E = graph.createVertex("E")
    let F = graph.createVertex("F")
    
    graph.addUndirectedEdge(between: A, and: B, weight: nil)
    graph.addUndirectedEdge(between: A, and: C, weight: nil)
    graph.addUndirectedEdge(between: B, and: D, weight: nil)
    graph.addUndirectedEdge(between: B, and: C, weight: nil)
    graph.addUndirectedEdge(between: C, and: E, weight: nil)
    graph.addUndirectedEdge(between: D, and: E, weight: nil)
    graph.addUndirectedEdge(between: D, and: F, weight: nil)
    graph.addUndirectedEdge(between: E, and: F, weight: nil)
    return graph
}
