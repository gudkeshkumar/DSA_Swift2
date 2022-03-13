//
//  Problems_Rec.swift
//  DSA
//
//  Created by Gudkesh on 25/02/22.
//

import Foundation
/*
 90. Subsets II
 Medium
 Given an integer array nums that may contain duplicates, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

  

 Example 1:

 Input: nums = [1,2,2]
 Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
 */


func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var ans = Set<[Int]>()
    var sub = [Int]()
    getSubsets(0, &ans, &sub, nums)
    return Array(ans)
}

private func getSubsets(_ ind: Int, _ ans: inout Set<[Int]>, _ sub: inout [Int], _ nums: [Int]) {
    if ind == nums.count {
        ans.insert(sub.sorted())
        return
    }
    sub.append(nums[ind])
    getSubsets(ind+1, &ans, &sub, nums)
    sub.removeLast()
    getSubsets(ind+1, &ans, &sub, nums)
}

//private func getSubsets(_ ind: Int, _ ans: inout [[Int]], _ sub: inout [Int], _ nums: [Int]) {
//        ans.append(sub)
//
//        for i in ind..<nums.count {
//            if  (i != ind) && nums[i] == nums[i-1]  {
//                continue
//            }
//           sub.append(nums[i])
//            getSubsets(i+1, &ans, &sub, nums)
//            sub.removeLast()
//        }
//    }

/*
 Print the susequence of an array which has sum equal to k
 Print any sequence
 get subsequence  count having sum = k
 */


func subsequenceSum(_ arr: [Int], _ sum: Int)  {
    var sub = [Int]()
    var curSum = 0
    getSubsequences(0, &sub, arr, &curSum, sum)
}

@discardableResult
private func getSubsequences(_ ind: Int, _ sub: inout [Int], _ arr: [Int], _ sum: inout Int, _ targetSum: Int) -> Bool {
    if ind == arr.count {
        if sum == targetSum {
            print(sub)
            return true
        }
        return false
    }
    sub.append(arr[ind])
    sum += arr[ind]
    if getSubsequences(ind+1, &sub, arr, &sum, targetSum) {return true}
    sub.removeLast()
    sum -= arr[ind]
    if getSubsequences(ind+1, &sub, arr, &sum, targetSum) {return true}
    
    return false
}

func subsequenceCount(_ arr: [Int], _ sum: Int) -> Int  {
    var curSum = 0
    return getSubsequencesCount(0, arr, &curSum, sum)
}

@discardableResult
private func getSubsequencesCount(_ ind: Int, _ arr: [Int], _ sum: inout Int, _ targetSum: Int) -> Int {
    if ind == arr.count {
        if sum == targetSum {
            return 1
        }
        return 0
    }
    sum += arr[ind]
    let l = getSubsequencesCount(ind+1,  arr, &sum, targetSum)
    sum -= arr[ind]
    let r = getSubsequencesCount(ind+1,  arr, &sum, targetSum)
    
    return l+r
}

/*
 39. Combination Sum
 Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

 The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

 It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

  

 Example 1:

 Input: candidates = [2,3,6,7], target = 7
 Output: [[2,2,3],[7]]
 Explanation:
 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
 7 is a candidate, and 7 = 7.
 These are the only two combinations.
 Example 2:

 Input: candidates = [2,3,5], target = 8
 Output: [[2,2,2,2],[2,3,3],[3,5]]
 Example 3:

 Input: candidates = [2], target = 1
 Output: []
 */
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var sub = [Int]()
        getSubsequences(0, &ans, &sub, candidates, target)
        return ans
    }
    
private func getSubsequences(_ ind: Int, _ ans: inout [[Int]], _ sub: inout [Int], _ arr: [Int], _ targetSum: Int) {
    if ind == arr.count {
        if 0 == targetSum {
            ans.append(sub)
        }
        return
    }
    
    if arr[ind] <= targetSum {
       sub.append(arr[ind])
       getSubsequences(ind, &ans, &sub, arr,  targetSum-arr[ind])
       sub.removeLast()
    }
    
    getSubsequences(ind+1, &ans, &sub, arr, targetSum)
}

