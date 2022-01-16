//
//  BFS.swift
//  DSA
//
//  Created by Gudkesh on 15/01/22.
//

import Foundation

extension AdjacencyList {
    
    func dfs(src: Vertex<T>, graph: AdjacencyList<T, U>) {
        print(src.data)
        src.isVisited = true
        for neighbour in graph.edges(from: src).map({$0.destination}) {
            if !neighbour.isVisited {
                dfs(src: neighbour, graph: graph)
            }
        }
    }
    
    func bfs(src: Vertex<T>, graph: AdjacencyList<T, U>) {
        var queue = QueueArray<Vertex<T>>()
        queue.enqueue(src)
        src.isVisited = true
        print(src.data)
        while !queue.isEmpty {
            guard let cur = queue.dequeue() else {
                return
            }
            for nbr in graph.edges(from: cur).map({$0.destination}) {
                if !nbr.isVisited {
                    queue.enqueue(nbr)
                    print(nbr.data)
                }
                nbr.isVisited = true
            }
        }
    }
}

