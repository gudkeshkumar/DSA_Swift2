import Foundation

func recursiveBinarySearch(array: [Int], lower: Int, upper: Int, value: Int) -> Bool {
    if lower <= upper {
        let mid = lower + (upper - lower) / 2
        if array[mid] == value {
            return true
        }
        
        if value > array[mid] {
            return recursiveBinarySearch(array: array, lower: mid + 1, upper: upper, value: value)
        } else {
            return recursiveBinarySearch(array: array, lower: lower, upper: mid - 1, value: value)
        }
        
    }
    return false
}

public func binarysearch(_ element: Int, in array: [Int]) -> Int {
    var start = 0
    var end = array.count - 1
    
    while start < end {
        let mid = start + ((end - start) / 2)
        
        let val = array[mid]
        
        if element == val { return mid }
        else if element > val { start = mid + 1}
        else { end = mid - 1 }
    }
    
    return -1
}

public func firstOccurance(_ element: Int, array: [Int]) -> Int {
    var start = 0
    var end = array.count - 1
    var res = -1
    
    while start <= end {
        let mid  = start + ((end - start) / 2)
        let val = array[mid]
        if element <= val {
            res = mid
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return res
}

public func lastOccurance(_ element: Int, array: [Int]) -> Int {
    var start = 0
    var end = array.count - 1
    var res = -1
    
    while start <= end {
        let mid  = start + ((end - start) / 2)
        let val = array[mid]
        
        if element >= val {
            res = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return res
}

public func findNumberOfRotations(_ array: [Int]) -> Int {
    var low = 0
    var high = array.count - 1
    let n = array.count
    
    while low <= high {
        if array[low] < array[high] { return low }
        let mid = (low + high) / 2
        let next = (mid + 1) % n
        let prev = (mid + n - 1) % n
        if array[mid] < array[prev] && array[mid] < array[next] {
            return mid
        } else if array[mid] < array[high]// right array is sorted
        {
            high = mid - 1
        } else {
            low = mid + 1
        }
        
    }
    return 0
}

public func findinRotatedArray(element: Int, in array: [Int]) -> Int {
    var low = 0
    var high = array.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if array[mid] == element { return mid }
        // right half is sorted
        else if array[mid] < array[high] {
            
            if element > array[mid] && element <= array[high] {
                low = mid + 1
            } else {
                high = mid - 1
            }
            
        } else// left half is sorted
        {
            if element >= array[low] && element < array[mid] {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
    }
    
    return -1
}

public func findFloor(of element: Int, in array: [Int]) -> Int {
    var res = -1
    var low = 0
    var high = array.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        if element >= array[mid] {
            res = mid
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return res
}