/*
 40. Combination Sum II
 Medium

 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

 Each number in candidates may only be used once in the combination.

 Note: The solution set must not contain duplicate combinations.

  

 Example 1:

 Input: candidates = [10,1,2,7,6,1,5], target = 8
 Output:
 [
 [1,1,6],
 [1,2,5],
 [1,7],
 [2,6]
 ]
 Example 2:

 Input: candidates = [2,5,2,1,2], target = 5
 Output:
 [
 [1,2,2],
 [5]
 ]
  

 Constraints:

 1 <= candidates.length <= 100
 1 <= candidates[i] <= 50
 1 <= target <= 30
 */

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
   var ans = [[Int]]()
   var sub = [Int]()
   let arr = candidates.sorted()
   getSubsets(0, &ans, &sub, arr, target)
   return Array(ans)
}

private func getSubsets(_ ind: Int, _ ans: inout [[Int]], _ sub: inout [Int], _ nums: [Int], _ target: Int) {
   if target == 0 {
        ans.append(sub)
       return
   }
   
   for i in ind..<nums.count {
       if i > ind && nums[i] == nums[i-1] {
           continue
       }
       
       if nums[i] > target {
           break
       }
       
       sub.append(nums[i])
       getSubsets(i+1, &ans, &sub, nums, target - nums[i])
       sub.removeLast()
   }
   
}

/*
 You are given an integer array nums and an integer target.

 You want to build an expression out of nums by adding one of the symbols '+' and '-' before each integer in nums and then concatenate all the integers.

 For example, if nums = [2, 1], you can add a '+' before 2 and a '-' before 1 and concatenate them to build the expression "+2-1".
 Return the number of different expressions that you can build, which evaluates to target.

  

 Example 1:

 Input: nums = [1,1,1,1,1], target = 3
 Output: 5
 Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
 -1 + 1 + 1 + 1 + 1 = 3
 +1 - 1 + 1 + 1 + 1 = 3
 +1 + 1 - 1 + 1 + 1 = 3
 +1 + 1 + 1 - 1 + 1 = 3
 +1 + 1 + 1 + 1 - 1 = 3

 */
func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    let n = nums.count
    return targetSum(n, 0, nums, target)
    
}

private func targetSum(_ len: Int, _ ind: Int, _ nums: [Int], _ target: Int ) -> Int {
    if ind == len {
        if target == 0 {
            return 1
        }
        return 0
    }
    
    let positive = targetSum(len, ind+1, nums, target - nums[ind])
    let negative = targetSum(len, ind+1, nums, target - (-nums[ind]))
    return positive + negative
    
}

/*
 Subset sum
 */

func getSubsetSum(_ nums: [Int]) -> [Int] {
    var ans = [Int]()
    let len = nums.count
    
    calculateSubsetSum(len, 0, nums, 0, &ans)
    return ans.sorted()
}

private func calculateSubsetSum(_ len: Int, _ ind: Int, _ arr: [Int], _ sum: Int, _ ans: inout [Int] ) {
    if ind == len {
        ans.append(sum)
        return
    }
    
    calculateSubsetSum(len, ind+1, arr, sum+arr[ind], &ans)
    calculateSubsetSum(len, ind+1, arr, sum, &ans)
}

/*
 47. Permutations II
 Medium

 Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

  

 Example 1:

 Input: nums = [1,1,2]
 Output:
 [[1,1,2],
  [1,2,1],
  [2,1,1]]
 Example 2:

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
  
 */

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var ans = [[Int]]()
    var arr = nums
    permuteRec(&arr, 0, &ans)
    return Array(Set(ans))
}

private func permuteRec(_ nums: inout [Int], _ ind: Int, _ ans: inout [[Int]]) {
    let n = nums.count - 1
    if ind == n {
        ans.append(nums)
    } else {
        for i in ind...n {
            (nums[ind], nums[i]) = (nums[i], nums[ind])
            permuteRec(&nums, ind+1, &ans)
            (nums[ind], nums[i]) = (nums[i], nums[ind])
        }
    }
}

