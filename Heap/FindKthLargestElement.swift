import Heap

// MARK: - Challenge description
// We need to find the k-th largest element in an unsorted array.
// Consider the following inputs: array = [4, -9, 89, 0, -6, 89], k = 2

// MARK: - Implementation
func findKthLargestElement(_ input: [Int], _ k: Int) -> Int? {
  if k > input.count {
    return nil
  }
  
  var minHeap = Heap<Int>()
  
  for num in input {
    minHeap.push(num)
    
    if minHeap.count > k {
      minHeap.pop()
    }
  }
  
  return minHeap.peek
}

// MARK: - Time & Space complexity
// The space complexity is O(k) as min-heap is keeping k items.
// The time complexity of this algorithm is O(n * log(k)) because we are iterating through n items and the heap keeps at most k items.
