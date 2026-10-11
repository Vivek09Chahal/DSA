import Foundation
import Swift

class mergeSort {

    func Sort(array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }

        let middle = array.count / 2
        let leftArray = Array(array[0..<middle])
        let rightArray = Array(array[middle..<array.count])

        return merge(left: Sort(array: leftArray), right: Sort(array: rightArray))
    }

    func merge(left: [Int], right: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var result: [Int] = []
        result.reserveCapacity(left.count + right.count)

        while (leftIndex <  left.count) && (rightIndex < right.count) {
            if left[leftIndex] < right[rightIndex] {
                result.append(left[leftIndex])
                leftIndex += 1
            } else {
                result.append(right[rightIndex])
                rightIndex += 1
            }
        }

        if leftIndex < left.count {
            result.append(contentsOf: left[leftIndex...])
        } 
        if rightIndex < right.count {
            result.append(contentsOf: right[rightIndex...])
        }
        return result
    }
}

let sorter = mergeSort()
let numbers = [38, 27, 43, 3, 9, 82, 10]
let sortedNumbers = sorter.Sort(array: numbers)

print(sortedNumbers)