/*
 567. Permutation in String
 Medium
 Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.

 In other words, return true if one of s1's permutations is the substring of s2.

  

 Example 1:

 Input: s1 = "ab", s2 = "eidbaooo"
 Output: true
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:

 Input: s1 = "ab", s2 = "eidboaoo"
 Output: false
  

 Constraints:

 1 <= s1.length, s2.length <= 104
 s1 and s2 consist of lowercase English letters.
 */

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    let s1Array = Array(s1)
        let s2Array = Array(s2)
        var s1map: [Character: Int] = [:]
        var s2map: [Character: Int] = [:]
        let s1Count = s1.count
        
        for char in s1Array {
            s1map[char, default: 0] += 1
        }
        
        for i in 0..<s2.count {
            if i >= s1Count {
                let key = s2Array[i - s1Count]
                if let val = s2map[key] {
                    if val == 1 {
                        s2map.removeValue(forKey: key)
                    } else {
                        s2map[key] = val - 1
                    }
                }
            }
            s2map[s2Array[i], default: 0] += 1
            
            if s1map == s2map {
                return true
            }
        }
       
        return false
}

/*
 51. N-Queens
 Hard

 The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

 Given an integer n, return all distinct solutions to the n-queens puzzle. You may return the answer in any order.

 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space, respectively.

  

 Example 1:


 Input: n = 4
 Output: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
 Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above
 Example 2:

 Input: n = 1
 Output: [["Q"]]
  

 Constraints:

 1 <= n <= 9
 */

class NQueensSolution {
    var sol = [[String]]()
    func solveNQueens(_ n: Int) -> [[String]] {
        var ans = [[String]]()
        sol = Array(repeating: Array(repeating: ".", count: n), count: n)
        solutionNqueens(n, 0, &ans)
        return ans
        
    }
    
    func solutionNqueens(_ n: Int, _ col: Int, _ ans: inout [[String]]) {
        if col == n {
            ans.append(sol.map{$0.joined()})
        } else {
            for row in 0..<n {
                if canPlaceQueen(row, col, n) {
                    sol[row][col] = "Q"
                    solutionNqueens(n, col+1, &ans)
                    sol[row][col] = "."
                }
                
            }
        }
    }
    
    private func canPlaceQueen(_ row: Int, _ col: Int, _ n: Int) -> Bool {
        // check for row
        
        for i in 0..<col {
           if sol[row][i] == "Q" {
               return false
           }
        }
        
        // Diagonal
        
        var i = row
        var j = col
        
        while i >= 0 && j >= 0 {
            if sol[i][j] == "Q" {
               return false
           }
            
            i -= 1
            j -= 1
        }
        
        // check for antiDiagonal
        
         i = row
         j = col
        
        while i < n && j >= 0 {
            if sol[i][j] == "Q" {
               return false
           }
            
            i += 1
            j -= 1
        }
        
        
        
        
        return true
    }
}
/*
 class Solution {
     var sol = [[String]]()
     var leftRow = [Bool]()
     var diag = [Bool]()
     var antidiag = [Bool]()
     func solveNQueens(_ n: Int) -> [[String]] {
         var ans = [[String]]()
         leftRow = Array(repeating: false, count: n)
         diag = Array(repeating: false, count: 2*n - 1)
         antidiag = Array(repeating: false, count: 2*n - 1)
         sol = Array(repeating: Array(repeating: ".", count: n), count: n)
         solutionNqueens(n, 0, &ans)
         return ans
         
     }
     
     func solutionNqueens(_ n: Int, _ col: Int, _ ans: inout [[String]]) {
         if col == n {
             ans.append(sol.map{$0.joined()})
         } else {
             for row in 0..<n {
                 if canPlaceQueen(row, col, n) {
                     sol[row][col] = "Q"
                     leftRow[row] = true
                     diag[row+col] = true
                     antidiag[(n-1)+(col-row)] = true
                     solutionNqueens(n, col+1, &ans)
                     sol[row][col] = "."
                     leftRow[row] = false
                     diag[row+col] = false
                     antidiag[(n-1)+(col-row)] = false
                 }
                 
             }
         }
     }
     
     private func canPlaceQueen(_ row: Int, _ col: Int, _ n: Int) -> Bool {
         // check for row
         
         if leftRow[row] {return false}
         
         // Diagonal
         
         if diag[row+col] {return false}
         
         // check for antiDiagonal
         let ind = (n-1) + (col-row)
         if antidiag[ind] {return false}
         
         
         
         return true
     }
 }

 */

