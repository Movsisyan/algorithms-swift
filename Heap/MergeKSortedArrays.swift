import Heap

// MARK: - Challenge description
// You are given an array of sorted arrays and you need to merge them.
// Consider the following input: array = [[1, 4, 5], [1, 3, 4], [2, 6]]

// MARK: - Implementation
// I will create a `Helper` data structure that will store the first value of each array, the reference of that array, and the index of the element in that array.
struct Helper: Comparable {
  var val: Int // value of the item in array at the index j
  var i: Int // index of the array in the input
  var j: Int // index of the element in array
  
  // min-heap will use the value to decide which item is the lowest one
  static func < (lhs: Helper, rhs: Helper) -> Bool {
    return lhs.val < rhs.val
  }
}

func mergeKSortedArrays(_ input: [[Int]]) -> [Int] {
  var heap = Heap<Helper>()
  for (index, arr) in input.enumerated() {
    if !arr.isEmpty {
      // Add first item of each array in the heap and keep index of the array and index of the element in array
      heap.push(Helper(val: arr[0], i: index, j: 0))
    }
  }
  
  var res = [Int]()
  
  // In the heap, we are keeping the minimum not processed value from each array and reference to that array. On each iteration, we are fetching the root item and adding the value of that item to the result. Then, we are checking if the fetched array is fully processed. If it's not it means that we must add that array info back to the stack with the next value and element index.
  while !heap.isEmpty {
    guard let helper = heap.pop() else {
      return []
    }
    
    // Adding value to the result
    res.append(helper.val)
    
    // Check is j in the last index or is there some items in array that I haven't used
    if helper.j + 1 < input[helper.i].count {
      // Add info back to the heap to process the rest of items in this array
      heap.push(Helper(val: input[helper.i][helper.j], i: helper.i, j: helper.j + 1))
    }
  }
  
  return res
}

// MARK: - Time & Space complexity
// The space complexity for the algorithm (not considering the return value is O(k) where k is the number of arrays
// The time complexity of this algorithm O(n * log(k)) where n is the number of all elements.

