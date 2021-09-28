import Heap

// MARK: - Implementation
func heapSort(_ input: [Int]) -> [Int] {
  var heap = Heap<Int>(input)
  var sorted = [Int]()
  
  while !heap.isEmpty {
    if let item = heap.pop() {
      sorted.append(item)
    }
  }
  
  return sorted
}

// MARK: - Extending array to use it on all comparable types
extension Array where Element: Comparable {
  func heapSort() -> [Element] {
    var heap = Heap<Element>(self)
    var sorted = [Element]()
    
    while !heap.isEmpty {
      if let item = heap.pop() {
        sorted.append(item)
      }
    }
    
    return sorted
  }
}

// After adding array extension you can invoke heapSort() on an array that consists of a comparable type
let sortedNums = [-4, 9, -3, 89, 0, 0, 2].heapSort()
let sortedWords = ["dune", "is", "an", "awesome", "movie"].heapSort()

// MARK: - Time & Space complexity
// The space complexity is n as all the elements must be placed into the heap before popping them out.
// The time complexity is O(n * log(n)) because we have n elements and each pop method takes logarithmic time.
// So the speed is the same as in merge sort and quicksort.