/*
 52. N-Queens II
 Hard

 The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

 Given an integer n, return the number of distinct solutions to the n-queens puzzle.

  

 Example 1:


 Input: n = 4
 Output: 2
 Explanation: There are two distinct solutions to the 4-queens puzzle as shown.
 Example 2:

 Input: n = 1
 Output: 1
  

 Constraints:

 1 <= n <= 9
 */

class TotalNSolution {
    var sol = [[String]]()
    func totalNQueens(_ n: Int) -> Int {
        var ans = 0
        sol = Array(repeating: Array(repeating: ".", count: n), count: n)
        solutionNqueens(n, 0, &ans)
        return ans
        
    }
    
    func solutionNqueens(_ n: Int, _ col: Int, _ ans: inout Int) {
        if col == n {
            ans = ans+1
        } else {
            for row in 0..<n {
                if canPlaceQueen(row, col, n) {
                    sol[row][col] = "Q"
                    solutionNqueens(n, col+1, &ans)
                    sol[row][col] = "."
                }
                
            }
        }
    }
    
    private func canPlaceQueen(_ row: Int, _ col: Int, _ n: Int) -> Bool {
        // check for row
        
        for i in 0..<col {
           if sol[row][i] == "Q" {
               return false
           }
        }
        
        // Diagonal
        
        var i = row
        var j = col
        
        while i >= 0 && j >= 0 {
            if sol[i][j] == "Q" {
               return false
           }
            
            i -= 1
            j -= 1
        }
        
        // check for antiDiagonal
        
         i = row
         j = col
        
        while i < n && j >= 0 {
            if sol[i][j] == "Q" {
               return false
           }
            
            i += 1
            j -= 1
        }
        
        
        
        
        return true
    }
}

/*
 37. Sudoku Solver
 Hard

 Write a program to solve a Sudoku puzzle by filling the empty cells.

 A sudoku solution must satisfy all of the following rules:

 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 The '.' character indicates empty cells.

  

 Example 1:


 Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
 Output: [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
 Explanation: The input board is shown above and the only valid solution is shown below:


  

 Constraints:

 board.length == 9
 board[i].length == 9
 board[i][j] is a digit or '.'.
 It is guaranteed that the input board has only one solution.
 */

class SudokuSolution {
    func solveSudoku(_ board: inout [[Character]]) {
        var nchars = [Character]()
        
        for i in 1...9 {
           nchars.append(Character("\(i)"))
        }
        solveSudokuBoard(&board, nchars)
    }
    
    @discardableResult
    private func solveSudokuBoard(_ board: inout [[Character]], _ nchars: [Character]) -> Bool {
        
        let row = board.count
        let col = board[0].count
        
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == "." {
                    for char in nchars {
                        if isValid(board, i, j, char) {
                            board[i][j] = char
                            if solveSudokuBoard(&board, nchars) {
                                return true
                            } else {
                                board[i][j] = "."
                            }
                        }
                    }
                    
                    return false
                }
            }
        }
        return true
        
    }
    
    private func isValid(_ board:  [[Character]], _ row: Int, _ col: Int, _ char: Character) -> Bool {
        for i in 0..<9 {
            //check row
            if board[row][i] == char {return false}
            
            // check col
            if board[i][col] == char {return false}
            
            let r = 3 * (row/3) + (i/3)
            let c = 3 * (col/3) + (i%3)
            if board[r][c] == char {return false}
        }
        
        return true
    }
    
}

class ValidSudokuSolution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowSet = Array(repeating: Set<Character>(), count: board.count)
        var colSet = Array(repeating: Set<Character>(), count: board[0].count)
        var boxSet = [String: Set<Character>]()
        
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                let char = board[row][col]
                
                if char == "." { continue }
                
                if rowSet[row].contains(char) {
                    return false
                }
                
                rowSet[row].insert(char)
                
                if colSet[col].contains(char) {
                    return false
                }
                
                colSet[col].insert(char)
                
                if boxSet[boxKey(row,col), default: Set<Character>()].contains(char) {
                    return false
                }
                
                boxSet[boxKey(row,col), default: Set<Character>()].insert(char)
            }
        }
        
        return true
    }
    
    func boxKey(_ row: Int, _ col: Int) -> String { "\(row/3)-\(col/3)" }
}
    
